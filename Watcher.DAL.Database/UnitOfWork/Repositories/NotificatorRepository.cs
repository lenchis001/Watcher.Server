using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Watcher.DAL.Database.Models;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
    public class NotificatorRepository : EfRepository<Notificator>, INotificatorRepository
    {
        public async Task<ICollection<Notificator>> GetAllAsync(int testId)
        {
            using(var context = new EfContext())
            {
                return await context.Notificators
                    .AsNoTracking()
                    .Where(n => n.NotificatorBindings.Any(nb => nb.TestId == testId))
                    .ToArrayAsync();
            }
        }
    }
}
