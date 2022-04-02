using System;
using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
    public class NotificatorBinding: IdAware
    {
        [Required]
        public int TestId { get; set; }

        public Test Test { get; set; }

        [Required]
        public int NotificatorId { get; set; }

        public Notificator Notificator { get; set; }
    }
}
