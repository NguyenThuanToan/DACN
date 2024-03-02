using DoAnWeb.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Controllers
{
    public class NewsController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: News
        public ActionResult Index(int? page)
        {
            var pageSize = 2;
            if (page == null)
            {
                page = 1;
            }
            IEnumerable <tb_New> items = db.tb_New.OrderByDescending(x=>x.CreatedDate);
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            items = items.ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(items);
        }

        public ActionResult Detail(int id)
        {
            var item = db.tb_New.Find(id);
            return View(item);
        }
        public ActionResult Partial_News_Home()
        {
            var items = db.tb_New.Take(3).ToList();
            return PartialView(items);
        }
    }
}