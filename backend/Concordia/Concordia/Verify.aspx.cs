using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia
{
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (verificationCode.Text.Equals("12345"))
            {
                group1.Attributes["class"] = "has-error form-group";
                errorLabel.Text = "You are teh failz!";
            }
        }


    }
}