using DoAnWeb.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace DoAnWeb.Areas.Manager.Controllers
{
    public class WarehouseController : Controller
    {
        private readonly ApplicationDbContext _db = new();
        //[Authorize(Roles = "Manager")]
        [Microsoft.AspNetCore.Mvc.HttpGet]

        public async Task<JsonResult> GetAllWareHouseAvailableAsync()
        {
            var result = _db.tb_Warehouses.AsNoTracking().Where(x => x.Name != "Mặc định").OrderBy(x => x.Province);
            return Json(result, JsonRequestBehavior.AllowGet);

        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetOrderAvailable(int id)
        {
            var items = _db.tb_Order.Where(x => x.w_id == id && (x.IsActive.ToLower().Trim() == "chờ lấy hàng" || x.IsActive.ToLower().Trim() == "đã nhập kho")).OrderBy(x => x.w_id).Select(x => x).ToList();
            return Json(items, JsonRequestBehavior.AllowGet);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<JsonResult> GetShipperAvailable(int id)
        {
            var items = _db.tb_Shippers.Where(x => x.W_id == id).Select(x => x).ToList();
            return Json(items, JsonRequestBehavior.AllowGet);
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public async Task<ActionResult> OrderInWarehouse(int id)
        {
            TempData["WareHouseId"] = id;
            int? page = 1;
            IEnumerable<tb_Order> items = _db.tb_Order.Where(x => x.w_id == id && (x.IsActive.ToLower().Trim() == "chờ lấy hàng" || x.IsActive.ToLower().Trim() == "đã nhập kho")).OrderBy(x => x.w_id).Select(x => x);

            if (items == null)
            {
                return HttpNotFound();
            }
            var pageSize = 5;
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            items = items.ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(items);
        }
        public async Task<ActionResult> Index(string Searchtext, int? page)
        {
            var pageSize = 5;
            page ??= 1;
            IEnumerable<tb_warehouse> items = _db.tb_Warehouses.Where(x => x.Name != "Mặc định").OrderByDescending(x => x.Province);
            if (!string.IsNullOrEmpty(Searchtext))
            {
                items = items.Where(x => x.Name.Contains(Searchtext));
            }
            var pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            items = items.ToPagedList(pageIndex, pageSize);
            ViewBag.PageSize = pageSize;
            ViewBag.Page = page;
            return View(items);
        }

        private async Task FindProvinceAndAssignShipperToWareHouse(int warehouse_id, int orderId)
        {
            var shipper = await _db.tb_Shippers.FirstOrDefaultAsync(x => x.W_id == warehouse_id);

        }
    }
}