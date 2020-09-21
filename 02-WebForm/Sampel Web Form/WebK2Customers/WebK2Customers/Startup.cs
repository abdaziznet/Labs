using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebK2Customers.Startup))]
namespace WebK2Customers
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
