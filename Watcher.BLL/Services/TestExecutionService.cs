using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Quartz;
using Quartz.Impl;
using Watcher.BLL.Jobs;
using Watcher.BLL.Models;
using Watcher.BLL.Models.TestExecutions;
using Watcher.BLL.Models.Tests;
using Watcher.DAL.Database.UnitOfWork.Repositories;

namespace Watcher.BLL.Services
{
    public class TestExecutionService : CrudService<TestExecution, AddTestExecution, ITestExecutionRepository, DAL.Database.Models.TestExecution>, ITestExecutionService
    {
        private IReadOnlyDictionary<IJobDetail, IReadOnlyCollection<ITrigger>> _triggers;

        private readonly INotificationService _notificationService;

        private readonly TaskCompletionSource<IScheduler> _schedulerSource;

        public TestExecutionService(
            IMapper mapper,
            ITestExecutionRepository repository,
            INotificationService notificationService):
            base(mapper, repository)
        {
            _notificationService = notificationService;


            _schedulerSource = new TaskCompletionSource<IScheduler>();
            StdSchedulerFactory factory = new StdSchedulerFactory();
            factory.GetScheduler().ContinueWith((s) => {
                _schedulerSource.SetResult(s.Result);

                s.Result.Start();
            });
        }

        public async Task<DefaultDataFetchResult<ICollection<TestExecution>>> GetLastTwoAsync(int testId)
        {
            var result = DefaultDataFetchResult<ICollection<TestExecution>>.UnknownErrorResult;

            try
            {
                var dalEntities = await _repository.GetLastTwoAsync(testId);

                result.Data = _mapper.Map<ICollection<TestExecution>>(dalEntities);
                result.Error = ErrorCode.OK;
            }
            catch { }

            return result;
        }

        public async Task<DefaultDataFetchResult<ICollection<TestExecution>>> GetLatestAsync(int userId)
        {
            var result = DefaultDataFetchResult<ICollection<TestExecution>>.UnknownErrorResult;

            try
            {
                var dalEntities = await _repository.GetLatestAsync(userId);

                result.Data = _mapper.Map<ICollection<TestExecution>>(dalEntities);
                result.Error = ErrorCode.OK;
            }
            catch { }

            return result;
        }

        public async Task ScheduleTest(Test test)
        {
            var m = new JobDataMap();
            m.Put(nameof(ITestExecutionService), this);
            m.Put(nameof(INotificationService), _notificationService);

            var detail = JobBuilder.Create<TestJob>()
                                .UsingJobData(nameof(Test.Name), test.Name)
                                .UsingJobData(nameof(Test.Script), test.Script)
                                .UsingJobData(nameof(Test.Id), test.Id)
                                .UsingJobData(m)
                                .WithIdentity(test.Id.ToString())
                                .Build();
            var trigger = TriggerBuilder.Create()
                                       .WithIdentity(test.Id.ToString(), test.UserId.ToString())
                                       .StartNow()
                                       .WithCronSchedule(test.Cron)
                                       .Build();

            await(await _schedulerSource.Task).ScheduleJob(detail, trigger);
        }

        public async Task DeleteTestSchedule(int testId)
        {
            var scheduler = await _schedulerSource.Task;

            await scheduler.DeleteJob(new JobKey(testId.ToString()));
        }

        public async Task UpdateScheduledJob(Test test)
        {
            await DeleteTestSchedule(test.Id);
            await ScheduleTest(test);
        }
    }
}
