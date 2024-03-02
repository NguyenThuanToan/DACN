using DoAnWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Controllers
{
    public class ItemTrackingController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: ItemTracking
        public ActionResult Index()
        {
            return View(db.tb_Order.ToList());
        }
    }
}