namespace Watcher.BLL.Models.Tests
{
	public class Test : IdAware
	{
		public string Name { get; set; }
		public string Script { get; set; }
		public int UserId { get; set; }
		public string Cron { get; set; }
	}
}
