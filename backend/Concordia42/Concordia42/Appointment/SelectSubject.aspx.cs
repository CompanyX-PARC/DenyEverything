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

        }

        protected void SubjectList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplicationDbContext db = new ApplicationDbContext();

            

        }
    }
}