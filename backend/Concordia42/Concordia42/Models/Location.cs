using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Concordia42.Models
{
    public class Location
    {

        public Location()
            : base()
        {
            activities = new List<Concordia42.Models.ApplicationUser.Activity>();
        }

        public int ID { get; set; }
        public String locName { get; set; }
        public virtual ICollection<Concordia42.Models.ApplicationUser.Activity> activities { get; set; }
    }
}