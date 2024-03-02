using DoAnWeb.Models;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Web.Mvc;
using PagedList;
using DoAnWeb.Models.Dto;
using System.Collections;

namespace DoAnWeb.Areas.Manager.Controllers
{
    public class ShippingController : Controller
    {
        private readonly ApplicationDbContext _db = new();
        // GET: Shipping
        public ActionResult Index(int? page, int? id) // get all shipping
        {
            if (id != null)
            {
                TempData["WareHouseId"] = id;
            }
            var pageSize = 5;
            page ??= 1;

            IEnumerable<tb_shipping> items = _db.tb_Shippings.OrderByDescending(x => x.order_id);
            var orders = _db.tb_Order.OrderByDescending(x => x.Id);
            var shipper = _db.tb_Shippers.OrderByDescending(x => x.ID);
            var dataRaw = from shipping in items
                          join order in orders on shipping.order_id equals order.Id
                          join shipperSingle in shipper on shipping.shipper_id equals shipperSingle.ID
                          select new { shipping, order, shipperSingle }; // join table get order code and shipper name
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var dataView = new List<tb_shipping_view>();
            foreach (var item in dataRaw)
            {
                var temp = new tb_shipping_view
                {
                    Id = item.shipping.Id,
                    orderCode = item.order.ItemCode,
                    shipperName = item.shipperSingle.FullName
                };
                dataView.Add(temp);
            }
            IEnumerable<tb_shipping_view> result = dataView.AsEnumerable().ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(result);
        }
        [HttpGet]
        public ActionResult Create(int id)
        {
            TempData["WareHouseId"] = id;
            var model = new tb_shippingDto
            {
                shipper_id = 0,
                order_id = new List<string> { "0" }            };
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(tb_shippingDto modelDto, int id)
        {
            TempData["WareHouseId"] = id;
            var orderIds = modelDto.order_id.First().Split(',').ToList();
            foreach (var item in orderIds)
            {
                if (ModelState.IsValid)
                {
                    var model = new tb_shipping
                    {
                        order_id = int.Parse(item),
                        shipper_id = modelDto.shipper_id
                    };
                    _db.tb_Shippings.Add(model);
                    var orderInfo = _db.tb_Order.Find(int.Parse(item));
                    _db.Entry(orderInfo).Entity.IsActive = "Đang vận chuyển";

                }
            }
            _db.SaveChanges();
            return RedirectToAction("Index", new { id });
        }
    }
}