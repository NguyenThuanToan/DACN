using System;
using System.Collections.Generic;
using Newtonsoft.Json;
namespace Dto.ProvinceDto
{
    public class ProvinceDto
    {
        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("data")]
        public List<ApiResponse> Data { get; set; }
        public class ApiResponse
        {
            [JsonProperty("ProvinceID")]
            public long ProvinceId { get; set; }

            [JsonProperty("ProvinceName")]
            public string ProvinceName { get; set; }

            [JsonProperty("CountryID")]
            public long CountryId { get; set; }

            [JsonProperty("Code")]
            public string Code { get; set; }
        }
    }
}
