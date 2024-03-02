using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Manager.Controllers
{
    public class HomesssController : Controller
    {
        [Authorize(Roles = "Manager")]
        // GET: Manager/Homesss
        public ActionResult Index()
        {
            return View();
        }
    }
}