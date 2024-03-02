using DoAnWeb.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Admin.Controllers
{
    //Statistical
    public class StatisticalController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: Admin/Statistical
        public ActionResult Index()
        {
            return View();
        }

        //Baimoi

        [HttpGet]
        public ActionResult GetStatistical(string fromDate, string toDate)
        {
            var query = from o in db.tb_Order
                        where o.IsActive.ToLower().Contains("đã giao thành công")
                        select new
                        {
                            CreatedDate = o.CreatedDate,
                        };

            if (!string.IsNullOrEmpty(fromDate))
            {
                DateTime startDate = DateTime.ParseExact(fromDate, "dd/MM/yyyy", null);
                query = query.Where(x => x.CreatedDate >= startDate);
            }

            if (!string.IsNullOrEmpty(toDate))
            {
                DateTime endDate = DateTime.ParseExact(toDate, "dd/MM/yyyy", null);
                query = query.Where(x => x.CreatedDate < endDate.AddDays(1));
            }
            var result = query
                .GroupBy(o => new { Year = o.CreatedDate.Value.Year, Month = o.CreatedDate.Value.Month })
                .Select(x => new
                {
                    Year = x.Key.Year,
                    Month = x.Key.Month,
                    DoanhSo = x.Count() // Đếm số lượng sản phẩm đã giao thành công trong mỗi tháng
                });
            return Json(new { Data = result }, JsonRequestBehavior.AllowGet);
        }

    }
}