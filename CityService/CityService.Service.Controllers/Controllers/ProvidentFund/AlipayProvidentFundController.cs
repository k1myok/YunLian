using CityService.Service.Controllers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using CityService.Service.Controllers.Models.ProvidentFundModel;
using AFG.Map.Transform;
using CityService.Service.Controllers.DateTransformServiceReference;
using CityService.Service.Controllers.Common;
using System.Configuration;
using Aop.Api.Request;
using Aop.Api.Response;
using Aop.Api;


namespace CityService.Service.Controllers
{
    public class AlipayProvidentFundController : Controller
    {
        private static  string appId =ConfigurationManager.AppSettings["AlipayappId"];
        private static string secret = ConfigurationManager.AppSettings["Alipaysecret"];
       // private static string uri = ConfigurationManager.AppSettings["url"];

        private static string _backCallUrl = "http://app.china-ccw.com:8011/AlipayProvidentFund/AlipayProvidentFund/BaseCallback";

        public ActionResult LoansCalculate() {
            return View();
        }

        public ActionResult WorkGuide()
        {
            return View();
        }
        public ActionResult SelectPoint()
        {
            return View();
        }
        public ActionResult SelectPointResult(string address)
        {
            return View();
        }
        public ActionResult ShowImage(string url)
        {
            return View();
        }
        public ActionResult BaseCallback(string auth_code)
        {
            //根据获取的code取得OpenID
            var result = GetOpenID.GetAlipayOpenID(auth_code);
            if (string.IsNullOrEmpty(result))
            {
                return RedirectToAction("AddAccount", "AlipayProvidentFund");
            }
            else
            {
                Session["OpenID"] = result;
                if (Session["User"] == null)
                {
                    ProvidentFundEntities pfe = new ProvidentFundEntities();
                    var user = pfe.AlipayUser.SingleOrDefault(u =>u.OpenID ==result);
                    if (user != null)
                    {
                        Session["User"] = user.PFID;
                        return RedirectToCurrentPage();
                    }
                    else
                    {
                        return RedirectToAction("AddAccount", "AlipayProvidentFund");
                    }
                }
                else
                {
                    return RedirectToCurrentPage();
                }
            }
        }
        /// <summary>
        /// 根据当前点击的模块跳转到响应的页面
        /// </summary>
        /// <returns></returns>
        public ActionResult RedirectToCurrentPage()
        {
            var clickMenu = Session["ClickMenu"] == null ? "" : Session["ClickMenu"].ToString();
            if (clickMenu == "LoanQuery")
                return RedirectToAction("SelectLoanResult", "AlipayProvidentFund");
            else if (clickMenu == "AccountQuery")
                return RedirectToAction("SelectBalanceResult", "AlipayProvidentFund");
            else
                return RedirectToAction("AccountResult", "AlipayProvidentFund");
        }

