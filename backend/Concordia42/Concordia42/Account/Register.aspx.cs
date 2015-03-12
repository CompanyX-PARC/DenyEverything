using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Concordia42.Models;
using System.Data.Entity;

namespace Concordia42.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);

                // steamguard style code too
                Random random = new Random();
                string password = random.Next(10000, 99999) + "";

                user.VerificationCode = password;
                user.FirstName = FirstName.Text.Trim();
                user.LastName = LastName.Text.Trim();
                manager.Update(user);

                manager.SendEmail(user.Id, "Please confirm your PARC account", "<h1>Welcome to PARC!</h1><p>You need to verify your PARC account.</p>" +
                    "<p>You should be seeing a page asking you to enter a verification code.</p><p>Enter this code: <strong>" + password + "</strong></p>" +
                    "<p>If you don't see the verification page, or you closed the browser window, that's okay! " +
                    "<br />You can instead verify your account by <a href=\"" + callbackUrl + "\">clicking here</a>.</p>" +
                    "<p><em>Peer and Academic Resource Center<br/>CSU Sacramento</em></p>" +
                    "<p><br />P.S. If you didn't register for a PARC account, don't worry; you don't have to do anything. You can safely ignore this email.</p>\r\n\r\n");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl("~/Account/Verify", Response);

            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}