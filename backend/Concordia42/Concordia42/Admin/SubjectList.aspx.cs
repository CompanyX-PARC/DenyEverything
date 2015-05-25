using Concordia42.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Admin
{
    public partial class SubjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            Subject s = new Subject();
            TextBox departmentBox = (TextBox)GridView1.FooterRow.FindControl("TextBox4");
            TextBox numberBox = (TextBox)GridView1.FooterRow.FindControl("TextBox5");
            TextBox descriptionBox = (TextBox)GridView1.FooterRow.FindControl("TextBox6");

            s.Department = departmentBox.Text.Trim();
            s.Number = numberBox.Text.Trim();
            s.Description = descriptionBox.Text.Trim();
            //db.Entry(s).State = System.Data.Entity.EntityState.Added;

            db.Subjects.Add(s);
            db.SaveChanges();

            GridView1.DataBind();
        }
    }


}