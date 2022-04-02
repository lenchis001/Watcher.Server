using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Watcher.Models.v1
{
	[DataContract]
	public class IdAware
	{
		[Required]
		[DataMember(Name = "id")]
		public int Id { get; set; }
	}
}
