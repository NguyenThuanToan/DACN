using DoAnWeb.Models.Dto;
using DoAnWeb.Models.Dtos;
using Dto.ProvinceDto;
using Flurl;
using Flurl.Http;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace DoAnWeb.Services
{
    public class OrderService
    {
        private readonly string _baseUrl = "https://online-gateway.ghn.vn/shiip/public-api";
        private readonly string _token = "705c22ac-8eba-11ee-b394-8ac29577e80e";
        private readonly int _shop_id = 4732561;
        public async Task<ProvinceDto> GetProvinceList()
        {
            try
            {
                var response = await _baseUrl
              .AppendPathSegment("master-data/province")
       .WithHeader("token", _token)
       .GetAsync()
       .ReceiveJson<ProvinceDto>();
                if (response.Code != 200)
                {
                    throw new Exception(response.Message);
                }
                return response;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }

        }
        public async Task<DistricDto> GetDistrictList(int provinceId)
        {
            try
            {
                var response = await _baseUrl
               .AppendPathSegment("master-data/district")
        .SetQueryParam("province_id", provinceId)
        .WithHeader("token", _token)
        .GetAsync()
        .ReceiveJson<DistricDto>();
                if (response.Code != 200)
                {
                    throw new Exception(response.Message);
                }
                return response;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }
        public async Task<WardDto> GetWardList(int districId)
        {
            try
            {
                var response = await _baseUrl
              .AppendPathSegment("master-data/ward")
              .SetQueryParam("district_id", districId)
              .WithHeader("token", _token)
              .GetAsync()
              .ReceiveJson<WardDto>();
                if (response.Code != 200)
                {
                    throw new Exception(response.Message);
                }
                return response;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public async Task<ServiceDto> GetServicesAvailableList(int from_district, int to_district)
        {
            try
            {
                var response = await _baseUrl
               .AppendPathSegment("v2/shipping-order/available-services")
               .WithHeader("token", _token)
                .PostJsonAsync(new
                {
                    shop_id = _shop_id,
                    from_district,
                    to_district
                })
               .ReceiveJson<ServiceDto>();
                var itemDel = response.Data.FirstOrDefault(x => x.ServiceId == 100039); //err
                if (itemDel != null)
                {
                    response.Data.Remove(itemDel);
                }
                if (response.Code != 200)
                {
                    throw new Exception(response.Message);
                }
                return response;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public async Task<FeeDto> GetFee(int service_id, int from_district, int to_district, string from_ward_code, string to_ward_code, int weight, int length, int width, int height, int insurance_value)
        {
            try
            {
                var response = await _baseUrl
               .AppendPathSegment("v2/shipping-order/fee")
               .WithHeader("token", _token)
                .PostJsonAsync(new
                {
                    from_district_id = from_district,
                    from_ward_code,
                    to_district_id = to_district,
                    to_ward_code,
                    height,
                    length,
                    weight,
                    width,
                    insurance_value,
                    cod_failed_amount = 2000,
                    service_id
                })
               .ReceiveJson<FeeDto>();
                if (response.Code != 200)
                {
                    throw new Exception(response.Message);
                }
                return response;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
}