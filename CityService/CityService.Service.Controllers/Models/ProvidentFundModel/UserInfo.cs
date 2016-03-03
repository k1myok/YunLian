using CityService.Service.Controllers.Models.ProvidentFundModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using CityService.Service.Controllers.Common;

namespace CityService.Service.Controllers
{
    public class UserInfo
    {
        //public string CorpName { get; set; }
        public string CustAcNo { get; set; }
        public string CustName { get; set; }
        public string PaperId { get; set; }
        //[UIHint("Decimal")]
        public string MonthInco { get; set; }
        //public string AccuAmt { get; set; }
        //[UIHint("Decimal")]
        public string SumAmt { get; set; }
        //[UIHint("Decimal")]
        public string Bal { get; set; }
        public string LastSaveMonth { get; set; }
        public string CustAcStat { get; set; }
        public string CorpPerc { get; set; }
        public string CustPerc { get; set; }
        public string OperDate { get; set; }
        public string CardFlag { get; set; }
        //public string BankType { get; set; }
        public string BindBankType { get; set; }
        public string BankCardNo { get; set; }
        //缴存银行
        public string JcBankName { get; set; }
        //缴存地区
        public string accuorgaid { get; set; }

        public List<Deposit> depList { get; set; }
        
        public string pages { get; set; }
        public string page { get; set; }
        public string total { get; set; }

        public static UserInfo FromHashtable(Hashtable hash)
        {
            UserInfo userInfo = new UserInfo();
            //userInfo.MonthInco = StringHelper.ConvertToCustomDecimalDigits(hash["monthinco"].ToString(), 2);
            //userInfo.SumAmt = StringHelper.ConvertToCustomDecimalDigits(hash["sumamt"].ToString(),2);
            //userInfo.Bal = StringHelper.ConvertToCustomDecimalDigits(hash["bal"].ToString(),2);
            userInfo.MonthInco = hash["monthinco"].ToString();
            userInfo.SumAmt = hash["sumamt"].ToString();
            userInfo.Bal = hash["bal"].ToString();
            var bindbanktype = hash["bindbanktype"].ToString();
            if (bindbanktype == "建设银行") { userInfo.BindBankType = "建行"; }
            else if ("中国银行" == bindbanktype) { userInfo.BindBankType = "中行"; }
            else if ("农业银行" == bindbanktype) { userInfo.BindBankType = "农行"; }
            else if ("工商银行" == bindbanktype) { userInfo.BindBankType = "工行"; }
            else if ("交通银行" == bindbanktype) { userInfo.BindBankType = "交行"; }
            else { userInfo.BindBankType = bindbanktype; }
            userInfo.BankCardNo = hash["bankcardno"].ToString();
            userInfo.CardFlag = hash["cardflag"].ToString() == "0" ? "未发" : "已发";
            userInfo.CorpPerc = hash["corpperc"].ToString();
            userInfo.CustAcNo = hash["custacno"].ToString();
            userInfo.CustAcStat = hash["custacstat"].ToString();
            if (userInfo.CustAcStat == "200")
            {
                userInfo.CustAcStat = "正常";
            }
            else if (userInfo.CustAcStat == "201")
            {
                userInfo.CustAcStat = "销户";
            }
            else if (userInfo.CustAcStat == "202")
            {
                userInfo.CustAcStat = "封存";
            }
            userInfo.CustName = hash["custname"].ToString();
            userInfo.CustPerc = hash["custperc"].ToString();
            userInfo.LastSaveMonth = hash["lastsavemonth"].ToString().Substring(0, 4) + "/" + hash["lastsavemonth"].ToString().Substring(4, 2);
            
            userInfo.OperDate = hash["operdate"].ToString().Substring(0, 4) + "/" + hash["operdate"].ToString().Substring(4, 2) + "/" +
                hash["operdate"].ToString().Substring(6, 2);

            userInfo.PaperId = hash["paperid"].ToString();
            userInfo.JcBankName = hash["jcbankname"].ToString();
            userInfo.accuorgaid = hash["accuorgaid"] ==null? null : hash["accuorgaid"].ToString();
            return userInfo;
        }
    }
}
