using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Concordia42.Models
{
    public class Appointment
    {

        // apt id
        public int ID { get; set; }
        public virtual ApplicationUser.StudentProfile Profile { get; set; }
        public virtual Subject Subject {get; set;}
        public Boolean ShowedUp { get; set; }
        public int Duration { get; set; }
        public DateTime StartDate { get; set; }
        public string Comment { get; set; }
        
    }
}