using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Concordia42.Models;
using System.Data.Entity;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web.Security;
using System.Web.UI.WebControls;
using Microsoft.Owin;
using Microsoft.AspNet.Identity.EntityFramework;



namespace Concordia42.Admin
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.GetOwinContext().Authentication.User.IsInRole("admin"))
            {
                StudentRoleLabel.Visible = false;
                StudentRoleDropdown.Visible = false;
            }
            else
            {
                UserRoleLabel.Visible = false;
                UserRoleDropdown.Visible = false;
            }    
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            var userRole = UserRoleDropdown.SelectedValue;
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                user.FirstName = FirstName.Text.Trim();
                user.LastName = LastName.Text.Trim();

               /* For testing purposes, see what the dropdown list is acutally saying.
                * This APPEARS to be fine, needs some more testing though.
                Page.Response.Write(userRole);
                * 
                * */
                if (userRole == "Student")
                {
                    manager.AddToRole(user.Id, "student");
                }
                else if (userRole == "SI Leader")
                {
                    manager.AddToRole(user.Id, "leader");
                }
                else if (userRole == "Staff")
                {
                    manager.AddToRole(user.Id, "assistant");
                }
                else if (userRole == "Administrator")
                {
                    manager.AddToRole(user.Id, "admin");
                }

                user.EmailConfirmed = true;
                user.VerificationCode = null;
                manager.AddToRole(user.Id, "verified");
                manager.Update(user);

                //clear out the textboxes!
                FirstName.Text = string.Empty;
                LastName.Text = string.Empty;
                Email.Text = string.Empty;
                Password.Text = string.Empty;
                ConfirmPassword.Text = string.Empty;
                UserRoleDropdown.SelectedIndex = 0;

            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}