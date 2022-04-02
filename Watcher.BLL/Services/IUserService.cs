using Watcher.BLL.Models;
using Watcher.BLL.Models.Users;
using System.Threading.Tasks;

namespace Watcher.BLL.Services
{
	public interface IUserService : ICrudService<User, AddUserData>
	{
		Task<DefaultDataFetchResult<User>> RegisterAsync(AddUserData user);
		Task<ChangePasswordErrorCode> ChangePasswordAsync(int id, string currentPassword, string newPassword);
		Task<User> GetByCredsAsync(string email, string password);
	}
}
