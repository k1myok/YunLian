﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.0
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CityService.Service.KnowAllServiceReference {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="KnowAllServiceReference.WebService1Soap")]
    public interface WebService1Soap {
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 GetInfoXmlResult 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetInfoXml", ReplyAction="*")]
        global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse GetInfoXml(global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetInfoXml", ReplyAction="*")]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse> GetInfoXmlAsync(global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest request);
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 guid 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetcaseinfoByGuid", ReplyAction="*")]
        global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse GetcaseinfoByGuid(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetcaseinfoByGuid", ReplyAction="*")]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse> GetcaseinfoByGuidAsync(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest request);
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 GetServiceCompanyResult 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetServiceCompany", ReplyAction="*")]
        global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse GetServiceCompany(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetServiceCompany", ReplyAction="*")]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse> GetServiceCompanyAsync(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest request);
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 GetServiceEquipmentResult 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetServiceEquipment", ReplyAction="*")]
        global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse GetServiceEquipment(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetServiceEquipment", ReplyAction="*")]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse> GetServiceEquipmentAsync(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetInfoXmlRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetInfoXml", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequestBody Body;
        
        public GetInfoXmlRequest() {
        }
        
        public GetInfoXmlRequest(global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class GetInfoXmlRequestBody {
        
        public GetInfoXmlRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetInfoXmlResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetInfoXmlResponse", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponseBody Body;
        
        public GetInfoXmlResponse() {
        }
        
        public GetInfoXmlResponse(global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetInfoXmlResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string GetInfoXmlResult;
        
        public GetInfoXmlResponseBody() {
        }
        
        public GetInfoXmlResponseBody(string GetInfoXmlResult) {
            this.GetInfoXmlResult = GetInfoXmlResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetcaseinfoByGuidRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetcaseinfoByGuid", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequestBody Body;
        
        public GetcaseinfoByGuidRequest() {
        }
        
        public GetcaseinfoByGuidRequest(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetcaseinfoByGuidRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string guid;
        
        public GetcaseinfoByGuidRequestBody() {
        }
        
        public GetcaseinfoByGuidRequestBody(string guid) {
            this.guid = guid;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetcaseinfoByGuidResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetcaseinfoByGuidResponse", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponseBody Body;
        
        public GetcaseinfoByGuidResponse() {
        }
        
        public GetcaseinfoByGuidResponse(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetcaseinfoByGuidResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string GetcaseinfoByGuidResult;
        
        public GetcaseinfoByGuidResponseBody() {
        }
        
        public GetcaseinfoByGuidResponseBody(string GetcaseinfoByGuidResult) {
            this.GetcaseinfoByGuidResult = GetcaseinfoByGuidResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetServiceCompanyRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetServiceCompany", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequestBody Body;
        
        public GetServiceCompanyRequest() {
        }
        
        public GetServiceCompanyRequest(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class GetServiceCompanyRequestBody {
        
        public GetServiceCompanyRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetServiceCompanyResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetServiceCompanyResponse", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponseBody Body;
        
        public GetServiceCompanyResponse() {
        }
        
        public GetServiceCompanyResponse(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetServiceCompanyResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string GetServiceCompanyResult;
        
        public GetServiceCompanyResponseBody() {
        }
        
        public GetServiceCompanyResponseBody(string GetServiceCompanyResult) {
            this.GetServiceCompanyResult = GetServiceCompanyResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetServiceEquipmentRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetServiceEquipment", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequestBody Body;
        
        public GetServiceEquipmentRequest() {
        }
        
        public GetServiceEquipmentRequest(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class GetServiceEquipmentRequestBody {
        
        public GetServiceEquipmentRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetServiceEquipmentResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetServiceEquipmentResponse", Namespace="http://tempuri.org/", Order=0)]
        public global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponseBody Body;
        
        public GetServiceEquipmentResponse() {
        }
        
        public GetServiceEquipmentResponse(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetServiceEquipmentResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string GetServiceEquipmentResult;
        
        public GetServiceEquipmentResponseBody() {
        }
        
        public GetServiceEquipmentResponseBody(string GetServiceEquipmentResult) {
            this.GetServiceEquipmentResult = GetServiceEquipmentResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface WebService1SoapChannel : global::CityService.Service.KnowAllServiceReference.WebService1Soap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class WebService1SoapClient : System.ServiceModel.ClientBase<global::CityService.Service.KnowAllServiceReference.WebService1Soap>, global::CityService.Service.KnowAllServiceReference.WebService1Soap {
        
        public WebService1SoapClient() {
        }
        
        public WebService1SoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public WebService1SoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public WebService1SoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public WebService1SoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetInfoXml(global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest request) {
            return base.Channel.GetInfoXml(request);
        }
        
        public string GetInfoXml() {
            global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequestBody();
            global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse retVal = ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetInfoXml(inValue);
            return retVal.Body.GetInfoXmlResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse> global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetInfoXmlAsync(global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest request) {
            return base.Channel.GetInfoXmlAsync(request);
        }
        
        public System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetInfoXmlResponse> GetInfoXmlAsync() {
            global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetInfoXmlRequestBody();
            return ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetInfoXmlAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetcaseinfoByGuid(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest request) {
            return base.Channel.GetcaseinfoByGuid(request);
        }
        
        public string GetcaseinfoByGuid(string guid) {
            global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequestBody();
            inValue.Body.guid = guid;
            global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse retVal = ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetcaseinfoByGuid(inValue);
            return retVal.Body.GetcaseinfoByGuidResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse> global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetcaseinfoByGuidAsync(global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest request) {
            return base.Channel.GetcaseinfoByGuidAsync(request);
        }
        
        public System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidResponse> GetcaseinfoByGuidAsync(string guid) {
            global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetcaseinfoByGuidRequestBody();
            inValue.Body.guid = guid;
            return ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetcaseinfoByGuidAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetServiceCompany(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest request) {
            return base.Channel.GetServiceCompany(request);
        }
        
        public string GetServiceCompany() {
            global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequestBody();
            global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse retVal = ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetServiceCompany(inValue);
            return retVal.Body.GetServiceCompanyResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse> global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetServiceCompanyAsync(global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest request) {
            return base.Channel.GetServiceCompanyAsync(request);
        }
        
        public System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceCompanyResponse> GetServiceCompanyAsync() {
            global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetServiceCompanyRequestBody();
            return ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetServiceCompanyAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetServiceEquipment(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest request) {
            return base.Channel.GetServiceEquipment(request);
        }
        
        public string GetServiceEquipment() {
            global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequestBody();
            global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse retVal = ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetServiceEquipment(inValue);
            return retVal.Body.GetServiceEquipmentResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse> global::CityService.Service.KnowAllServiceReference.WebService1Soap.GetServiceEquipmentAsync(global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest request) {
            return base.Channel.GetServiceEquipmentAsync(request);
        }
        
        public System.Threading.Tasks.Task<global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentResponse> GetServiceEquipmentAsync() {
            global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest inValue = new global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequest();
            inValue.Body = new global::CityService.Service.KnowAllServiceReference.GetServiceEquipmentRequestBody();
            return ((global::CityService.Service.KnowAllServiceReference.WebService1Soap)(this)).GetServiceEquipmentAsync(inValue);
        }
    }
}
