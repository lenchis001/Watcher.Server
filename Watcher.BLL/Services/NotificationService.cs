using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using AutoMapper;
using Taskus;
using Watcher.BLL.Models;
using Watcher.BLL.Models.Notificators;
using Watcher.DAL.Database.UnitOfWork.Repositories;

namespace Watcher.BLL.Services
{
    public class NotificationService : CrudService<Notificator, AddNotificator, INotificatorRepository, DAL.Database.Models.Notificator>, INotificationService
    {
        public NotificationService(
            IMapper mapper,
            INotificatorRepository notificatorRepository) :
            base(mapper, notificatorRepository)
        {
        }

        public async Task<DefaultFetchResult> NotifyAsync(int testId, string testName, ITestExecutionService testExecutionService)
        {
            var (dalNotificatorsFetchResult, testExecutionsFetchResult) = await TaskManagement.WhenAll(
                GetAllAsync(testId),
                testExecutionService.GetLastTwoAsync(testId)
            );
            var notificatorsfetchResult = _mapper.Map<DefaultDataFetchResult<ICollection<Notificator>>>(dalNotificatorsFetchResult);

            if (notificatorsfetchResult.Error != ErrorCode.OK && testExecutionsFetchResult.Error != ErrorCode.OK)
            {
                return DefaultFetchResult.UnknownErrorResult;
            }

            if (testExecutionsFetchResult.Data.Count() < 2 || testExecutionsFetchResult.Data.Select(a => a.IsSuccessful).Aggregate((a, b) => a == b))
            {
                return DefaultFetchResult.OkResult;
            }

            var isSuccessful = testExecutionsFetchResult.Data.First().IsSuccessful;

            var results = await Task.WhenAll(notificatorsfetchResult.Data.Select(n =>
            {
                switch (n.Type)
                {
                    case NotificatorType.EMAIL:
                        return ProcessEmailNotification(n.CustomData, testName, testExecutionsFetchResult.Data.First().Log, isSuccessful);
                    default:
                        return Task.FromResult(DefaultFetchResult.OkResult);
                }
            })
            .ToArray());

            return results.FirstOrDefault(r => r.Error != ErrorCode.OK) ?? DefaultFetchResult.OkResult;
        }

        private async Task<DefaultFetchResult> ProcessEmailNotification(string email, string name, string logs, bool isSuccessful)
        {
            try
            {
                var messageColor = isSuccessful ? "green" : "red";
                var messageHeader = isSuccessful ? "Success!" : "Fail!";
                var statusMessage = isSuccessful ? "finished succesfully!" : "failed";
                MailMessage message = new MailMessage("watcher.service@mail.ru", email)
                {
                    Subject = "Test execution result",
                    Body = $"<div style=\"background: {messageColor};\">&nbsp;</div><div><strong>{messageHeader}</strong></div><div>&nbsp;</div><div>Dear user! Your test \"{name}\" {statusMessage}!</div><div>Logs:</div><div>{logs}</div><div style=\"background: {messageColor};\">&nbsp;</div>",
                    IsBodyHtml = true
                };

                using (SmtpClient client = new SmtpClient("smtp.mail.ru")
                {
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential("watcher.service@mail.ru", "7XYTG5H5yQUNwk91y7K3"),
                    EnableSsl = true
                })
                {
                    client.Send(message);
                }

                return DefaultFetchResult.OkResult;
            }
            catch (Exception)
            {
                return DefaultFetchResult.UnknownErrorResult;
            }
        }

        private async Task<DefaultDataFetchResult<ICollection<Notificator>>> GetAllAsync(int testId)
        {
            var result = DefaultDataFetchResult<ICollection<Notificator>>.UnknownErrorResult;

            try
            {
                var dalEntities = await _repository.GetAllAsync(testId);

                result.Data = _mapper.Map<ICollection<Notificator>>(dalEntities);
                result.Error = ErrorCode.OK;
            }
            catch { }

            return result;
        }
    }
}
