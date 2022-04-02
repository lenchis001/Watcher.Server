namespace Watcher.BLL.Models.Users
{
	public class User : IdAware
	{
		public string Email { get; set; }
		public string PasswordHash { get; set; }
	}
}
