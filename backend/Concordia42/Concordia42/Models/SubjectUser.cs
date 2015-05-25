using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Concordia42.Models
{
    public class SubjectUser
    {
        public virtual ApplicationUser User { get; set; }
        public virtual Subject Subject { get; set; }

        [Required, Key, Column(Order = 1), ForeignKey("Subject")]
        public int SubjectID { get; set; }

        [Required, Key, Column(Order = 0), ForeignKey("User")]
        public string UserID { get; set; }
    }
}