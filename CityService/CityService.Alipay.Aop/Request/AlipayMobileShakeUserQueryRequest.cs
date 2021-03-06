using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.mobile.shake.user.query
    /// </summary>
    public class AlipayMobileShakeUserQueryRequest : IAopRequest<AlipayMobileShakeUserQueryResponse>
    {
        /// <summary>
        /// 动态ID
        /// </summary>
        public string DynamicId { get; set; }

        /// <summary>
        /// 动态ID类型：  wave_code：声波  qr_code：二维码  bar_code：条码
        /// </summary>
        public string DynamicIdType { get; set; }

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
            return "alipay.mobile.shake.user.query";
        }

        public IDictionary<string, string> GetParameters()
        {
            AopDictionary parameters = new AopDictionary();
            parameters.Add("dynamic_id", this.DynamicId);
            parameters.Add("dynamic_id_type", this.DynamicIdType);
            return parameters;
        }

        #endregion
    }
}
