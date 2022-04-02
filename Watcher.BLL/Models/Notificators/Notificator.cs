namespace Watcher.BLL.Models.Notificators
{
    public class Notificator: IdAware
    {
        public int UserId { get; set; }

        public NotificatorType Type { get; set; }

        public string CustomData { get; set; }
    }
}
