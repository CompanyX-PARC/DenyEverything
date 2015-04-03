using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

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
    }
}