using System;
using System.Runtime.Serialization;

namespace Watcher.BLL.Models.Js.Fetch
{
    [DataContract]
    public enum MethodType
    {
        [EnumMember(Value = "GET")]
        GET,
        [EnumMember(Value = "POST")]
        POST,
        [EnumMember(Value = "PUT")]
        PUT,
        [EnumMember(Value = "DELETE")]
        DELETE
    }
}
