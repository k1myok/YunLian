using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CityService.Service.ZWbst;

namespace CityService.Service
{
   public  class ZWBSTSF
    {
       public string succ { get; set; }
       public string statusCode { get; set;}
       public string msg { get; set; }
       public List<Price>data{get;set;}
       public string time{get;set;}
       public string REMARK1 { get; set; }
    }
}
