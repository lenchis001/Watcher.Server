using Watcher.DAL.Database.Models;
using System.Threading.Tasks;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
	public interface IUserRepository : IRepository<User>
	{
		Task<User> GetByCredsAsync(string email, string passwordHash);
		Task<bool> AnyBySensitiveUserDataAsync(string email);
	}
}
