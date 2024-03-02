using Newtonsoft.Json;
using System.Collections.Generic;

namespace DoAnWeb.Models.Dto
{
    public class ServiceDto
    {
        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("code_message_value")]
        public string CodeMessageValue { get; set; }

        [JsonProperty("data")]
        public List<ApiResponse> Data { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }
        public class ApiResponse
        {
            [JsonProperty("service_id")]
            public long ServiceId { get; set; }

            [JsonProperty("short_name")]
            public string ShortName { get; set; }

            [JsonProperty("service_type_id")]
            public long ServiceTypeId { get; set; }

            [JsonProperty("config_fee_id")]
            public string ConfigFeeId { get; set; }

            [JsonProperty("extra_cost_id")]
            public string ExtraCostId { get; set; }

            [JsonProperty("standard_config_fee_id")]
            public string StandardConfigFeeId { get; set; }

            [JsonProperty("standard_extra_cost_id")]
            public string StandardExtraCostId { get; set; }
        }
    }
}