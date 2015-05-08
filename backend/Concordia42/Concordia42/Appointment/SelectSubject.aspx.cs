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
            }
        }

        protected void ClassButton_Click(object sender, EventArgs e)
        {

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
          
        }

        protected void ClassList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            int id = Convert.ToInt32(ClassList.SelectedValue);
            var bob = db.SubjectUsers.FirstOrDefault(o => o.SubjectID == id);

            if (bob != null) {
                string userId = bob.UserID;
                var bob2 = db.Users.Where(o => o.Id.Equals(userId)).ToList();

                TutorList.DataValueField = "Id";
                TutorList.DataTextField = "FirstName";
                TutorList.DataSource = bob2;
                TutorList.DataBind();

                TutorFieldset.Visible = true;
            }
        }
    }
}