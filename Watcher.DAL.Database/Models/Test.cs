using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
	public class Test : IdAware
	{
		[Required]
		public string Name { get; set; }
		[Required]
		public string Script { get; set; }
		public User User { get; set; }
		public int UserId { get; set; }
		[Required]
		public string Cron { get; set; }

		public ICollection<NotificatorBinding> NotificatorBindings { get; set; }
	}
}
