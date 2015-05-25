using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Concordia42.Models
{
    public class OfficeHourRepeat
    {
        public int ID { get; set; }
        public int Repeat { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }


    public class OfficeHour
    {
        public int ID { get; set; }
        public int Duration { get; set; }
        public DateTime Time { get; set; }

        public virtual ApplicationUser User { get; set; }
        public virtual ICollection<OfficeHourRepeat> Repeats { get; set; }
    }
}