using System.Web.Mvc;
using ZenExpressoCore;

namespace ZenExpresso.Controllers
{

    [Authorize]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var userName = User.Identity.Name;
            var list = DbHandler.Instance.GetRecentTasks(userName);
            return View(list);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}