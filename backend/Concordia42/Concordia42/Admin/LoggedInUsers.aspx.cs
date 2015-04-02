using Concordia42.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Admin
{
    public partial class LoggedInUsers : System.Web.UI.Page
    {
        protected UserManager<ApplicationUser> userManager { get; set; }
        protected ApplicationDbContext db { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
                db = new ApplicationDbContext();
                userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
        }

        protected string rolesToString(IList<string> list)
        {
            Boolean first = true;
            string result = "";
            foreach (string s in list) {
                if (first)
                {
                    result += CultureInfo.CurrentCulture.TextInfo.ToTitleCase(s);
                    first = false;
                }
                else {
                    result += ", " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase(s); 
                }
            }

            return result;
        }

        protected string timeSince(DateTime t)
        {
            // inspired by http://stackoverflow.com/questions/2780523/time-like-facebook-style-min-ago
            TimeSpan diff = DateTime.Now.Subtract(t);
            if (diff.TotalSeconds < 60)
            {
                return t + "(just now)";
            }
            else if (diff.TotalMinutes < 60) { 
                return t + string.Format(" ({0} minutes ago)", diff.Minutes);
            }
            else if (diff.TotalHours < 24) { 
                return t + string.Format(" ({0} hours ago)", diff.Hours);
            }
            else 
            {
                return t + string.Format(" ({0} days ago)", diff.Days);
            }
        }
    }
}