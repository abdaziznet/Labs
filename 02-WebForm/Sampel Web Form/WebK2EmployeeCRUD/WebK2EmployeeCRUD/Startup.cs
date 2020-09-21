using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebK2EmployeeCRUD.Startup))]
namespace WebK2EmployeeCRUD
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
