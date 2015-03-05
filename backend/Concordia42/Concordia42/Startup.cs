using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Concordia42.Startup))]
namespace Concordia42
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
