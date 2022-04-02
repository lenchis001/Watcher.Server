using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
	public class IdAware
	{
		[Required]
		[Key]
		public int Id { get; set; }
	}
}
