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
            TextBox1.Focus();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            // var user = manager.FindById(User.Identity.GetUserId());
            ApplicationDbContext db = new ApplicationDbContext();

            var user = db.Users.FirstOrDefault(u => u.StudentId.Equals(TextBox1.Text.Trim()));


            if (user == null)
            {
                Label1.Text = "Couldn't find user :(";
            }
            else
            {
                Label1.Text = "Found user: " + user.Email;
            }
            //Label1.Text = "Welcome, " + TextBox1.Text;
            TextBox1.Text = "";
        }
    }
}