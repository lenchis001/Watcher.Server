using System;
using System.Threading.Tasks;

namespace Watcher.BLL.Services.Js
{
    public static class TimeFunctions
    {
        public static void setTimeout(dynamic a, int b)
        {
            Task.Delay(b)
                .ContinueWith(_ =>
                {
                    a();

                    return Task.CompletedTask;
                });
        }
    }
}
