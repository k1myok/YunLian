using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.user.test
    /// </summary>
    public class AlipayUserTestRequest : IAopRequest<AlipayUserTestResponse>
    {
        /// <summary>
        /// 顶顶顶
        /// </summary>
        public List<String> Userinfo { get; set; }

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
            return "alipay.user.test";
        }

        public IDictionary<string, string> GetParameters()
        {
            AopDictionary parameters = new AopDictionary();
            parameters.Add("userinfo", this.Userinfo);
            return parameters;
        }

        #endregion
    }
}
