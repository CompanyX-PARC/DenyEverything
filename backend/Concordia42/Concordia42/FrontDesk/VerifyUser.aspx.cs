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
           

            ApplicationDbContext db = new ApplicationDbContext();

            /* try to get a user with this email */

            var user = db.Users.FirstOrDefault(u => u.StudentId != null);

            if (user != null)
            {
                //FirstNameLabel.Text = user.FirstName;
                //LastNameLabel.Text = user.LastName;
                //EmailLabel.Text = user.Email;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();

            /* try to get a user with this email */

            var user = db.Users.FirstOrDefault(u => u.Email.Equals(ListBox1.SelectedValue));

            if (user != null && !String.IsNullOrEmpty(PreviousPage.studentId))
            {
                user.StudentId = PreviousPage.studentId.Trim(); // todo more verification
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Response.Redirect("~/FrontDesk/CardSwipe?m=success");
            }

        }
    }
}