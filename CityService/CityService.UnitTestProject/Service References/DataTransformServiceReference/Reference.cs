﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CityService.UnitTestProject.DataTransformServiceReference {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DataTransformServiceReference.IDataTransformService")]
    public interface IDataTransformService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFund", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundResponse")]
        string GetProvidentFund(string idCard, string id, string trancode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDataTransformService/GetProvidentFund", ReplyAction="http://tempuri.org/IDataTransformService/GetProvidentFundResponse")]
        System.Threading.Tasks.Task<string> GetProvidentFundAsync(string idCard, string id, string trancode);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDataTransformServiceChannel : CityService.UnitTestProject.DataTransformServiceReference.IDataTransformService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DataTransformServiceClient : System.ServiceModel.ClientBase<CityService.UnitTestProject.DataTransformServiceReference.IDataTransformService>, CityService.UnitTestProject.DataTransformServiceReference.IDataTransformService {
        
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
        
        public System.Threading.Tasks.Task<string> GetProvidentFundAsync(string idCard, string id, string trancode) {
            return base.Channel.GetProvidentFundAsync(idCard, id, trancode);
        }
    }
}
