using Watcher.BLL.Models;
using Watcher.BLL.Models.Tests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.BLL.Services
{
	public interface ITestService : ICrudService<Test, AddTestData>
	{
		Task<DefaultDataFetchResult<ICollection<Test>>> GetAllAsync(int userId);
		Task<DefaultFetchResult> AddAsync(AddTestData entity, int userId);
		Task<DefaultFetchResult> UpdateAsync(Test entity, int userId);
		Task<DefaultFetchResult> DeleteAsync(int id, int userId);

		Task InitAsync();
	}
}
