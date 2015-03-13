using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Concordia42.Models;

namespace Concordia42.FrontDesk
{
    public partial class CardSwipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IdBox.Focus();
        }

        protected void IdButton_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            // var user = manager.FindById(User.Identity.GetUserId());
            ApplicationDbContext db = new ApplicationDbContext();

            var user = db.Users.FirstOrDefault(u => u.StudentId.Equals(IdBox.Text.Trim()));

            if (user == null)
            {
                ErrorMessage.Text = "Couldn't find user!";
                ErrorDiv.Visible = true;
                SuccessDiv.Visible = false;
            }
            else
            {
                SuccessMessage.Text = "Found user: " + user.Email;
                SuccessDiv.Visible = true;
                ErrorDiv.Visible = false;
            }
            //Label1.Text = "Welcome, " + TextBox1.Text;
            IdBox.Text = "";
        }
    }
}