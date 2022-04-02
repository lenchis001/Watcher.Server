using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Watcher.Resources;

namespace Watcher.Models.v1.Users
{
	[DataContract]
	public class AddUserData
	{
		[Required]
		[RegularExpression(Constants.EmailRegex)]
		[DataMember(Name ="email")]
		public string Email { get; set; }

		[Required]
		[RegularExpression(Constants.PasswordRegex)]
		[DataMember(Name = "password")]
		public string Password { get; set; }
	}
}
