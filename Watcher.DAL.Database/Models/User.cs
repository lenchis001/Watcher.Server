using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
	public class User : IdAware
	{
		[Required]
		public string Email { get; set; }
		public ICollection<Test> Tests { get; set; }
		public ICollection<Notificator> Notificators { get; set; }
		public string PasswordHash { get; set; }
	}
}
