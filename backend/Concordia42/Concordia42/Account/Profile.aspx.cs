using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Concordia42.Models;

namespace Concordia42.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            /* todo check roles */

        }

        protected void FinishBtn_Click(object sender, EventArgs e)
        {
            /* validate form */
            if (IsValid)
            {

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = manager.FindById(User.Identity.GetUserId());

                if (user != null)
                {
                    ApplicationUser.StudentProfile userProfile = user.profile ?? new ApplicationUser.StudentProfile();

                    /* grab data from site */
                    userProfile.GradeLevel = classLevel.Text.Trim();
                    userProfile.GradSemester = EstimatedGradDate.Text.Trim();
                    userProfile.Major = Major.Text.Trim();
                    userProfile.Minor = Minor.Text.Trim();
                    userProfile.WhySeking = Why.Text.Trim();
                    userProfile.NeedHelpWith = WhatCourses.Text.Trim();


                    /* optional information */
                    userProfile.Ethnicity = Ethnicity.Text.Trim();
                    userProfile.Gender = Gender.Text.Trim();
                    userProfile.CountryOfOrigin = CountryOfOrigin.Text.Trim();
                    userProfile.International = InternationalStudent.Checked;
                    userProfile.HomeLanguages = LanguagesSpoken.Text.Trim();
                    userProfile.ReceivingServices = OtherPrograms.Checked;
                    userProfile.ReceivingServicesFrom = ListOtherPrograms.Text.Trim();
                    userProfile.DegreesProgram = DegreesProgram.Checked;
                    userProfile.SmartThinking = Smartthinking.Checked;
                    userProfile.HearAboutUs = How.Text.Trim();


                    /* okay, update profile and redirect */
                    user.profile = userProfile; /* in case we just made a new one */
                    manager.Update(user);
                    Response.Redirect("~/Account/Manage?m=ProfileCreated");
                }
            }
        }
    }
}