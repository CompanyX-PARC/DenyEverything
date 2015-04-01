using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Admin
{
    public partial class LoggedInUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string timeSince(DateTime t)
        {
            // inspired by http://stackoverflow.com/questions/2780523/time-like-facebook-style-min-ago
            TimeSpan diff = DateTime.Now.Subtract(t);
            if (diff.TotalMinutes < 60)
                return t + string.Format(" ({0} minutes ago)", diff.Minutes);
            return t + string.Format(" ({0} hours ago)", diff.Hours);
        }
    }
}