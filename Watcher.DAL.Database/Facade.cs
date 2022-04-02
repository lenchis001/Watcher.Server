using Watcher.DAL.Database.UnitOfWork.Repositories;
using Unity;

namespace Watcher.DAL.Database
{
	public class Facade
	{
		public static void SetupDependencies(IUnityContainer container)
		{
			container.RegisterType<IUserRepository, UserRepository>();
			container.RegisterType<ITestRepository, TestRepository>();
			container.RegisterType<ITestExecutionRepository, TestExecutionRepository>();
			container.RegisterType<INotificatorRepository, NotificatorRepository>();
			container.RegisterType<INotificatorBindingRepository, NotificatorBindingRepository>();
		}
	}
}
