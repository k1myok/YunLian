using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using CityService.Service.Controllers.Common;

namespace CityService.Service.Controllers.Models.ProvidentFundModel
{
    public class Loan
    {
        public string LoanId { get; set; }
        public string CustName { get; set; }
        public string CustAcNo { get; set; }
        public string PaperId { get; set; }
        public string LoanAcNo { get; set; }
        //贷款银行
        public string BankType { get; set; }
        //银行名称
        public string BankName { get; set; }
        //[UIHint("Decimal")]
        //贷款金额
        public string TCapi { get; set; }
        public string BeginDate { get; set; }
        //贷款期限
        public string ApptTerm { get; set; }
        public string ReleDate { get; set; }
        //月还款日
        public string RetuDay { get; set; }
        //还款方式
        public string RetuKind { get; set; }
        //[UIHint("Decimal")]
        public string Amt { get; set; }

        //贷款余额
        //[UIHint("Decimal")]
        public string Bal { get; set; }
        public string SubsAcNo { get; set; }
        //还款状态
        public string OverFlag { get; set; }
        //拖欠本金
        //[UIHint("Decimal")]
        public string OverBal { get; set; }
        //拖欠利息
        //[UIHint("Decimal")]
        public string OverInte { get; set; }
        public string InteRate { get; set; }
        //贷款状态
        public string LoanState { get; set; }
        //所在地区
        public string AreaKind { get; set; }
        //房屋总价
        //[UIHint("Decimal")]
        public string TotalAmt { get; set; }
        //建筑面积
        //[UIHint("Decimal")]
        public string HouseArea { get; set; }
        //房屋坐落

        public string DetailAddr { get; set; }

        public List<Repayment> RepList { get; set; }
        public string pages { get; set; }
        public string page { get; set; }
        public string total { get; set; }

        public static Loan FromHashTable(Hashtable hash)
        {
            Loan l = new Loan();
            l.Amt = hash["amt"].ToString();
            l.Bal = hash["bal"].ToString();
            l.ApptTerm = hash["apptterm"].ToString();
            l.AreaKind = hash["areakind"].ToString();
            
            l.BankName = hash["bankname"].ToString();
            l.BankType = hash["banktype"].ToString();
            if (!string.IsNullOrEmpty(hash["begindate"].ToString()))
            {
                l.BeginDate = hash["begindate"].ToString().Substring(0, 4) + "/" + hash["begindate"].ToString().Substring(4, 2) + "/" + hash["begindate"].ToString().Substring(6, 2);
            }
            else
            {
                l.BeginDate = hash["begindate"].ToString();
            }
            l.CustAcNo = hash["custacno"].ToString();
            l.CustName = hash["custname"].ToString();
            l.DetailAddr = hash["detailaddr"].ToString();
            l.HouseArea = hash["housearea"].ToString();
            l.InteRate = hash["interate"].ToString();
            l.LoanAcNo = hash["loanacno"].ToString();
            l.LoanId = hash["loanid"].ToString();
            l.LoanState = hash["loanstate"].ToString();
            if (l.LoanState == "0")
            {
                l.LoanState = "未放款";
            }
            else if (l.LoanState == "1")
            {
                l.LoanState = "已放款";
            }
            else if (l.LoanState == "2")
            {
                l.LoanState = "已销户";
            }
            l.OverFlag = hash["overflag"].ToString();
            l.OverInte = hash["overinte"].ToString();
            l.PaperId = hash["paperid"].ToString();
            l.OverBal = hash["overbal"].ToString();
            if (!string.IsNullOrEmpty(hash["reledate"].ToString()))
            {
                l.ReleDate = hash["reledate"].ToString().Substring(0, 4) + "/" + hash["reledate"].ToString().Substring(4, 2) + "/" + hash["reledate"].ToString().Substring(6, 2);
            }
            else
            {
                l.ReleDate = hash["reledate"].ToString();
            }
            l.RetuDay = hash["retuday"].ToString();
            l.RetuKind = hash["retukind"].ToString();
            if (l.RetuKind == "01")
            {
                l.RetuKind = "等额本息";
            }
            else if (l.RetuKind == "02")
            {
                l.RetuKind = "等额本金";
            }
            else
            {
                l.RetuKind = string.Empty;
            }
            l.SubsAcNo = hash["subsacno"].ToString();
            l.TCapi = hash["tcapi"].ToString();
            l.TotalAmt = hash["totalamt"].ToString();
            l.AreaKind = hash["areakind"].ToString();
            return l;
        }
    }
}
