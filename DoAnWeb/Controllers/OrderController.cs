using DoAnWeb.Models;
using DoAnWeb.Models.Dto;
using DoAnWeb.Models.Dtos;
using DoAnWeb.Services;
using Microsoft.AspNet.Identity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace DoAnWeb.Controllers
{
    public class OrderController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();
        //service call api get district
        private readonly OrderService _orderService = new OrderService();

        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetDistricDtoAsync(int provinceId)
        {
            var result = await _orderService.GetDistrictList(provinceId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetWardDtoAsync(int districtId)
        {
            var result = await _orderService.GetWardList(districtId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetServiceDtoAsync(int from_districtId, int to_districtId)
        {
            var result = await _orderService.GetServicesAvailableList(from_districtId, to_districtId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetFeeDtoAsync(int serviceId, int from_districtId, int to_districtId, string from_ward, string to_ward, int weight, int length, int width, int height, int insurance_value)
        {
            var result = await _orderService.GetFee(serviceId, from_districtId, to_districtId, from_ward, to_ward, weight, length, width, height, insurance_value);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        // GET: Order
        public async Task<ActionResult> Index(string Searchtext, int? page)
        {
            var pageSize = 10;
            if (page == null)
            {
                page = 1;
            }

            IEnumerable<tb_Order> items = db.tb_Order.OrderByDescending(x => x.Id);
            if (!string.IsNullOrEmpty(Searchtext))
            {
                items = items.Where(x => x.ItemCode.Contains(Searchtext));
            }
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            items = items.ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(items);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Order order = db.tb_Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Order/Create
        public async Task<ActionResult> Create()
        {
            var province = await _orderService.GetProvinceList();
            ViewData["ProvinceList"] = province;
            return View();
        }

        // POST: Order/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(tb_Order model)
        {
            var warehouseDefault = db.tb_Warehouses.FirstOrDefault(x => x.Name.Contains("Mặc định"));
            if (ModelState.IsValid)
            {
                model.w_id = warehouseDefault.ID;
                model.CreatedDate = DateTime.Now;
                model.CreatedBy = null;
                model.ModifiedDate = null;
                model.ModifierBy = null;
                model.create_by_user = User.Identity.GetUserId();
                model.IsActive = "Chờ duyệt";
                db.tb_Order.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Order/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Order order = db.tb_Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Order/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,SenderName,SenderPhone,SenderAddress,ReceiverName,ReceiverPhone,ReceiverAddress,ItemCode,ItemName,ItemQuantity,ItemWeight,ItemValue,Length,Width,Height,PaymentMethodCod,Payer,Note,PickUpRequest,IsActive")] tb_Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(order);
        }

        // GET: Order/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Order order = db.tb_Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Order/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_Order order = db.tb_Order.Find(id);
            db.tb_Order.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}