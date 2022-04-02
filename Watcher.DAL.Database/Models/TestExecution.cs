using System;
using System.ComponentModel.DataAnnotations;

namespace Watcher.DAL.Database.Models
{
    public class TestExecution: IdAware
    {
        [Required]
        public DateTime DateTime { get; set; }

        [Required]
        public string Log { get; set; }

        [Required]
        public bool IsSuccessful { get; set; }

        [Required]
        public int TestId { get; set; }

        public Test Test { get; set; }
    }
}
