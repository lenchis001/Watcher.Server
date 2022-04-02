using System;
namespace Watcher.BLL.Models.Notificators
{
    public class AddNotificator
    {
        public int UserId { get; set; }

        public Notificator Type { get; set; }

        public string CustomData { get; set; }
    }
}
