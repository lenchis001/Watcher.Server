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

        private readonly ITestService _testService;
        private readonly INotificationService _notificationService;

        public TestExecutionService(
            ITestService testService,
            IMapper mapper,
            ITestExecutionRepository repository,
            INotificationService notificationService):
            base(mapper, repository)
        {
            _testService = testService;
            _notificationService = notificationService;
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

        public async Task InitAsync()
        {
            DefaultDataFetchResult<ICollection<Test>> testsFetchResult;

            do
            {
                testsFetchResult = await _testService.GetAllAsync();

                if (testsFetchResult.Error != ErrorCode.OK)
                {
                    await Task.Delay(TimeSpan.FromSeconds(10));
                }
            } while (testsFetchResult.Error != ErrorCode.OK);

            var m = new JobDataMap();
            m.Put(nameof(ITestExecutionService), this);
            m.Put(nameof(INotificationService), _notificationService);

            _triggers = testsFetchResult.Data
                .ToDictionary(
                    t => JobBuilder.Create<TestJob>()
                                   .UsingJobData(nameof(Test.Name), t.Name)
                                   .UsingJobData(nameof(Test.Script), t.Script)
                                   .UsingJobData(nameof(Test.Id), t.Id)
                                   .UsingJobData(m)
                                   .Build(),
                    t => new[] { TriggerBuilder.Create()
                                       .WithIdentity(t.Id.ToString(), t.UserId.ToString())
                                       .StartNow()
                                       .WithCronSchedule(t.Cron)
                                       .Build()
                    } as IReadOnlyCollection<ITrigger>
                );

            await InitScheduler();
        }

        private async Task InitScheduler()
        {
            StdSchedulerFactory factory = new StdSchedulerFactory();

            IScheduler scheduler = await factory.GetScheduler();
            await scheduler.Start();

            await scheduler.ScheduleJobs(_triggers, true);
        }
    }
}
