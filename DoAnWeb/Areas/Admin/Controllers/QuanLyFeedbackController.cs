using DoAnWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Admin.Controllers
{
    public class QuanLyFeedbackController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        // GET: Admin/QuanLyFeedback
        public ActionResult Index()
        {
            var items = db.tb_Feedback.ToList();
            return View(items);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var item = db.tb_Feedback.Find(id);
            if (item != null)
            {
                db.tb_Feedback.Remove(item);
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}