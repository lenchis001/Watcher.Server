using System;
using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;

namespace Watcher.DAL.Database.UnitOfWork
{
	public class EfContext : DbContext
	{
		private static bool _isEnsured;

		public DbSet<User> Users { get; set; }
		public DbSet<Test> Tests { get; set; }
		public DbSet<TestExecution> TestExecutions { get; set; }
		public DbSet<Notificator> Notificators { get; set; }
		public DbSet<NotificatorBinding> NotificatorBindings { get; set; }

		public EfContext() : base()
		{
			if (!_isEnsured)
			{
				Database.EnsureCreated();
				_isEnsured = true;
			}
		}

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			// Tests
			modelBuilder.Entity<User>()
				.HasMany(u => u.Tests)
				.WithOne(c => c.User);

			// Notificators
			modelBuilder.Entity<User>()
				.HasMany(u => u.Notificators)
				.WithOne(c => c.User);

			// Notificators
			modelBuilder.Entity<User>()
				.HasMany(u => u.Notificators)
				.WithOne(c => c.User);

			// Notificator Bindings
			modelBuilder.Entity<Test>()
				.HasMany(u => u.NotificatorBindings)
				.WithOne(c => c.Test);
		}

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			var serverVersion = new MySqlServerVersion(new Version(8, 0, 28));
#if DEBUG
			optionsBuilder.UseMySql("server=localhost;port=3308;database=watcher;UserId=root;Password=Boost2017;CharSet=utf8", serverVersion);
#else
			var serverAddress = Environment.GetEnvironmentVariable("DATABASE_SERVER_ADDRESS");
			optionsBuilder.UseMySql($"server={serverAddress};database=watcher;UserId=root;Password=grippolek2022;CharSet=utf8", serverVersion);
#endif
		}
	}
}
