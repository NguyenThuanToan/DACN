using DoAnWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Manager.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        [Authorize(Roles = "Manager")]
        // GET: Manager/QuanLyDonHang
        public ActionResult Index()
        {
            var items = db.tb_Order;
            return View(items);
        }

        [HttpPost]
        public ActionResult ApproveOrder(int id)
        {
            var order = db.tb_Order.Find(id);
            if (order != null)
            {
                order.IsActive = "Chờ lấy hàng";
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = true });
        }
    }
}