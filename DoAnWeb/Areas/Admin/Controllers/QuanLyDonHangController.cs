using DoAnWeb.Areas.Admin.Data;
using DoAnWeb.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Admin.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        // GET: Admin/QuanLyDonHang
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            var data = new List<OrderByUser>();
            var users = db.Users.Select(x => x);
            var orders = db.tb_Order.Select(x => x);
            var orderByUser = from order in orders
                              join user in users on order.create_by_user equals user.Id
                              group order by user.Id;
            var tempUsers = users.ToList();
            foreach (var item in orderByUser)
            {
                var user = tempUsers.FirstOrDefault(x => x.Id == item.Key);
                var orderList = new List<tb_Order>();
                var dataItem = new OrderByUser
                {
                    UserId = item.Key,
                    FullName = user.Name,
                    Count = item.Count(),
                };
                foreach (var order in item)
                {
                    orderList.Add(order);
                }
                dataItem.Orders = orderList;
                data.Add(dataItem);
            }
            return View(data);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        //get detail user action
        public ActionResult UserDetail(string id)
        {
            var users = db.Users.Select(x => x);
            var tempUsers = users.ToList();
            var user = tempUsers.FirstOrDefault(x => x.Id == id);
            return Json(user, JsonRequestBehavior.AllowGet);
        }

        [Microsoft.AspNetCore.Mvc.HttpPost]
        public ActionResult AssignWareHouseToOrder(string id, int wareHouseId)
        {
            var orderId = int.Parse(id);
            var order = db.tb_Order.FirstOrDefault(x => x.Id == orderId);
            if (order != null)
            {
                order.w_id = wareHouseId;
                order.IsActive = "Đã nhập kho";
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
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