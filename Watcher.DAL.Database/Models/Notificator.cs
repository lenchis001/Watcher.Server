using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
    public class Notificator: IdAware
    {
        [Required]
        public int UserId { get; set; }

        public User User { get; set; }

        [Required]
        public string Type { get; set; }

        [Required]
        public string CustomData { get; set; }

        public ICollection<NotificatorBinding> NotificatorBindings { get; set; }
    }
}
