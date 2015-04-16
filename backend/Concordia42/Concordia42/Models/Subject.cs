using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Concordia42.Models
{
    public class Subject
    {
        public Subject() 
            //: base()
        {

        }

        public int ID { get; set; }
        public String Department { get; set; }
        public String Number { get; set; }
        public String Description { get; set; }

        public virtual ICollection<ApplicationUser> Users { get; set; }

    }
}