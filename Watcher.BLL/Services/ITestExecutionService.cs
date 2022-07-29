using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Watcher.BLL.Models;
using Watcher.BLL.Models.TestExecutions;
using Watcher.BLL.Models.Tests;

namespace Watcher.BLL.Services
{
    public interface ITestExecutionService: ICrudService<TestExecution, AddTestExecution>
    {
        Task<DefaultDataFetchResult<ICollection<TestExecution>>> GetLastTwoAsync(int testId);
        Task<DefaultDataFetchResult<ICollection<TestExecution>>> GetLatestAsync(int userId);

        Task ScheduleTest(Test test);
        Task DeleteTestSchedule(int testId);
        Task UpdateScheduledJob(Test test);
    }
}
