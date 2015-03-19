using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Concordia42.Models;
namespace Concordia42
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.GetOwinContext().Authentication.User.Identity.IsAuthenticated) { 
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = manager.FindById(Context.User.Identity.GetUserId());
                try { 
                    if (user != null) { 
                        var l = ((Label)LoginViewControl.FindControl("UserNameLabel"));
                        l.Text = user.FirstName;
                        //Response.Write(user.FirstName + "DFFSFSDFDS" + Context.User.Identity.GetUserId());
                    }
                }
                catch (NullReferenceException ex)
                {
                    // asp.net is fun :D :D :D
                }

                user.activity.lastAction = System.DateTime.Now;
                manager.Update(user);

                /* check location */
                /*
                if (user.activity.currentLocation == null)
                {
                    if (manager.IsInRole(user.Id, "assistant") || manager.IsInRole(user.Id, "leader") || manager.IsInRole(user.Id, "admin")) { 
                    
                        Response.Redirect("/Account/Location?ReturnUrl=" + Request.QueryString["ReturnUrl"]);
                    }
                } */
            }
        }

  

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            /* db hit? :( */
            ApplicationDbContext db = new ApplicationDbContext();

            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            var user = manager.FindById(Context.User.Identity.GetUserId());

            /* someday log, not destroy */
            if (user != null && user.activity != null)
            {
                db.Entry(user.activity).State = System.Data.Entity.EntityState.Deleted;
                user.activity = null;
            }
            manager.Update(user);
            Context.GetOwinContext().Authentication.SignOut();
        }
    }

}