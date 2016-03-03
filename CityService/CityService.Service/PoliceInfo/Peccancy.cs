using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityService.Service.PoliceInfo
{
    public class Peccancy
    {
        public string SN { get; set; }
        public string Address { get; set; }
        public string Provider { get; set; }
        public string Fins { get; set; }
        public string Violation { get; set; }
        public List<string> Photos { get; set; }
        public string ProcessFlag { get; set; }
        public string PayFineFlag { get; set; }
        public string Time { get; set; }
    }
}