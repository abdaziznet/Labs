using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OrganizationChart.Startup))]
namespace OrganizationChart
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
