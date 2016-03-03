using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using CityService.Service.Controllers.Common;

namespace CityService.Service.Controllers.Models.ProvidentFundModel
{
    public class Repayment
    {
        public string LoanAcNo { get; set; }
        //[UIHint("Decimal")]
        public string rDate { get; set; }
        
        //还款金额
        //[UIHint("Decimal")]
        public string SumAmt { get; set; }
        
        //还款本金
        //[UIHint("Decimal")]
        public string RCapi { get; set; }
        
        //还款利息
        //[UIHint("Decimal")]
        public string rInte { get; set; }
        //[UIHint("Decimal")]
        public string Bal { get; set; }
        public string ListType { get; set; }

        public static Repayment FromHashTable(Hashtable hash) 
        {
            Repayment rep = new Repayment();
            //rep.Bal = StringHelper.ConvertToCustomDecimalDigits(hash["bal"].ToString(),2);
            rep.Bal = hash["bal"].ToString();
            rep.ListType = hash["listtype"].ToString();
            rep.LoanAcNo = hash["loanacno"].ToString();
            //rep.RCapi = StringHelper.ConvertToCustomDecimalDigits(hash["rcapi"].ToString(),2);
            rep.RCapi = hash["rcapi"].ToString();
            if (!string.IsNullOrEmpty(hash["rdate"].ToString()))
            {
                rep.rDate = hash["rdate"].ToString().Substring(0, 4) + "/" + hash["rdate"].ToString().Substring(4, 2) + "/" + hash["rdate"].ToString().Substring(6, 2);
            }
            else
            {
                rep.rDate = hash["rdate"].ToString();
            }
            //rep.rInte = StringHelper.ConvertToCustomDecimalDigits(hash["rinte"].ToString(),2);
            //rep.SumAmt = StringHelper.ConvertToCustomDecimalDigits(hash["sumamt"].ToString(),2);
            rep.rInte = hash["rinte"].ToString();
            rep.SumAmt = hash["sumamt"].ToString();
            return rep;
        }
    }
}
