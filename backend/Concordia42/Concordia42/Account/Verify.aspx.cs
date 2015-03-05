﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace Concordia42.Account
{
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void verifyButton_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            Response.Write(user.VerificationCode);
            if (user != null) {
                if (!String.IsNullOrEmpty(user.VerificationCode)) { 
                    // success!
                    if (user.VerificationCode.Equals(verifyCode.Text))
                    {
                        user.EmailConfirmed = true;
                        user.VerificationCode = null;
                        manager.Update(user); // should I be using async?
                        ErrorMessage.Text = "YAY :D :D :D :D :D :D: D: D:";
                    }
                }
            }
        }
    }
}