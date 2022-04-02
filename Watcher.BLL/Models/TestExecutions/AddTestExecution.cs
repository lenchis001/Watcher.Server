using System;
namespace Watcher.BLL.Models.TestExecutions
{
    public class AddTestExecution
    {
        public DateTime DateTime { get; set; }

        public string Log { get; set; }

        public bool IsSuccessful { get; set; }

        public int TestId { get; set; }
    }
}
