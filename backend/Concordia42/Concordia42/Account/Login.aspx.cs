using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Concordia42.Models;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Concordia42.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                ApplicationDbContext db = new ApplicationDbContext();
                var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
                //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);
                
                switch (result)
                {
                    case SignInStatus.Success:
                        var user = manager.FindByEmail(Email.Text);
                        var activity = new Concordia42.Models.ApplicationUser.Activity();
                        activity.whenLoggedIn = activity.lastAction = System.DateTime.Now;

                        /* start session */
                        Session["init"] = true;

                        // update activity record
                        activity.sessionId = Session.SessionID;
                        activity.user = user;
                        db.Activities.Add(activity);
                        db.SaveChanges();

                        manager.Update(user); // may not need this
                        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        if (signinManager.UserManager.IsInRole(user.Id, "assistant") || signinManager.UserManager.IsInRole(user.Id, "admin") || signinManager.UserManager.IsInRole(user.Id, "leader"))
                        {
                            Response.Redirect("/Account/Location?ReturnUrl=" + Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                            Response.Redirect("~/Account/Manage");
                        }
                   
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Couldn't log in! Do you have an account yet?";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}