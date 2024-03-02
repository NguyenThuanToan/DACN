using DoAnWeb.Models;
using System;
using System.Web.Mvc;

namespace DoAnWeb.Controllers
{
    public class HomeController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(tb_Contact model)
        {
            SendMail.SendEmail("huyhoang.29122002@gmail.com", "Message", "From: " + model.Name + "\nGmail:" + model.Email + "\nMessage:" + model.Message, "");
            model.IsRead = false;
            model.CreatedDate = DateTime.Now;
            db.tb_Contact.Add(model);
            db.SaveChanges();
            return View();
        }
    }
}