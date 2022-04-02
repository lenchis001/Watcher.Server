namespace Watcher.BLL.Models.Users
{
	public enum ChangePasswordErrorCode
	{
		OK,
		UNKNOWN,
		DOESNT_MEET_RULES,
		WRONG_CURRENT_PASSWORD
	}
}
