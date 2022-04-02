using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Unity.Microsoft.DependencyInjection;

namespace Watcher
{
	public class Program
	{
		public static void Main(string[] args)
		{
			CreateHostBuilder(args).Build().Run();
		}

		public static IHostBuilder CreateHostBuilder(string[] args)
		{
			return Host.CreateDefaultBuilder(args)
				.UseUnityServiceProvider()
				.ConfigureWebHostDefaults(webBuilder =>
				{
					webBuilder.UseStartup<Startup>();
				});
		}
	}
}
