using System;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Concordia42.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Concordia42.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        //USER 
        // STEAMGUARD style verification code
        public string VerificationCode { get; set; }
        // store profile in different table
        public virtual StudentProfile profile { get; set; }
        public virtual Activity activity { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        //PROFILE
        public class StudentProfile
        {
            public int Id { get; set; }
            //public string Name { get; set; }
            public string Major { get; set; }
            public string Minor { get; set; }
            public string GradeLevel { get; set; }
            public string GradSemester { get; set; }
            public string WhySeking { get; set; }
            public string NeedHelpWith { get; set; }
            public string Gender { get; set; }
            public string Ethnicity { get; set; }
            public Boolean International { get; set; }
            public string CountryOfOrigin { get; set; }
            public string HomeLanguages { get; set; }
            public Boolean ReceivingServices { get; set; }
            public string ReceivingServicesFrom { get; set; }
            public Boolean DegreesProgram { get; set; }
            public Boolean SmartThinking { get; set; }
            public string HearAboutUs { get; set; }
        }

        public class Activity
        {
            public int Id { get; set; }
            public Location currentLocation { get; set; }
            public DateTime lastAction { get; set; }
            public DateTime whenLoggedIn { get; set; }

        }
        public ClaimsIdentity GenerateUserIdentity(ApplicationUserManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        // I'm a table named Locations of type Location...
        public DbSet<Location> Locations { get; set; }
        public DbSet<ApplicationUser.Activity> Activities { get; set; }
    }
}

#region Helpers
namespace Concordia42
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request.QueryString[ProviderNameKey];
        }

        public const string CodeKey = "code";
        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }

        public const string UserIdKey = "userId";
        public static string GetUserIdFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
        }

        public static string GetResetPasswordRedirectUrl(string code, HttpRequest request)
        {
            var absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
        {
            var absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
}
#endregion
