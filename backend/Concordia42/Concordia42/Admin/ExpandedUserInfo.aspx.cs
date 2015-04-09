using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using Concordia42.Models;

namespace Concordia42.Admin
{
    public partial class ExpandedUserInfo : System.Web.UI.Page
    {
        public string bob;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this grabs the email from the URL
            bob = Request.QueryString["Email"];

            //This 'binds' the scalar variable BobEmail (found in the SQL Statement in the frontend) to the string bob
            UserSource.SelectParameters["BobEmail"] = new Parameter()
            {
                Name = "BobEmail",
                DefaultValue = bob
            };

            //Send this information to the frontend
            UserSource.DataBind();    

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

            dialog1.Visible = true;



            var db = new ApplicationDbContext();

            var user = db.Users.FirstOrDefault( u => u.Email.Equals(bob));

            if (user != null)
            {
                if (user.profile != null) { 
                    db.Entry(user.profile).State = System.Data.Entity.EntityState.Deleted;
                }
                                 
                foreach (Concordia42.Models.ApplicationUser.Activity a in user.activities) {
                    db.Entry(a).State = System.Data.Entity.EntityState.Deleted;
                }

                db.Entry(user).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                Response.Redirect("~/Admin/WebForm1?m=deleted");
            }
        }
    }
}