using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.ClearScript.JavaScript;
using Microsoft.ClearScript.V8;
using Newtonsoft.Json;
using Quartz;
using Watcher.BLL.Models.Js.Fetch;
using Watcher.BLL.Models.TestExecutions;
using Watcher.BLL.Models.Tests;
using Watcher.BLL.Services;
using Watcher.BLL.Services.Js;

namespace Watcher.BLL.Jobs
{
    public class TestJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            var testName = context.MergedJobDataMap.GetString(nameof(Test.Name));
            var script = context.MergedJobDataMap.GetString(nameof(Test.Script));
            var testId = context.MergedJobDataMap.GetInt(nameof(Test.Id));
            var testExecutionService = context.MergedJobDataMap.Get(nameof(ITestExecutionService)) as ITestExecutionService;
            var notificationService = context.MergedJobDataMap.Get(nameof(INotificationService)) as INotificationService;

            ICollection<string> logs = new List<string>();
            bool isSuccessful = true;

            var watch = new Stopwatch();
            watch.Start();

            try
            {
                using (var engine = new V8ScriptEngine(V8ScriptEngineFlags.EnableTaskPromiseConversion))
                {
                    engine.AddHostType(typeof(JavaScriptExtensions));
                    engine.Script.setTimeout = new Action<dynamic, int>(TimeFunctions.setTimeout);
                    engine.Script.console.log = new Action<dynamic>(Logging.log((a) =>
                    {
                        logs.Add($"{watch.Elapsed}: {a}");
                    }));
                    engine.Script._fetch = new Func<string, string, Task<Response>>(fetch);

                    var result = engine.Evaluate(
                        @"
                            async function fetch(a,b) {
                                let response = await _fetch(a, JSON.stringify(b ?? {}));

                                let result = Object.create(response);

                                result.text = () => Promise.resolve(result._text);

                                return result;
                            }

                            async function runCode() {" +
                                script +
                            @"}

                            runCode();
                         ");

                    await (result as Task);
                }

                watch.Stop();
            }
            catch (Exception e)
            {
                watch.Stop();
                isSuccessful = false;
                logs.Add($"Error: {watch.Elapsed}: {e.Message}");
            }
            finally
            {
                await testExecutionService.AddAsync(new AddTestExecution
                {
                    DateTime = DateTime.UtcNow,
                    IsSuccessful = isSuccessful,
                    Log = string.Join('\n', logs),
                    TestId = testId
                });

                await notificationService.NotifyAsync(testId, testName, testExecutionService);
            }
        }

        async Task<Response> fetch(string url, string initJson)
        {
            var init = JsonConvert.DeserializeObject<FetchInit>(initJson);

            using (var httpClient = new HttpClient())
            {
                var httpMethod = ToHttpMethod(init.Method);
                var requestMessage = new HttpRequestMessage(httpMethod, url);

                var response = await httpClient.SendAsync(requestMessage);

                return new Response
                {
                    ok = response.IsSuccessStatusCode,
                    status = (int)response.StatusCode,
                    _text = await response.Content.ReadAsStringAsync()
                };
            }
        }

        private static HttpMethod ToHttpMethod(MethodType method)
        {
            switch (method)
            {
                case MethodType.POST:
                    return HttpMethod.Post;
                case MethodType.PUT:
                    return HttpMethod.Put;
                case MethodType.DELETE:
                    return HttpMethod.Delete;
                default:
                    return HttpMethod.Get;
            }
        }
    }
}
