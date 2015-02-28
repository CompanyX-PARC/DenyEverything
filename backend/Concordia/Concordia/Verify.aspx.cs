using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

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

                try 
                { 
                    /* send an email */
                    MailMessage message = new MailMessage();
                    message.To.Add("denyeverything@googlegroups.com");
                    message.From = new MailAddress("concordia@somewhere.net", "Concordia");
                    message.Subject = "This is a test of our verification page!";
                    message.Body = "Hi, this is Concordia.\n\n Cody managed to get emails sent through SendGrid. Yay!\n\nP.S. Thanks for the pizza, Mike!";

                    SmtpClient client = new SmtpClient(); /* pulls default settings from Web.config */
                    
                    client.Send(message);
                }
                catch (Exception ex)
                {
                    Response.Write("Could not send email! Error: " + ex.Message);
                }
            }
        }


    }
}