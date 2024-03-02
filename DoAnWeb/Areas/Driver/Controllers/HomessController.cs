using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Driver.Controllers
{
    public class HomessController : Controller
    {
        [Authorize(Roles = "Driver")]
        // GET: Driver/Homess
        public ActionResult Index()
        {
            return View();
        }
    }
}