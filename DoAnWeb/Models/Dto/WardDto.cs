using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace DoAnWeb.Models.Dtos
{
    public class WardDto
    {
        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("data")]
        public List<ApiResponse> Data { get; set; }

        public class ApiResponse
        {
            [JsonProperty("WardCode")]
            public string WardCode { get; set; }

            [JsonProperty("DistrictID")]
            public long DistrictId { get; set; }

            [JsonProperty("WardName")]
            public string WardName { get; set; }

           
        }
    }
}