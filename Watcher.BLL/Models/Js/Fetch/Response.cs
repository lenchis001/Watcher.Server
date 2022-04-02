using System;
using System.Runtime.Serialization;

namespace Watcher.BLL.Models.Js.Fetch
{
    [DataContract]
    public class Response
    {
        [DataMember(Name = "status")]
        public int status { get; set; }

        [DataMember(Name = "ok")]
        public bool ok { get; set; }

        [DataMember(Name = "text")]
        public string _text { get; set; }
    }
}
