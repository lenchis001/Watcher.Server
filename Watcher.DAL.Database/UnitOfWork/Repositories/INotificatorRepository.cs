using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Watcher.DAL.Database.Models;

namespace Watcher.DAL.Database.UnitOfWork.Repositories
{
    public interface INotificatorRepository: IRepository<Notificator>
    {
        Task<ICollection<Notificator>> GetAllAsync(int testId);
    }
}
