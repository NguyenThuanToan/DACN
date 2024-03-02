using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace DoAnWeb.Models.Dto
{
    public class DistricDto
    {
        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("data")]
        public List<ApiResponse> Data { get; set; }
        public class ApiResponse
        {
            [JsonProperty("DistrictID")]
            public long DistrictId { get; set; }

            [JsonProperty("ProvinceID")]
            public long ProvinceId { get; set; }

            [JsonProperty("DistrictName")]
            public string DistrictName { get; set; }

            [JsonProperty("Code", NullValueHandling = NullValueHandling.Ignore)]
            public string Code { get; set; }


        }
    }
}