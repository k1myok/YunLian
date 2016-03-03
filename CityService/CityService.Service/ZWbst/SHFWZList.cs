using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CityService.Service
{
    public  class SHFWZList
    {
        public string succ { get; set; }
        public string statusCode { get; set; }
        public string msg{get;set;}
        public List<SHFWZListDetail>data { get; set; }


        public string time { get; set; }
    }
}
