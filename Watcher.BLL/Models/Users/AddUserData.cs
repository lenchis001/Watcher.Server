using System.Runtime.Serialization;

namespace Watcher.BLL.Models.Users
{
	public class AddUserData
	{
		public string Email { get; set; }
		public string PasswordHash { get; set; }
	}
}
