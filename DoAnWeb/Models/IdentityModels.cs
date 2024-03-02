using System.Data.Entity;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace DoAnWeb.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }
        public DbSet<tb_shipping> tb_Shippings { get; set; }
        public DbSet<tb_shipper> tb_Shippers { get; set; }
        public DbSet<tb_warehouse> tb_Warehouses { get; set; }
        public DbSet<tb_Adv> tb_Adv { get; set; }
        public DbSet<tb_Category> tb_Category { get; set; }
        public DbSet<tb_Contact> tb_Contact { get; set; }
        public DbSet<tb_New> tb_New { get; set; }
        public DbSet<tb_Post> tb_Post { get; set; }
        public DbSet<tb_Feedback> tb_Feedback { get; set; }
        public DbSet<tb_Subscribe> tb_Subscribe { get; set; }
        public virtual DbSet<tb_Order> tb_Order { get; set; }
        public DbSet<tb_Recruitment> tb_Recruitments { get; set; }


        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}