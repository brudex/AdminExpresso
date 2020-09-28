using System.Web;
using System.Web.Optimization;

namespace ZenExpresso
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/assets/js/jquery-{version}.js",
                        "~/assets/js/common-script.js",
                        "~/assets/js/jquery.slimscroll.min.js",
                        "~/assets/js/jPushMenu.js",
                        "~/assets/js/side-chats.js",
                        "~/assets/js/sweetalert.js"
                        ));
//            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
//                        "~/Scripts/jquery.validate*"));
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
//            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
//                        "~/Scripts/modernizr-*"));
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/assets/js/bootstrap.js"));
           

            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/assets/css/font-awesome.css",
                      "~/assets/css/bootstrap.min.css",
                      "~/assets/css/animate.css",
                      "~/assets/css/admin.css",
                       "~/assets/css/sweetalert.css"
                      ));
            bundles.Add(new ScriptBundle("~/scripts/datatables").Include(
                      "~/assets/js/datatables.min.js",
                      "~/assets/js/buttons.bootstrap.min.js" 
                      ));
            bundles.Add(new StyleBundle("~/datatables/css").Include(
                     "~/assets/css/datatables.min.css",
                     "~/assets/css/buttons.bootstrap.min.css"
                     ));

            bundles.Add(new ScriptBundle("~/scripts/angular").Include(
                     "~/scripts/angular.js",
                     "~/scripts/angular-animate.js",
                     "~/scripts/app/app.module.js",
                     "~/scripts/app/services.factory.js",
                      "~/scripts/app/utils.factory.js"
                     ));

//            bundles.Add(new ScriptBundle("~/scripts/dblog").Include(
//                     "~/scripts/app/dblog.controller.js",
//                     "~/scripts/app/searchlog.controller.js"                    
//                     ));


        }
    }
}
