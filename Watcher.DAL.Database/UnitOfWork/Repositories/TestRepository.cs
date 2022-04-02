using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
	internal class TestRepository : EfRepository<Test>, ITestRepository
	{
		public async Task<ICollection<Test>> GetAllAsync(int userId)
		{
			using (var context = new EfContext())
			{
				return await context
					.Tests
					.AsNoTracking()
					.Where(c => c.UserId == userId)
					.ToArrayAsync();
			}
		}

		public async Task<bool> IsRelatedToUser(int id, int userId)
		{
			using (var context = new EfContext())
			{
				return await context
					.Tests
					.AnyAsync(a => a.Id == id && a.UserId == userId);
			}
		}
	}
}