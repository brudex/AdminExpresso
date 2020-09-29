using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace ZenExpresso.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        
    }

    //public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    //{
    //    public ApplicationDbContext()
    //        : base("DefaultConnection", false)
    //    {
    //    }

    //    public static ApplicationDbContext Create()
    //    {
    //        return new ApplicationDbContext();
    //    }
    //}
}