using System;
namespace Watcher.BLL.Services.Js
{
    public static class Logging
    {
        public static Action<dynamic> log(Action<string> callback)
        {
            return (a) => {
                callback(a?.ToString() ?? "null");
            };

        }
    }
}
