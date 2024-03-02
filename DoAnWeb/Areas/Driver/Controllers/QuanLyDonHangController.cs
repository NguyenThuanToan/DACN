using DoAnWeb.Models;
using Microsoft.AspNet.Identity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Driver.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: Driver/QuanLyDonHang
        [Authorize(Roles = "Driver,Admin")]
        public ActionResult Index(int? page) //sua lai nhu cu
        {
            var pageSize = 5;
            if (page == null)
            {
                page = 1;
            }
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var items = db.tb_Order.OrderByDescending(x => x.Id).ToPagedList(pageIndex, pageSize);
            return View(items);
        }
        [HttpGet]
        public ActionResult ApproveOrder(int id)
        {
            var order = db.tb_Order.Find(id);
            return View(order);
        }
        [HttpPost]
        public ActionResult ApproveOrder(FormCollection form)
        {
            var order = db.tb_Order.Find(int.Parse(form["id"]));
            var ID = User.Identity.GetUserId();
            if (order != null)
            {
                order.IsActive = "Đang vận chuyển";
                order.DriverId = ID;
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = true });
        }

        public ActionResult BeingShipped(int? page)
        {
            var orderByShipper = new List<tb_Order>();
            var currentUser = User.Identity.GetUserId();
            var warehouseAllList = db.tb_Warehouses.Select(x => x);
            var shipperAllList = db.tb_Shippers.FirstOrDefault(x => x.user_id == currentUser);
            if(shipperAllList != null)
                {
                var orderList = db.tb_Order.Select(x => x);
                var shippingList = db.tb_Shippings.Select(x => x);
                var result = from shippings in shippingList
                             join order in orderList on shippings.order_id equals order.Id
                             where shippings.shipper_id == shipperAllList.ID
                             select new { order };


                var pageSize = 5;
                page ??= 1;
                orderByShipper = result.Select(x => x.order).ToList();
                var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                var items = orderByShipper.OrderByDescending(x => x.Id).ToPagedList(pageIndex, pageSize);
                return View(items);

            }
            else
            {
                var orderList =new List<tb_Order>();
                var items = orderList.OrderByDescending(x => x.Id).ToPagedList(1, 10);
                return View(items);
            }


        }

        [HttpPost]
        public ActionResult OrderIsDone(int id)
        {
            var order = db.tb_Order.Find(id);
            if (order != null)
            {
                order.IsActive = "Đã giao thành công";
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = true });
        }

        public ActionResult OrderIsDone(int? page)
        {
            var orderByShipper = new List<tb_Order>();
            var currentUser = User.Identity.GetUserId();
            var warehouseAllList = db.tb_Warehouses.Select(x => x);
            var shipperAllList = db.tb_Shippers.FirstOrDefault(x => x.user_id == currentUser);
            if (shipperAllList != null)
            {
                var orderList = db.tb_Order.Select(x => x);
                var shippingList = db.tb_Shippings.Select(x => x);
                var result = from shippings in shippingList
                             join order in orderList on shippings.order_id equals order.Id
                             where shippings.shipper_id == shipperAllList.ID
                             select new { order };


                var pageSize = 5;
                page ??= 1;
                orderByShipper = result.Select(x => x.order).ToList();
                var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                var items = orderByShipper.OrderByDescending(x => x.Id).ToPagedList(pageIndex, pageSize);
                return View(items);

            }
            else
            {
                var orderList = new List<tb_Order>();
                var items = orderList.OrderByDescending(x => x.Id).ToPagedList(1, 10);
                return View(items);
            }
        }
    }
}