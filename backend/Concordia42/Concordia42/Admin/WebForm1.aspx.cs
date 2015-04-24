using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Render success message
            var message = Request.QueryString["m"];
            if (message != null)
            {
                if (!IsPostBack)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Admin/WebForm1");

                    SuccessMessage =
                        message == "CreateSuccess" ? "The user was created."
                        : message == "UpdateSuccess" ? "The user was updated."
                        : message == "DeleteSuccess" ? "The user was removed."
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }

            }
        }
    }
}