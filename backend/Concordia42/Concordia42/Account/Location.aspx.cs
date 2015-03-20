using Concordia42.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Account
{
    public partial class Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.checkLocation = false; /* don't check location on this page -- else infinite redirect! */
        }

        /* after the master page has been generated, fetch the username */
        protected void Page_PreRender(object sender, EventArgs e)
        {
          
            NameLabel.Text = Master.firstName; /* master page should have loaded the user name already -- use it! */
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));

            Concordia42.Models.Location loc = db.Locations.First(l => l.locName == DropDownList1.Text.Trim());

            /* if they picked a valid location */
            if (loc != null)
            {
                var user = manager.FindById(User.Identity.GetUserId());
                user.activity.currentLocation = loc;

                db.Entry(user.activity).State = System.Data.Entity.EntityState.Modified;
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;

                db.SaveChanges();
                manager.Update(user);
               
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                // error
            }
        }
    }
}