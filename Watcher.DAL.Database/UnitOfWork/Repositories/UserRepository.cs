using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;
using System.Threading.Tasks;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
	public class UserRepository : EfRepository<User>, IUserRepository
	{
		public async Task<User> GetByCredsAsync(string email, string passwordHash)
		{
			using (var context = new EfContext())
			{
				return await context
					.Users
					.AsNoTracking()
					.FirstOrDefaultAsync(u => u.Email == email && u.PasswordHash == passwordHash);
			}
		}

		public async Task<bool> AnyBySensitiveUserDataAsync(string email)
		{
			using (var context = new EfContext())
			{
				return await context
					.Users
					.AsNoTracking()
					.AnyAsync(u =>
						EF.Functions.Like(u.Email, email));
			}
		}
	}
}
