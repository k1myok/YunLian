using CityService.Service.Controllers.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace CityService.Service.Controllers.Models.ProvidentFundModel
{
    public class Deposit
    {
        public string CustAcNo { get; set; }
        public string CustName { get; set; }
        //业务类别
        public string BusiDetailType { get; set; }
        public string AcDate { get; set; }
        public string SaveMonth { get; set; }
        //[UIHint("Decimal")]
        public string Amt { get; set; }
        //[UIHint("Decimal")]
        public string Bal { get; set; }
        public string BankName { get; set; }
        public string Note { get; set; }
        public static Deposit FromHashtable(Hashtable depositHashtable)
        {
            Deposit d = new Deposit();
            d.AcDate = depositHashtable["acdate"].ToString().Substring(0, 4) + "/" + depositHashtable["acdate"].ToString().Substring(4, 2) + "/" + depositHashtable["acdate"].ToString().Substring(6, 2);
            //d.Amt = StringHelper.ConvertToCustomDecimalDigits(depositHashtable["amt"].ToString(), 2);
            //d.Bal = StringHelper.ConvertToCustomDecimalDigits(depositHashtable["bal"].ToString(),2);
            d.Amt = depositHashtable["amt"].ToString();
            d.Bal = depositHashtable["bal"].ToString();
            d.BankName = depositHashtable["bankname"].ToString();
            d.BusiDetailType = depositHashtable["busidetailtype"].ToString();
            switch (d.BusiDetailType.Trim())
            {
                case "101":
                case "102":
                case "103":
                case "109":
                case "111":
                case "113":
                case "114":
                    d.BusiDetailType = "收入";
                    break;
                case "106":
                case "107":
                case "108":
                case "112":
                case "210":
                    d.BusiDetailType = "支出";
                    break;
                case "110":
                    d.BusiDetailType = "结息";
                    break;
            }
            d.CustAcNo = depositHashtable["custacno"].ToString();
            d.CustName = depositHashtable["custname"].ToString();
            return d;
        }
    }
}
