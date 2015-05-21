using Concordia42.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Appointment
{
    public partial class SelectSubject : System.Web.UI.Page
    {    
       protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                SubjectList.AppendDataBoundItems = true;
                SubjectList.Items.Insert(0, "-- Select Subject --");
                ClassList.AppendDataBoundItems = true;
                ClassList.Items.Insert(0, "-- Select Class --");
                TutorList.AppendDataBoundItems = true;
                TutorList.Items.Insert(0, "-- Select Tutor --");
                TutorFieldset.Visible = false;
                ClassFieldset.Visible = false;
                DateFieldset.Visible = false;
            }
        }

        protected void ClassButton_Click(object sender, EventArgs e)
        {
            var db = new ApplicationDbContext();

            // make an appointment with this user
            int day = Calendar1.SelectedDate.Day;
            int month = Calendar1.SelectedDate.Month;
            int year = Calendar1.SelectedDate.Year;

            DateTime temp = DateTime.Parse(TimeList.SelectedValue);
            int hour = temp.Hour;
            int minute = temp.Minute;

            DateTime dt = new DateTime(year, month, day, hour, minute, 0);

            var newAppointment = new Concordia42.Models.Appointment();

            newAppointment.StartDate = dt;
            newAppointment.Duration = 30 * 60; // 30 minutes

            int sid = Convert.ToInt32(ClassList.SelectedValue);

            var subject = db.Subjects.FirstOrDefault(o => o.ID == sid);
          
            newAppointment.Subject = subject;
            newAppointment.Tutee = db.Users.FirstOrDefault(o => o.Email.Equals(User.Identity.Name));
            newAppointment.Tutor = db.Users.FirstOrDefault(o => o.Id.Equals(TutorList.SelectedValue));

            db.Appointments.Add(newAppointment);
            db.SaveChanges();

            Response.Redirect("~/Calendork");
        }

        protected void SubjectList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            var bob = db.Subjects.Where(o => o.Department.Equals(SubjectList.SelectedValue.Trim())).ToList();

            ClassList.DataValueField = "ID";
            ClassList.DataTextField = "Number";
            ClassList.DataSource = bob;
            ClassList.DataBind();

            ClassFieldset.Visible = true;
        }

        protected void TutorList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateFieldset.Visible = true;
        }

        protected void ClassList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            int id = Convert.ToInt32(ClassList.SelectedValue);
            List<SubjectUser> bob = db.SubjectUsers.Where(o => o.SubjectID == id).ToList();
            
            if (bob.Count != 0) {
                List<ApplicationUser> users = new List<ApplicationUser>();
                foreach (SubjectUser bob2 in bob) { 
                    string userId = bob2.UserID;
                    users.Add(db.Users.FirstOrDefault(o => o.Id.Equals(userId)));

                }
                
                TutorList.DataValueField = "Id";
                TutorList.DataTextField = "FirstName";
                TutorList.DataSource = users;
                TutorList.DataBind();

                TutorFieldset.Visible = true;
            }
        }
    }
}