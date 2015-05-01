using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concordia42.Account
{
    public partial class SIManageSubjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void czechUpdate(object sender, EventArgs e)
        {
            
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
                    }
                    if (!chkRow.Checked)
                    {
                        row.BackColor = System.Drawing.Color.White;
                    }
                }
            }  
        }
    }
}