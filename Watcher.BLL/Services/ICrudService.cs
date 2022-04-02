using Watcher.BLL.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.BLL.Services
{
	public interface ICrudService<T, ADD_TYPE>
	{
		Task<DefaultDataFetchResult<ICollection<T>>> GetAllAsync();
		Task<DefaultDataFetchResult<T>> GetByIdAsync(int id);
		Task<DefaultFetchResult> AddAsync(ADD_TYPE entity);
		Task<DefaultFetchResult> DeleteAsync(int id);
		Task<DefaultFetchResult> UpdateAsync(T entity);
	}
}
