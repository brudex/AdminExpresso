using Microsoft.Owin;
using Owin;
using ZenExpresso.Helpers;
using ZenExpressoCore;

[assembly: OwinStartupAttribute(typeof(ZenExpresso.Startup))]
namespace ZenExpresso
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            Logger.EnsureInitialized();
        }
    }
}
