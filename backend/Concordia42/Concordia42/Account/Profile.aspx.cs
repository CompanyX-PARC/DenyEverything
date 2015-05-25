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
        private ApplicationUserManager manager;
        private ApplicationUser user;

        protected void Page_Load(object sender, EventArgs e)
        {
            /* todo check roles */
            /* preload */
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindById(User.Identity.GetUserId());

            if (user != null)
            {

                /* hide the name fields if this is the user doesn't have a profile */
                if (user.profile == null)
                {
                    FirstNameDiv.Visible = false;
                    LastNameDiv.Visible = false;
                }
                else
                {
                    Page.Title = "Update Profile";
                    FinishBtn.Text = "Update";
                }

                if (!IsPostBack)
                {
                    if (user.profile == null) { user.profile = new ApplicationUser.StudentProfile(); }

                    if (user.profile.GradeLevel != null && classLevel.Items.FindByValue(user.profile.GradeLevel) != null)
                    {
                        classLevel.SelectedValue = classLevel.Items.FindByValue(user.profile.GradeLevel).Value;
                    }

                    FirstName.Text = user.FirstName;
                    LastName.Text = user.LastName;

                    EstimatedGradDate.Text = user.profile.GradSemester;
                    Major.Text = user.profile.Major;
                    Minor.Text = user.profile.Minor;
                    Why.Text = user.profile.WhySeking;
                    WhatCourses.Text = user.profile.NeedHelpWith;

                    Ethnicity.Text = user.profile.Ethnicity;
                    Gender.Text = user.profile.Gender;
                    CountryOfOrigin.Text = user.profile.CountryOfOrigin;
                    InternationalStudent.Checked = user.profile.International;
                    LanguagesSpoken.Text = user.profile.HomeLanguages;
                    OtherPrograms.Checked = user.profile.ReceivingServices;
                    ListOtherPrograms.Text = user.profile.ReceivingServicesFrom;
                    DegreesProgram.Checked = user.profile.DegreesProgram;
                    Smartthinking.Checked = user.profile.SmartThinking;
                    How.Text = user.profile.HearAboutUs;
                }
            }
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
                    Boolean createdNew = false;
                    ApplicationUser.StudentProfile userProfile;
                    if (user.profile == null)
                    {
                        createdNew = true;
                        userProfile = new ApplicationUser.StudentProfile();
                    }
                    else
                    {
                        userProfile = user.profile;
                    }

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

                    /* edit name if necessary */
                    if (user.profile != null && FirstNameDiv.Visible)
                    {
                        user.FirstName = FirstName.Text.Trim();
                    }

                    /* edit name if necessary */
                    if (user.profile != null && LastNameDiv.Visible)
                    {
                        user.LastName = LastName.Text.Trim();
                    }


                    /* okay, update profile and redirect */
                    user.profile = userProfile; /* in case we just made a new one */
                    manager.Update(user);
                    if (createdNew)
                    {
                        Response.Redirect("~/Account/Manage?m=ProfileCreated");
                    }
                    else
                    {
                        Response.Redirect("~/Account/Manage?m=ProfileUpdated");
                    }
                   
                }
            }
        }
    }
}