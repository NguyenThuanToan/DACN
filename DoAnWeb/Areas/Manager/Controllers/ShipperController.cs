using DoAnWeb.Models;
using System.Collections.Generic;
using System;
using System.Web.Mvc;
using System.Linq;
using PagedList;

namespace DoAnWeb.Areas.Manager.Controllers
{
    public class ShipperController : Controller
    {
        private readonly ApplicationDbContext _db = new();
        // GET: Shipper
        public ActionResult Index(string Searchtext, int? page) // dont use now
        {
            var pageSize = 5;
            page ??= 1;

            IEnumerable<tb_shipper> items = _db.tb_Shippers.OrderByDescending(x => x.FullName);
            if (!string.IsNullOrEmpty(Searchtext))
            {
                items = items.Where(x => x.FullName.Contains(Searchtext));
            }
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            items = items.ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(items);
        }
    }
}