using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
	public class EfRepository<T> : IRepository<T> where T : IdAware
	{
		public async Task<T> AddAsync(T entity)
		{
			T result;

			using (var context = new EfContext())
			{
				var addResult = await context.AddAsync(entity);
				result = addResult.Entity;

				await context.SaveChangesAsync();
			}

			return result;
		}

		public async Task DeteleAsync(int id)
		{
			using (var context = new EfContext())
			{
				T entity = await context
					.Set<T>()
					.FirstOrDefaultAsync(e => e.Id == id);

				if (entity == default)
				{
					throw new KeyNotFoundException();
				}

				context.Remove(entity);

				await context.SaveChangesAsync();
			}
		}

		public async Task<ICollection<T>> GetAllAsync()
		{
			ICollection<T> result;

			using (var context = new EfContext())
			{
				result = await context
					.Set<T>()
					.AsNoTracking()
					.ToArrayAsync();
			}

			return result;
		}

		public async Task<T> GetByIdAsync(int id)
		{
			T result;

			using (var context = new EfContext())
			{
				result = await context
					.Set<T>()
					.AsNoTracking()
					.FirstOrDefaultAsync(e => e.Id == id);
			}

			return result;
		}

		public async Task<T> UpdateAsync(T entity)
		{
			T result;

			using (var context = new EfContext())
			{
				result = context.Update(entity).Entity;

				await context.SaveChangesAsync();
			}

			return result;
		}
	}
}
