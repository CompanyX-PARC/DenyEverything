using Concordia42.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.FrontDesk
{
    public partial class VerifyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sId"] == null || String.IsNullOrEmpty(((string)Session["sId"]).Trim()))
            {
                Response.Redirect("~/FrontDesk/CardSwipe?m=noSid");
            }
        }

        protected void AcceptButton_Click(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();

            /* try to get a user with this email */

            var user = db.Users.FirstOrDefault(u => u.Email.Equals(ListBox1.SelectedValue));

            string sId = ((string)Session["sId"]).Trim();

            if (user != null && !String.IsNullOrEmpty(sId))
            {
                user.StudentId = sId; // todo more verification
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Session["sId"] = null;
                Response.Redirect("~/FrontDesk/CardSwipe?m=success");
            }
        }

        protected void RejectButton_Click(object sender, EventArgs e)
        {
            Session["sId"] = null;
            Response.Redirect("~/FrontDesk/CardSwipe?m=nope");
        }
    }
}