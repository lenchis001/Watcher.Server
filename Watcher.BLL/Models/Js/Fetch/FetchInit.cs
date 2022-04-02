using System;
using System.Runtime.Serialization;

namespace Watcher.BLL.Models.Js.Fetch
{
    [DataContract]
    public class FetchInit
    {
        [DataMember(Name = "method")]
        public MethodType Method { get; set; } = MethodType.GET;
    }
}
