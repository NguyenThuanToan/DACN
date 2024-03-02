using DoAnWeb.Models;
using System.Collections.Generic;

namespace DoAnWeb.Areas.Admin.Data
{
    public class OrderByUser
    {
        public string UserId { get; set; }
        public string FullName { get; set; }
        public int Count { get; set; }
        public List<tb_Order> Orders { get; set; }

    }
}