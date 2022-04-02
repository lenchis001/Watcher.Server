// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

using Watcher.Resources;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Watcher.Models.v1.Users
{
	[DataContract]
	public class SignInResuest
	{
		[Required]
		[RegularExpression(Constants.EmailRegex)]
		[DataMember(Name = "email")]
		public string Email { get; set; }

		[Required]
		[RegularExpression(Constants.PasswordRegex)]
		[DataMember(Name = "password")]
		public string Password { get; set; }
	}
}