        public ActionResult AddAccount()
        {
            //获取openid
            if (Session["OpenID"] == null)
            {
                var url = GetOpenID.GetAlipayAuthorizeUrl(_backCallUrl);
                return Redirect(url);
            }
            else
            {
                 
                ProvidentFundEntities pfe = new ProvidentFundEntities();
                var openid = Session["OpenID"].ToString();
                var account = pfe.AlipayUser.SingleOrDefault(u => u.OpenID == openid);
                if (account == null)
                {
                    return View();
                }
                else
                {
                    Session["User"] = account.PFID;
                    return RedirectToAction("AccountResult", "AlipayProvidentFund");
                }
            }
        }
        /// <summary>
        /// 绑定用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddAccount(AlipayUser user)
        {
            var openid = Session["OpenID"].ToString();
            ProvidentFundEntities pfe = new ProvidentFundEntities();
            var existedUser = pfe.AlipayUser.FirstOrDefault(u => u.OpenID == openid);
            if (existedUser != null)
            {
                Session["User"] = existedUser.PFID;
                return RedirectToAction("AccountResult", "AlipayProvidentFund");
            }
            else
            {
                user.OpenID = openid;
                user.IsGJJ = pfe.GJJCenterUsers.Any(p => p.PFID == user.PFID);
                user.CreateDate = DateTime.Now;
                pfe.AlipayUser.Add(user);
            }

            if (pfe.SaveChanges() > 0)
            {
                Session["User"] = user.PFID;
                RedirectToAction("AccountResult", "AlipayProvidentFund");
            }
            return View();
        }
        public ActionResult Offline()
        {
            return View();
        }
        /// <summary>
        /// 注册用户信息
        /// </summary>
        /// <returns></returns>
        public ActionResult AccountResult()
        {
            if (Session["OpenID"] == null)
            {
                var url = GetOpenID.GetAlipayAuthorizeUrl(_backCallUrl);
                return Redirect(url);
            }
            else
            {
                if (Session["User"] == null)
                {
                    return RedirectToAction("AddAccount", "AlipayProvidentFund");
                }
                else
                {
                    var openid = Session["OpenID"].ToString();
                    ProvidentFundEntities pfe = new ProvidentFundEntities();
                    var user = pfe.AlipayUser.FirstOrDefault(u => u.OpenID == openid);
                    return View(user);
                }
            }
        }
        /// <summary>
        /// 解除绑定
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteAccount()
        {
            var openid = Session["OpenID"].ToString();
            ProvidentFundEntities pfe = new ProvidentFundEntities();
            AlipayUser user = pfe.AlipayUser.FirstOrDefault(u => u.OpenID == openid);
            pfe.AlipayUser.Remove(user);
            pfe.SaveChanges();
            Session["User"] = null;
            return RedirectToAction("AddAccount", "AlipayProvidentFund");
        }
        public ActionResult AccountList()
        {
            return View();
        }
        public ActionResult SelectBalance()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SelectBalance(User user)
        {
            return RedirectToAction("SelectBalanceResult");
        }
        /// <summary>
        /// 账户查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="idCard"></param>
        /// <returns></returns>
        public ActionResult SelectBalanceResult()
        {
            Session["ClickMenu"] = "AccountQuery";
            #if UnLogin
            return QueryBalanceResult(idCard, idPF);
            #else
            if (Session["OpenID"] == null)
            {
                var url = GetOpenID.GetAlipayAuthorizeUrl(_backCallUrl);
                return Redirect(url);
            }
            else
            {
                var openid = Session["OpenID"].ToString();
                ProvidentFundEntities pfe = new ProvidentFundEntities();
                var user = pfe.AlipayUser.FirstOrDefault(u => u.OpenID == openid);
                if (user == null)
                {
                    return RedirectToAction("AddAccount", "AlipayProvidentFund");
                }
                else
                {
                    //if (user.IsGJJ == false || user.IsGJJ == null)
                    //{
                    //    return RedirectToAction("Offline", "AlipayProvidentFund");
                    //}
                    //else
                    //{
                        return QueryBalanceResult(user.IDCard, user.PFID);
                   // }
                }
            }

#endif
        }
        private ActionResult QueryBalanceResult(string idCard, string idPF)
        {
            var userInfo = this.FindUserInfo(idCard,idPF,string.Empty,"0",string.Empty);
            if (userInfo == null) return RedirectToAction("NotAccount");
            return View(userInfo);
        }
        public ActionResult NotAccount()
        {
            Session["ClickMenu"] = "NoAccount";
            return View();
        }

       
        public ActionResult MoreDeposit(string idCard, string idPF, string pages, string page, string total)
        {
            var userInfo = this.FindUserInfo(idCard,idPF,pages,page,total);
            if (userInfo == null) return null;
            return Json(userInfo,JsonRequestBehavior.AllowGet);
        }
        private UserInfo FindUserInfo(string idCard, string idPF, string pages, string page, string total)
        {
            page = (int.Parse(page) + 1).ToString();
            //调用webservice  
            var client = new DataTransformServiceClient();
            var xml1 = client.GetProvidentFund(idCard, idPF, "GJ07L");
            UserInfo userInfo = null;
            var hash = XmlHelper.SelectSingleRecord(xml1, "response/data/list/cols", "response/data/list/rows/row");
            if (hash != null)
            {
                userInfo = UserInfo.FromHashtable(hash);
                var xml2 = client.GetProvidentFundDepositInfo(idCard, idPF, page, total, pages, "GJ08L1");
                userInfo.depList = new List<Deposit>();
                var hashList = XmlHelper.SelectRecords(xml2, "response/data/list/cols", "response/data/list/rows/row", "response/data/list/info");
                if (hashList != null)
                {
                    userInfo.pages = hashList[0]["pages"].ToString();
                    userInfo.page = hashList[0]["page"].ToString();
                    userInfo.total = hashList[0]["total"].ToString();
                    userInfo.depList = hashList.Select(p => Deposit.FromHashtable(p)).ToList();

                    return userInfo;
                }
            }
            return null;
        }
        public ActionResult NotLoan()
        {
            return View();
        }

