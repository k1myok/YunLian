﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CityService.Service.PoliceInfo
{
   public class ConsultingAnswerResult
    {
       public string Context { get; set; }
       public string IsNiMing { get; set; }
       public string FreeStr1 { get; set; }
       public string QuestionId{get;set;}
       public string FreeStr2{get;set;} 
       public string CreateTime{get;set;}
       public string CreateUserID{get;set;}
       public string  Guid {get;set;}
       public string IsChecked { get; set; }

    }
}
