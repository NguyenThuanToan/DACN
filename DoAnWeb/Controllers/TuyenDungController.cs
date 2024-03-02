using DoAnWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Controllers
{
    public class TuyenDungController : Controller
    {
        // GET: TuyenDung
        private ApplicationDbContext db = new ApplicationDbContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(tb_Recruitment model)
        {
            model.IsRead = 0;
            model.CreatedDate = DateTime.Now;
            db.tb_Recruitments.Add(model);
            db.SaveChanges();
            return View();
        }
    }
}