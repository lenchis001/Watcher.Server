using Watcher.DAL.Database.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
	public interface ITestRepository : IRepository<Test>
	{
		Task<ICollection<Test>> GetAllAsync(int userId);

		Task<bool> IsRelatedToUser(int id, int userId);
	}
}