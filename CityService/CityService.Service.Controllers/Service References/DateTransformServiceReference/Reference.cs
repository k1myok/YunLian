﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.34209
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CityService.Service.Controllers.DateTransformServiceReference {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="CheckCodeResult", Namespace="http://schemas.datacontract.org/2004/07/SelectProvidentFundService")]
    [System.SerializableAttribute()]
    public partial class CheckCodeResult : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CheckCodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private bool ResultField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CheckCode {
            get {
                return this.CheckCodeField;
            }
            set {
                if ((object.ReferenceEquals(this.CheckCodeField, value) != true)) {
                    this.CheckCodeField = value;
                    this.RaisePropertyChanged("CheckCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Message {
            get {
                return this.MessageField;
            }
            set {
                if ((object.ReferenceEquals(this.MessageField, value) != true)) {
                    this.MessageField = value;
                    this.RaisePropertyChanged("Message");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public bool Result {
            get {
                return this.ResultField;
            }
            set {
                if ((this.ResultField.Equals(value) != true)) {
                    this.ResultField = value;
                    this.RaisePropertyChanged("Result");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DateTransformServiceReference.IDataTransformService")]
    public interface IDataTransformService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFund", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundResponse")]
        string GetProvidentFund(string idCard, string id, string trancode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFundDepositInfo", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundDepositInfoResponse")]
        string GetProvidentFundDepositInfo(string idCard, string id, string page, string total, string pages, string trancode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFundLoanInfo", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundLoanInfoResponse")]
        string GetProvidentFundLoanInfo(string idCard, string trancode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFundRepayInfo", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundRepayInfoResponse")]
        string GetProvidentFundRepayInfo(string loadNum, string page, string total, string pages, string trancode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/SendCheckCode", ReplyAction="http://tempuri.org/IDataTransformService/SendCheckCodeResponse")]
        CityService.Service.Controllers.DateTransformServiceReference.CheckCodeResult SendCheckCode(string custAcNo, string paperId, string mobile);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDataTransformServiceChannel : CityService.Service.Controllers.DateTransformServiceReference.IDataTransformService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DataTransformServiceClient : System.ServiceModel.ClientBase<CityService.Service.Controllers.DateTransformServiceReference.IDataTransformService>, CityService.Service.Controllers.DateTransformServiceReference.IDataTransformService {
        
        public DataTransformServiceClient() {
        }
        
        public DataTransformServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DataTransformServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DataTransformServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DataTransformServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetProvidentFund(string idCard, string id, string trancode) {
            return base.Channel.GetProvidentFund(idCard, id, trancode);
        }
        
        public string GetProvidentFundDepositInfo(string idCard, string id, string page, string total, string pages, string trancode) {
            return base.Channel.GetProvidentFundDepositInfo(idCard, id, page, total, pages, trancode);
        }
        
        public string GetProvidentFundLoanInfo(string idCard, string trancode) {
            return base.Channel.GetProvidentFundLoanInfo(idCard, trancode);
        }
        
        public string GetProvidentFundRepayInfo(string loadNum, string page, string total, string pages, string trancode) {
            return base.Channel.GetProvidentFundRepayInfo(loadNum, page, total, pages, trancode);
        }
        
        public CityService.Service.Controllers.DateTransformServiceReference.CheckCodeResult SendCheckCode(string custAcNo, string paperId, string mobile) {
            return base.Channel.SendCheckCode(custAcNo, paperId, mobile);
        }
    }
}