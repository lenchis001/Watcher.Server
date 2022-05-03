using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.Extensions.EnumMapping;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Watcher.BLL.Services;
using Watcher.Converters;
using Unity;

namespace Watcher
{
    public class Startup
	{
		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
		}

		public IConfiguration Configuration { get; }

		// This method gets called by the runtime. Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddControllersWithViews().AddJsonOptions(options =>
			{
				options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());
				options.JsonSerializerOptions.Converters.Add(new TimeSpanJsonConverter());
			});

			// In production, the React files will be served from this directory
			services.AddSpaStaticFiles(configuration =>
			{
				configuration.RootPath = "client_app/build/web";
			});

			services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
				.AddCookie(options =>
				{
					options.Events.OnRedirectToLogin = context =>
					{
						context.Response.Headers["Location"] = context.RedirectUri;
						context.Response.StatusCode = 401;
						return Task.CompletedTask;
					};
				});
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
				app.UseCors(policy =>
				{
					policy.AllowAnyOrigin();
					policy.AllowAnyHeader();
				});
			}
			else
			{
				app.UseExceptionHandler("/Error");
			}

			app.UseStaticFiles();
			app.UseSpaStaticFiles();

			app.UseRouting();

			app.UseAuthentication();
			app.UseAuthorization();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapControllerRoute(
					name: "default",
					pattern: "{controller}/{action=Index}/{id?}");

				endpoints.MapDefaultControllerRoute()
					.AllowAnonymous();
			});

			app.UseSpa(spa =>
			{
				spa.Options.SourcePath = "client_app";
			});
		}

		public void ConfigureContainer(IUnityContainer container)
		{
			BLL.Facade.SetupDependencies(container);

			container.RegisterInstance(SetupMapper(container.Resolve<IHashService>()));

			BLL.Facade.PostSetup(container);
		}

		private IMapper SetupMapper(IHashService hashService)
		{
			MapperConfiguration config = new MapperConfiguration(cfg => RegisterMappings(cfg, hashService));

			config.AssertConfigurationIsValid();

			return new Mapper(config);
		}

		private void RegisterMappings(IMapperConfigurationExpression mapperConfiguration, IHashService hashService)
		{
			mapperConfiguration.EnableEnumMappingValidation();

			BLL.Facade.RegisterMappings(mapperConfiguration);

			mapperConfiguration.CreateMap<BLL.Models.DefaultFetchResult, ActionResult>()
				.ConvertUsing<Converters.DefaultFetchResultToActionResult>();

			// Common
			// Authentication
			mapperConfiguration.CreateMap<Models.v1.Users.AddUserData, BLL.Models.Users.AddUserData>()
				.ForMember(opt => opt.PasswordHash, config => config.MapFrom(dst => hashService.MakeHash(dst.Password)));
			mapperConfiguration.CreateMap<BLL.Models.Users.User, Models.v1.Users.User>()
				.ForMember(u => u.Password, opt => opt.Ignore())
				.ReverseMap();
			mapperConfiguration.CreateMap<
				BLL.Models.DefaultDataFetchResult<BLL.Models.Users.User>,
				ActionResult<Models.v1.Users.User>>()
				.ConvertUsing<
					Converters.DefaultDataFetchResultToActionResult<
						BLL.Models.Users.User,
						Models.v1.Users.User
					>
				>();
			mapperConfiguration.CreateMap<long, DateTime>()
				.ConstructUsing(ms => DateTimeOffset.FromUnixTimeMilliseconds(ms).DateTime)
				.ReverseMap()
				.ConstructUsing(dateTime => new DateTimeOffset(dateTime, TimeSpan.Zero).ToUnixTimeMilliseconds());
			mapperConfiguration.CreateMap<double, TimeSpan>()
				.ConstructUsing(m => TimeSpan.FromMinutes(m))
				.ReverseMap()
				.ConstructUsing(timeSpan => timeSpan.TotalMinutes);

			// Tests
			mapperConfiguration.CreateMap<BLL.Models.Tests.Test, Models.v1.Tests.Test>()
				.ReverseMap();
			mapperConfiguration.CreateMap<Models.v1.Tests.AddTestData, BLL.Models.Tests.AddTestData>()
				.ForMember(opt => opt.UserId, config => config.Ignore());
			mapperConfiguration.CreateMap<
				BLL.Models.DefaultDataFetchResult<ICollection<BLL.Models.Tests.Test>>,
				ActionResult<ICollection<Models.v1.Tests.Test>>>()
				.ConvertUsing<
					Converters.DefaultDataFetchResultToActionResult<
						ICollection<BLL.Models.Tests.Test>,
						ICollection<Models.v1.Tests.Test>
					>
				>();
		}
	}
}
