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

        public async Task<ICollection<TestExecution>> GetLatestAsync(int userId)
		{
			using (var context = new EfContext())
			{
				return await context
					.TestExecutions
					.FromSqlRaw("SELECT te.Id, te.DateTime, te.Log, te.IsSuccessful, te.TestId FROM watcher.TestExecutions te inner join(SELECT TestId, MAX(DateTime) as DateTime FROM watcher.TestExecutions GROUP BY TestId) j ON te.TestId = j.TestId AND te.DateTime = j.DateTime;")
					.AsNoTracking()
					.ToArrayAsync();
			}
		}
    }
}
