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
            string email = Request.QueryString["email"];

            ApplicationDbContext db = new ApplicationDbContext();

            /* try to get a user with this email */

            var user = db.Users.FirstOrDefault(u => u.StudentId != null);

            if (user != null)
            {
                FirstNameLabel.Text = user.FirstName;
                LastNameLabel.Text = user.LastName;
                EmailLabel.Text = user.Email;
            }
        }
    }
}