using Newtonsoft.Json;
using System.Collections.Generic;

namespace DoAnWeb.Models.Dto
{
    public class FeeDto
    {
        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("data")]
        public Dictionary<string, long> Data { get; set; }
    }
}