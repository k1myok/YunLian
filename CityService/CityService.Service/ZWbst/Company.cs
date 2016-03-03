using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CityService.Service.ZWbst;

namespace CityService.Service
{
  public  class Company
    {
      public string succ { get; set; }
      public string statusCode { get; set; }
      public string msg { get; set; }
      public CompanyDetail data { get; set; }
      public string time { get; set; }
    }
}
