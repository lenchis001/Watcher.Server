using System;
namespace Watcher.Models.v1.TestExecutions
{
    public class TestExecution: IdAware
    {
        public DateTime DateTime { get; set; }

        public string Log { get; set; }

        public bool IsSuccessful { get; set; }

        public int TestId { get; set; }
    }
}
