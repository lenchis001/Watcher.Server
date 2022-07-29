using AutoMapper;
using Watcher.BLL.Models;
using Watcher.BLL.Models.Users;
using Watcher.BLL.Models.Tests;
using Watcher.BLL.Services;
using System;
using Unity;
using Watcher.BLL.Models.Js.Fetch;
using System.Net.Http;
using Watcher.BLL.Models.TestExecutions;
using Watcher.BLL.Models.Notificators;

namespace Watcher.BLL
{
	public static class Facade
	{
		public static void SetupDependencies(IUnityContainer container)
		{
			DAL.Database.Facade.SetupDependencies(container);

			container.RegisterSingleton<IHashService, HashService>();
			container.RegisterSingleton<IUserService, UserService>();
			container.RegisterSingleton<ITestExecutionService, TestExecutionService>();
			container.RegisterSingleton<ITestService, TestService>();
			container.RegisterSingleton<INotificationService, NotificationService>();
		}

		public static void PostSetup(IUnityContainer container)
        {
			container.Resolve<ITestService>().InitAsync();
		}

		public static void RegisterMappings(IMapperConfigurationExpression cfg)
		{
			cfg
				.CreateMap<TimeSpan, double>()
				.ConstructUsing(a => a.TotalMinutes)
				.ReverseMap()
				.ConstructUsing(a => TimeSpan.FromMinutes(a));

			// Common
			cfg.CreateMap<DAL.Database.Models.User, User>().ReverseMap();
			cfg.CreateMap<AddUserData, DAL.Database.Models.User>()
				.ForMember(opt => opt.Tests, config => config.Ignore())
				.ForMember(opt => opt.Notificators, config => config.Ignore())
				.ForMember(opt => opt.Id, config => config.Ignore());

			cfg.CreateMap<DAL.Database.Models.Test, Test>().ReverseMap();
			cfg.CreateMap<AddTestData, DAL.Database.Models.Test>()
				.ForMember(dst => dst.User, opt => opt.Ignore())
				.ForMember(dst => dst.NotificatorBindings, opt => opt.Ignore())
				.ForMember(dst => dst.Id, opt => opt.Ignore());

			cfg.CreateMap<DAL.Database.Models.TestExecution, TestExecution>().ReverseMap();
			cfg.CreateMap<AddTestExecution, DAL.Database.Models.TestExecution>()
				.ForMember(dst => dst.Test, opt => opt.Ignore())
				.ForMember(dst => dst.Id, opt => opt.Ignore());

			cfg.CreateMap<DAL.Database.Models.Notificator, Notificator>().ReverseMap();
			cfg.CreateMap<AddNotificator, DAL.Database.Models.Notificator>()
				.ForMember(dst => dst.NotificatorBindings, opt => opt.Ignore())
				.ForMember(dst => dst.User, opt => opt.Ignore())
				.ForMember(dst => dst.Id, opt => opt.Ignore());

			cfg.CreateMap<DAL.Database.Models.NotificatorBinding, DAL.Database.Models.NotificatorBinding>().ReverseMap();
			cfg.CreateMap<AddNotificatorBinding, DAL.Database.Models.NotificatorBinding>()
				.ForMember(dst => dst.Notificator, opt => opt.Ignore())
				.ForMember(dst => dst.Test, opt => opt.Ignore())
				.ForMember(dst => dst.Id, opt => opt.Ignore());
		}
	}
}
