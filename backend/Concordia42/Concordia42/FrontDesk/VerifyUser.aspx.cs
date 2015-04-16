using Concordia42.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
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
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            /* try to get a user with this email */

            var user = db.Users.FirstOrDefault(u => u.Email.Equals(ListBox1.SelectedValue));

            string sId = ((string)Session["sId"]).Trim();

            if (user != null && !String.IsNullOrEmpty(sId))
            {
                user.StudentId = sId; // todo more verification
                user.Roles.Clear();
                
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                

                userManager.AddToRole(user.Id, "student");
                userManager.Update(user);
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