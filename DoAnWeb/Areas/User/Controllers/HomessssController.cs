using System.Web.Mvc;

namespace DoAnWeb.Areas.User.Controllers
{
    public class HomessssController : Controller
    {
        [Authorize(Roles = "User")]
        // GET: User/Homessss
        public ActionResult Index()
        {
            return View();
        }
    }
}