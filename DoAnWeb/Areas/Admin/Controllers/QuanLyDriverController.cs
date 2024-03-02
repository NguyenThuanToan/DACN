using DoAnWeb.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;
using DoAnWeb.Areas.Admin.Data;

namespace DoAnWeb.Areas.Admin.Controllers
{
    public class QuanLyDriverController : Controller
    {
        private ApplicationUserManager _userManager;
        public QuanLyDriverController()
        {
        }

        public QuanLyDriverController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
        }


        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private ApplicationDbContext db = new ApplicationDbContext();

        [HttpGet]
        public ActionResult Create()
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            var userModel = new UserInput();
            var allRoles = roleManager.Roles.Select(x => x.Name).ToList();
            var allWareHouse = db.tb_Warehouses.Select(x => x).ToList();
            var userAll = new List<ApplicationUser>();
            var allUserId = db.Users.Select(x => x).ToList();
            var shiperResult = db.tb_Shippers.Select(x => x);
            userAll = !(shiperResult.Count() == 0)? allUserId.Where(x => shiperResult.Any(x1 =>x1.user_id != x.Id)).ToList(): allUserId.Select(x=>x).ToList();
            ViewBag.Users = userAll;
            ViewBag.Warehouse = allWareHouse;
            ViewBag.Roles = allRoles;
            return View(userModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(UserInput model)
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            var userModel = new UserInput();
            var allRoles = roleManager.Roles.Select(x => x.Name).ToList();
            var shiperResult = db.tb_Shippers.Select(x => x);
            ViewBag.Roles = allRoles;
            var userAll = new List<ApplicationUser>();
            var allUserId = db.Users.Select(x => x).ToList();
            userAll = !(shiperResult.Count() == 0) ? allUserId.Where(x => shiperResult.Any(x1 => x1.user_id != x.Id)).ToList() : allUserId.Select(x => x).ToList();
            ViewBag.Users = userAll;
            var allWareHouse = db.tb_Warehouses.Select(x => x).ToList();
            ViewBag.Warehouse = allWareHouse;
            if (ModelState.IsValid)
            {
                if (model.PasswordHash != model.ConfirmPassword)
                {
                    ModelState.AddModelError("ConfirmPassword", "not match.");
                    return View(model);
                }

                var newUser = new ApplicationUser
                {
                    UserName = model.UserName,
                    Email = model.Email,
                    PasswordHash = model.PasswordHash,
                    Name = model.FullName
                };

                var result = await UserManager.CreateAsync(newUser, model.PasswordHash);
                if (result.Succeeded)
                {
                    if (model.SelectedRole == "Driver")
                    {
                        db.tb_Shippers.Add(new tb_shipper
                        {
                            FullName = model.FullName,
                            AGE = model.Age,
                            user_id = newUser.Id,
                            W_id = int.Parse(model.SelectedWareHouse)
                        });
                        await db.SaveChangesAsync();
                    }
                    var user = UserManager.FindByName(model.UserName).Id;
                    await UserManager.AddToRoleAsync(user, model.SelectedRole);
                    return RedirectToAction("Index", "Homes");
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError($"{error}", error);
                    }

                }
            }

            return View(model);
        }

        // GET: Admin/QuanLyDriver
        public ActionResult Index(int? page)
        {
            var items = db.Users.ToList();

            if (page == null)
            {
                page = 1;
            }
            var pageNumber = page ?? 1;
            var pageSize = 10;
            ViewBag.PageSize = pageSize;
            ViewBag.Page = pageNumber;
            return View(items.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public async Task<ActionResult> Edit(string id)
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            var allRoles = roleManager.Roles.ToList();
            ViewBag.Roles = allRoles;
            var userRoles = await UserManager.GetRolesAsync(id);
            ViewBag.UserRoles = userRoles;
            var account = db.Users.Find(id);
            return View(account);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(FormCollection form, ApplicationUser model)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByIdAsync(model.Id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                string role = form["roleid"];

                var userRoles = await UserManager.GetRolesAsync(model.Id);
                await UserManager.RemoveFromRolesAsync(model.Id, userRoles.ToArray());
                await UserManager.AddToRoleAsync(model.Id, role);

                // Update user info
                user.UserName = model.UserName;
                user.Email = model.Email;
                user.Name = model.Name;
                user.PhoneNumber = model.PhoneNumber;

                // Remove old roles and add new roles to user
                var result = await UserManager.UpdateAsync(user);

                if (result.Succeeded)
                {
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ModelState.AddModelError("", "Lỗi khi cập nhật tài khoản.");
                    return View(model);
                }
            }
            return View(model);
        }
        [HttpPost]
        public async Task<ActionResult> Lock(FormCollection form)
        {
            var code = new { Success = false, msg = "" };
            var user = await UserManager.FindByIdAsync(form["id"]);
            if (user != null)
            {
                user.LockoutEndDateUtc = new DateTime(9999, 1, 16);
                await UserManager.UpdateAsync(user);
                code = new { Success = true, msg = "Khóa tài khoản thành công!" };
            }
            return Json(code);
        }
        [HttpGet]
        public ActionResult Open(int? page)
        {
            var items = db.Users.ToList();

            if (page == null)
            {
                page = 1;
            }
            var pageNumber = page ?? 1;
            var pageSize = 10;
            ViewBag.PageSize = pageSize;
            ViewBag.Page = pageNumber;
            return View(items.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public async Task<ActionResult> Open(FormCollection form)
        {
            var code = new { Success = false, msg = "" };
            var user = await UserManager.FindByIdAsync(form["id"]);
            if (user != null)
            {
                user.LockoutEndDateUtc = null;
                await UserManager.UpdateAsync(user);
                code = new { Success = true, msg = "Mở tài khoản thành công!" };
            }
            return Json(code);
        }
    }
}