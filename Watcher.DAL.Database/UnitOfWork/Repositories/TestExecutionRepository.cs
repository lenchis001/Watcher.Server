using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
    public class TestExecutionRepository : EfRepository<TestExecution>, ITestExecutionRepository
    {
        public async Task<ICollection<TestExecution>> GetAllAsync(int testId)
		{
			using (var context = new EfContext())
			{
				return await context
					.TestExecutions
					.AsNoTracking()
					.Where(c => c.TestId == testId)
					.ToArrayAsync();
			}
		}

        public async Task<ICollection<TestExecution>> GetLastTwoAsync(int testId)
		{
			using (var context = new EfContext())
			{
				return await context
					.TestExecutions
					.AsNoTracking()
					.Where(c => c.TestId == testId)
					.OrderByDescending(c => c.Id)
					.Take(2)
					.ToArrayAsync();
			}
		}
    }
}
