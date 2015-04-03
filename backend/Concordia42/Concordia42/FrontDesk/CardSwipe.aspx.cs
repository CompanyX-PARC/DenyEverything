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

        public string studentId { get; set;  }

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

            /* didn't find a user, either first time or not at PARC */
            if (user == null)
            {
                studentId = IdBox.Text.Trim();
                Server.Transfer("~/FrontDesk/VerifyUser.aspx");
            }
            else
            {
                SuccessMessage.Text = "Found verified user: " + user.Email;
                SuccessDiv.Visible = true;
                ErrorDiv.Visible = false;
            }
            //Label1.Text = "Welcome, " + TextBox1.Text;
            IdBox.Text = "";
        }
    }
}