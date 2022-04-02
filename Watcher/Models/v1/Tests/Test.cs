using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Watcher.Resources;

namespace Watcher.Models.v1.Tests
{
	[DataContract]
	public class Test : IdAware
	{
		[Required]
		[RegularExpression(Constants.NameRegex)]
		[DataMember(Name = "name")]
		public string Name { get; set; }

		[Required]
		[DataMember(Name = "script")]
		public string Script { get; set; }

		[Required]
		[DataMember(Name = "cron")]
		public string Cron { get; set; }
	}
}
