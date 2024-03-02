using System.Collections.Generic;

namespace DoAnWeb.Models.Dto
{
    public class tb_shippingDto
    {
        public int Id { get; set; }
        public IEnumerable<string> order_id { get; set; }
        public int shipper_id { get; set; }
    }
}