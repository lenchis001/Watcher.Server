using System;
using System.Threading.Tasks;
using Watcher.BLL.Models;

namespace Watcher.BLL.Services
{
    public interface INotificationService
    {
        Task<DefaultFetchResult> NotifyAsync(int testId, string testName, ITestExecutionService testExecutionService);
    }
}
