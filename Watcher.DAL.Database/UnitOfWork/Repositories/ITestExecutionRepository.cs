using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Watcher.DAL.Database.Models;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
    public interface ITestExecutionRepository : IRepository<TestExecution>
	{
		Task<ICollection<TestExecution>> GetAllAsync(int testId);
        Task<ICollection<TestExecution>> GetLastTwoAsync(int testId);
    }
}
