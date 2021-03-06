using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.siteprobe.instore.user
    /// </summary>
    public class AlipaySiteprobeInstoreUserRequest : IAopRequest<AlipaySiteprobeInstoreUserResponse>
    {
        /// <summary>
        /// 合作商户的分店ID
        /// </summary>
        public string MerchantId { get; set; }

        /// <summary>
        /// 是否查询当天生日
        /// </summary>
        public Nullable<bool> NeedBirthday { get; set; }

        /// <summary>
        /// 分配给公众号的ID
        /// </summary>
        public string PublicId { get; set; }

        /// <summary>
        /// 支付宝用户的uesrid
        /// </summary>
        public string UserId { get; set; }

        #region IAopRequest Members
		private string terminalType;
		private string terminalInfo;
        private string prodCode;

		public void SetTerminalType(String terminalType){
			this.terminalType=terminalType;
		}

    	public string GetTerminalType(){
    		return this.terminalType;
    	}

    	public void SetTerminalInfo(String terminalInfo){
    		this.terminalInfo=terminalInfo;
    	}

    	public string GetTerminalInfo(){
    		return this.terminalInfo;
    	}

        public void SetProdCode(String prodCode){
            this.prodCode=prodCode;
        }

        public string GetProdCode(){
            return this.prodCode;
        }

        public string GetApiName()
        {
            return "alipay.siteprobe.instore.user";
        }

        public IDictionary<string, string> GetParameters()
        {
            AopDictionary parameters = new AopDictionary();
            parameters.Add("merchant_id", this.MerchantId);
            parameters.Add("need_birthday", this.NeedBirthday);
            parameters.Add("public_id", this.PublicId);
            parameters.Add("user_id", this.UserId);
            return parameters;
        }

        #endregion
    }
}