        public ActionResult SelectLoan()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SelectLoan(User user)
        {
            return RedirectToAction("SelectLoanResult");
        }
        /// <summary>
        /// 贷款查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="idCard"></param>
        /// <returns></returns>
        public ActionResult SelectLoanResult()
        {
            Session["ClickMenu"] = "LoanQuery";
#if UnLogin
            return QueryLoanResult(idCard);
#else
           
            if (Session["OpenID"] == null)
            {
                var url = GetOpenID.GetAlipayAuthorizeUrl(_backCallUrl);
                return Redirect(url);
            }
            else 
            {
                var openid = Session["OpenID"].ToString();
                ProvidentFundEntities pfe = new ProvidentFundEntities();
                var user = pfe.AlipayUser.FirstOrDefault(u => u.OpenID == openid);
                if (user == null)
                {
                    return RedirectToAction("AddAccount", "AlipayProvidentFund");
                }
                else
                {
                    //if (user.IsGJJ == false || user.IsGJJ == null)
                    //{
                    //    return RedirectToAction("Offline", "AlipayProvidentFund");
                    //}
                    //else
                    //{
                        return QueryLoanResult(user.IDCard);
                   // }
                }
            }
#endif
        }
        public ActionResult QueryLoanResult(string idCard)
        {
            var loan = this.FindLoan(idCard, "0", string.Empty, string.Empty);
            if (loan == null)
                return RedirectToAction("Notloan");

            return View(loan);
        }

        public ActionResult MoreRepayment(string idCard, string page, string total, string pages)
        {
            var loan = this.FindLoan(idCard, page, total, pages);
            if (loan == null)
                return null;

            return Json(loan, JsonRequestBehavior.AllowGet);
        }

        private Loan FindLoan(string idCard, string page, string total, string pages)
        {
            page = (int.Parse(page) + 1).ToString();
            var client = new DataTransformServiceClient();
            var xml = client.GetProvidentFundLoanInfo(idCard, "J005L4");
            var hash = XmlHelper.SelectSingleRecord(xml, "response/data/list/cols", "response/data/list/rows/row");
            if (hash != null)
            {
                var loan = Loan.FromHashTable(hash);
                if (!string.IsNullOrEmpty(loan.LoanAcNo))
                {
                    var xml2 = client.GetProvidentFundRepayInfo(loan.LoanAcNo, page, total, pages, "J021L1");
                    var hashList = XmlHelper.SelectRecords(xml2, "response/data/list/cols", "response/data/list/rows/row", "response/data/list/info");
                    if (hashList != null && hashList.Count > 0)
                    {
                        loan.page = hashList[0]["page"].ToString();
                        loan.pages = hashList[0]["pages"].ToString();
                        loan.total = hashList[0]["total"].ToString();
                        loan.RepList = hashList.Select(p => Repayment.FromHashTable(p)).ToList();
                        
                        return loan;
                    }
                }
            }
            return null;
        }

        public ActionResult SelectCardPoint()
        {
            return View();
        }
        [HttpPost]
        public ActionResult getQQMapLocation(double lat, double lng)
        {
            Map map = new Map();
            map.Lat = lng;
            map.Lng = lat;
            CalculationLatLng(map);
            return Json(map, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// 转换坐标
        /// </summary>
        /// <param name="map"></param>
        /// <returns></returns>
        private static Map CalculationLatLng(Map map)
        {
            Gps gps = new Gps(Convert.ToDouble(map.Lng), Convert.ToDouble(map.Lat));
            Gps tx = PositionUtil.gps84_To_Gcj02(gps.getWgLat(), gps.getWgLon());
            map.Lat = Convert.ToDouble(Math.Round(tx.getWgLon(), 6));
            map.Lng = Convert.ToDouble(Math.Round(tx.getWgLat(), 6));
            return map;
        }
        /// <summary>
        /// 办事指南
        /// </summary>
        /// <returns></returns>
        public ActionResult LoanResult1()
        {
            return View();
        }
        public ActionResult LoanResult2()
        {
            return View();
        }

        public ActionResult DrawResult1(string title)
        {
            return View();
        }
        public ActionResult DrawResult2(string title)
        {
            return View();
        }
        public ActionResult DrawResult3(string title)
        {
            return View();
        }
        public ActionResult DrawResult4(string title)
        {
            return View();
        }
        public ActionResult DrawResult5(string title)
        {
            return View();
        }
        public ActionResult DrawResult6(string title)
        {
            return View();
        }
        public ActionResult DrawResult7(string title)
        {
            return View();
        }
        public ActionResult DrawResult8(string title)
        {
            return View();
        }
        public ActionResult DrawResult9(string title)
        {
            return View();
        }
        public ActionResult CardMangeResul1()
        {
            return View();
        }
        public ActionResult CardMangeResul2()
        {
            return View();
        }
        public ActionResult CardMangeResul3()
        {
            return View();
        }
        public ActionResult CardMangeResul4()
        {
            return View();
        }
        #region qian Add
        [HttpPost]
        public JsonResult SendCheckCode(string custAcNo, string paperId, string mobile)
        {
            //调用webservice
            var client = new DataTransformServiceClient();
            var result = client.SendCheckCode(custAcNo, paperId, mobile);
            return Json(result);
        }


        public ActionResult Default() {
            return View();
        }
        #endregion
    }
}