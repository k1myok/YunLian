﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityService.Service.PoliceInfo
{
    public class RegisterResidentCardResult
    {
        public string succ { get; set; }
        public string statusCode { get; set; }
        public string msg { get; set; }
        public RegisterResidentCard data { get; set; }
        public string time { get; set; }
    }
}