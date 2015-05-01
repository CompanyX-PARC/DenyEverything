using Concordia42.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Concordia42.Account
{
    public partial class SIManageSubjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void czechUpdate(object sender, EventArgs e)
        {
            var db = new ApplicationDbContext();
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[3].FindControl("ChecksIt") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = System.Drawing.Color.Aqua;
                        //row.RowIndex
                       // string department = row.Cells[0].Text;
                        //string number = row.Cells[1].Text;
                        int id = Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value);
                        //Response.Write(id);

                      
                        //db.SubjectUsers.Contains<>;
                        SubjectUser bobDave = new SubjectUser();
                        bobDave.UserID = User.Identity.GetUserId();
                        bobDave.SubjectID = id;

                        string myStupidUserIdStupidGummyDicks = User.Identity.GetUserId();
                        if (!db.SubjectUsers.Any(s => s.SubjectID == id && s.UserID == myStupidUserIdStupidGummyDicks))
                        {
                            db.SubjectUsers.Add(bobDave);
                        }
                        
                    }
                    if (!chkRow.Checked)
                    {
                        row.BackColor = System.Drawing.Color.White;
                    }
                }
            }
            db.SaveChanges();

        }
    }
}