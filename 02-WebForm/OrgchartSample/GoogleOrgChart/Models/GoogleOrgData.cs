using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoogleOrgChart.Models
{
    public class GoogleOrgData
    {
        public string Employee { get; set; }
        public string Manager { get; set; }
        public string mgrID { get; set; }
        public string designation { get; set; }
        public string empID { get; set; }
    }
}