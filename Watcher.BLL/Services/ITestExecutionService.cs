using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Watcher.BLL.Models;
using Watcher.BLL.Models.TestExecutions;

namespace Watcher.BLL.Services
{
    public interface ITestExecutionService: ICrudService<TestExecution, AddTestExecution>
    {
        Task InitAsync();
        Task<DefaultDataFetchResult<ICollection<TestExecution>>> GetLastTwoAsync(int testId);
    }
}
