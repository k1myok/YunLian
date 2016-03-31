namespace Apache.WorkFlow {
    
    #line 21 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System;
    
    #line default
    #line hidden
    
    #line 1 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Collections;
    
    #line default
    #line hidden
    
    #line 22 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Collections.Generic;
    
    #line default
    #line hidden
    
    #line 1 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Activities;
    
    #line default
    #line hidden
    
    #line 1 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Activities.Expressions;
    
    #line default
    #line hidden
    
    #line 1 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Activities.Statements;
    
    #line default
    #line hidden
    
    #line 23 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Data;
    
    #line default
    #line hidden
    
    #line 24 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Linq;
    
    #line default
    #line hidden
    
    #line 25 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Text;
    
    #line default
    #line hidden
    
    #line 26 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using Apache.Models;
    
    #line default
    #line hidden
    
    #line 1 "C:\Users\JSK\Desktop\Apache_It_v1.0.0_2015-7-29\Apache\WorkFlow\ItService.xaml"
    using System.Activities.XamlIntegration;
    
    #line default
    #line hidden
    
    
    public partial class ItService : System.Activities.XamlIntegration.ICompiledExpressionRoot {
        
        private System.Activities.Activity rootActivity;
        
        private object dataContextActivities;
        
        private bool forImplementation = true;
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public string GetLanguage() {
            return "C#";
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public object InvokeExpression(int expressionId, System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext) {
            if ((this.rootActivity == null)) {
                this.rootActivity = this;
            }
            if ((this.dataContextActivities == null)) {
                this.dataContextActivities = ItService_TypedDataContext3_ForReadOnly.GetDataContextActivitiesHelper(this.rootActivity, this.forImplementation);
            }
            if ((expressionId == 0)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[0] == null)) {
                    cachedCompiledDataContext[0] = new ItService_TypedDataContext3_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext3_ForReadOnly valDataContext0 = ((ItService_TypedDataContext3_ForReadOnly)(cachedCompiledDataContext[0]));
                return valDataContext0.ValueType___Expr0Get();
            }
            if ((expressionId == 1)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[1] == null)) {
                    cachedCompiledDataContext[1] = new ItService_TypedDataContext3(locations, activityContext, true);
                }
                ItService_TypedDataContext3 refDataContext1 = ((ItService_TypedDataContext3)(cachedCompiledDataContext[1]));
                return refDataContext1.GetLocation<string>(refDataContext1.ValueType___Expr1Get, refDataContext1.ValueType___Expr1Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 2)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[0] == null)) {
                    cachedCompiledDataContext[0] = new ItService_TypedDataContext3_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext3_ForReadOnly valDataContext2 = ((ItService_TypedDataContext3_ForReadOnly)(cachedCompiledDataContext[0]));
                return valDataContext2.ValueType___Expr2Get();
            }
            if ((expressionId == 3)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[1] == null)) {
                    cachedCompiledDataContext[1] = new ItService_TypedDataContext3(locations, activityContext, true);
                }
                ItService_TypedDataContext3 refDataContext3 = ((ItService_TypedDataContext3)(cachedCompiledDataContext[1]));
                return refDataContext3.GetLocation<string>(refDataContext3.ValueType___Expr3Get, refDataContext3.ValueType___Expr3Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 4)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[0] == null)) {
                    cachedCompiledDataContext[0] = new ItService_TypedDataContext3_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext3_ForReadOnly valDataContext4 = ((ItService_TypedDataContext3_ForReadOnly)(cachedCompiledDataContext[0]));
                return valDataContext4.ValueType___Expr4Get();
            }
            if ((expressionId == 5)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext3_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[0] == null)) {
                    cachedCompiledDataContext[0] = new ItService_TypedDataContext3_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext3_ForReadOnly valDataContext5 = ((ItService_TypedDataContext3_ForReadOnly)(cachedCompiledDataContext[0]));
                return valDataContext5.ValueType___Expr5Get();
            }
            if ((expressionId == 6)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[2] == null)) {
                    cachedCompiledDataContext[2] = new ItService_TypedDataContext5(locations, activityContext, true);
                }
                ItService_TypedDataContext5 refDataContext6 = ((ItService_TypedDataContext5)(cachedCompiledDataContext[2]));
                return refDataContext6.GetLocation<string>(refDataContext6.ValueType___Expr6Get, refDataContext6.ValueType___Expr6Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 7)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[2] == null)) {
                    cachedCompiledDataContext[2] = new ItService_TypedDataContext5(locations, activityContext, true);
                }
                ItService_TypedDataContext5 refDataContext7 = ((ItService_TypedDataContext5)(cachedCompiledDataContext[2]));
                return refDataContext7.GetLocation<string>(refDataContext7.ValueType___Expr7Get, refDataContext7.ValueType___Expr7Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 8)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext8 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext8.ValueType___Expr8Get();
            }
            if ((expressionId == 9)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext9 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext9.ValueType___Expr9Get();
            }
            if ((expressionId == 10)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[2] == null)) {
                    cachedCompiledDataContext[2] = new ItService_TypedDataContext5(locations, activityContext, true);
                }
                ItService_TypedDataContext5 refDataContext10 = ((ItService_TypedDataContext5)(cachedCompiledDataContext[2]));
                return refDataContext10.GetLocation<string>(refDataContext10.ValueType___Expr10Get, refDataContext10.ValueType___Expr10Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 11)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext11 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext11.ValueType___Expr11Get();
            }
            if ((expressionId == 12)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[2] == null)) {
                    cachedCompiledDataContext[2] = new ItService_TypedDataContext5(locations, activityContext, true);
                }
                ItService_TypedDataContext5 refDataContext12 = ((ItService_TypedDataContext5)(cachedCompiledDataContext[2]));
                return refDataContext12.GetLocation<string>(refDataContext12.ValueType___Expr12Get, refDataContext12.ValueType___Expr12Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 13)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext13 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext13.ValueType___Expr13Get();
            }
            if ((expressionId == 14)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext14 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext14.ValueType___Expr14Get();
            }
            if ((expressionId == 15)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext15 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext15.ValueType___Expr15Get();
            }
            if ((expressionId == 16)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext16 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext16.ValueType___Expr16Get();
            }
            if ((expressionId == 17)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext17 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext17.ValueType___Expr17Get();
            }
            if ((expressionId == 18)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext18 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext18.ValueType___Expr18Get();
            }
            if ((expressionId == 19)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext19 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext19.ValueType___Expr19Get();
            }
            if ((expressionId == 20)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext20 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext20.ValueType___Expr20Get();
            }
            if ((expressionId == 21)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext21 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext21.ValueType___Expr21Get();
            }
            if ((expressionId == 22)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext22 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext22.ValueType___Expr22Get();
            }
            if ((expressionId == 23)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext23 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext23.ValueType___Expr23Get();
            }
            if ((expressionId == 24)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext24 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext24.ValueType___Expr24Get();
            }
            if ((expressionId == 25)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext25 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext25.ValueType___Expr25Get();
            }
            if ((expressionId == 26)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext5_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[3] == null)) {
                    cachedCompiledDataContext[3] = new ItService_TypedDataContext5_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext5_ForReadOnly valDataContext26 = ((ItService_TypedDataContext5_ForReadOnly)(cachedCompiledDataContext[3]));
                return valDataContext26.ValueType___Expr26Get();
            }
            if ((expressionId == 27)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[4] == null)) {
                    cachedCompiledDataContext[4] = new ItService_TypedDataContext6(locations, activityContext, true);
                }
                ItService_TypedDataContext6 refDataContext27 = ((ItService_TypedDataContext6)(cachedCompiledDataContext[4]));
                return refDataContext27.GetLocation<string>(refDataContext27.ValueType___Expr27Get, refDataContext27.ValueType___Expr27Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 28)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[4] == null)) {
                    cachedCompiledDataContext[4] = new ItService_TypedDataContext6(locations, activityContext, true);
                }
                ItService_TypedDataContext6 refDataContext28 = ((ItService_TypedDataContext6)(cachedCompiledDataContext[4]));
                return refDataContext28.GetLocation<string>(refDataContext28.ValueType___Expr28Get, refDataContext28.ValueType___Expr28Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 29)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext29 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext29.ValueType___Expr29Get();
            }
            if ((expressionId == 30)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext30 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext30.ValueType___Expr30Get();
            }
            if ((expressionId == 31)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[4] == null)) {
                    cachedCompiledDataContext[4] = new ItService_TypedDataContext6(locations, activityContext, true);
                }
                ItService_TypedDataContext6 refDataContext31 = ((ItService_TypedDataContext6)(cachedCompiledDataContext[4]));
                return refDataContext31.GetLocation<string>(refDataContext31.ValueType___Expr31Get, refDataContext31.ValueType___Expr31Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 32)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext32 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext32.ValueType___Expr32Get();
            }
            if ((expressionId == 33)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[4] == null)) {
                    cachedCompiledDataContext[4] = new ItService_TypedDataContext6(locations, activityContext, true);
                }
                ItService_TypedDataContext6 refDataContext33 = ((ItService_TypedDataContext6)(cachedCompiledDataContext[4]));
                return refDataContext33.GetLocation<string>(refDataContext33.ValueType___Expr33Get, refDataContext33.ValueType___Expr33Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 34)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext34 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext34.ValueType___Expr34Get();
            }
            if ((expressionId == 35)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext35 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext35.ValueType___Expr35Get();
            }
            if ((expressionId == 36)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext36 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext36.ValueType___Expr36Get();
            }
            if ((expressionId == 37)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext37 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext37.ValueType___Expr37Get();
            }
            if ((expressionId == 38)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext38 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext38.ValueType___Expr38Get();
            }
            if ((expressionId == 39)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext39 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext39.ValueType___Expr39Get();
            }
            if ((expressionId == 40)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext40 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext40.ValueType___Expr40Get();
            }
            if ((expressionId == 41)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext6_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[5] == null)) {
                    cachedCompiledDataContext[5] = new ItService_TypedDataContext6_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext6_ForReadOnly valDataContext41 = ((ItService_TypedDataContext6_ForReadOnly)(cachedCompiledDataContext[5]));
                return valDataContext41.ValueType___Expr41Get();
            }
            if ((expressionId == 42)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext7.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[6] == null)) {
                    cachedCompiledDataContext[6] = new ItService_TypedDataContext7(locations, activityContext, true);
                }
                ItService_TypedDataContext7 refDataContext42 = ((ItService_TypedDataContext7)(cachedCompiledDataContext[6]));
                return refDataContext42.GetLocation<string>(refDataContext42.ValueType___Expr42Get, refDataContext42.ValueType___Expr42Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 43)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext7_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[7] == null)) {
                    cachedCompiledDataContext[7] = new ItService_TypedDataContext7_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext7_ForReadOnly valDataContext43 = ((ItService_TypedDataContext7_ForReadOnly)(cachedCompiledDataContext[7]));
                return valDataContext43.ValueType___Expr43Get();
            }
            if ((expressionId == 44)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext7.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[6] == null)) {
                    cachedCompiledDataContext[6] = new ItService_TypedDataContext7(locations, activityContext, true);
                }
                ItService_TypedDataContext7 refDataContext44 = ((ItService_TypedDataContext7)(cachedCompiledDataContext[6]));
                return refDataContext44.GetLocation<string>(refDataContext44.ValueType___Expr44Get, refDataContext44.ValueType___Expr44Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 45)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext7_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[7] == null)) {
                    cachedCompiledDataContext[7] = new ItService_TypedDataContext7_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext7_ForReadOnly valDataContext45 = ((ItService_TypedDataContext7_ForReadOnly)(cachedCompiledDataContext[7]));
                return valDataContext45.ValueType___Expr45Get();
            }
            if ((expressionId == 46)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[8] == null)) {
                    cachedCompiledDataContext[8] = new ItService_TypedDataContext8(locations, activityContext, true);
                }
                ItService_TypedDataContext8 refDataContext46 = ((ItService_TypedDataContext8)(cachedCompiledDataContext[8]));
                return refDataContext46.GetLocation<string>(refDataContext46.ValueType___Expr46Get, refDataContext46.ValueType___Expr46Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 47)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[8] == null)) {
                    cachedCompiledDataContext[8] = new ItService_TypedDataContext8(locations, activityContext, true);
                }
                ItService_TypedDataContext8 refDataContext47 = ((ItService_TypedDataContext8)(cachedCompiledDataContext[8]));
                return refDataContext47.GetLocation<string>(refDataContext47.ValueType___Expr47Get, refDataContext47.ValueType___Expr47Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 48)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext48 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext48.ValueType___Expr48Get();
            }
            if ((expressionId == 49)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext49 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext49.ValueType___Expr49Get();
            }
            if ((expressionId == 50)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[8] == null)) {
                    cachedCompiledDataContext[8] = new ItService_TypedDataContext8(locations, activityContext, true);
                }
                ItService_TypedDataContext8 refDataContext50 = ((ItService_TypedDataContext8)(cachedCompiledDataContext[8]));
                return refDataContext50.GetLocation<string>(refDataContext50.ValueType___Expr50Get, refDataContext50.ValueType___Expr50Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 51)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext51 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext51.ValueType___Expr51Get();
            }
            if ((expressionId == 52)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[8] == null)) {
                    cachedCompiledDataContext[8] = new ItService_TypedDataContext8(locations, activityContext, true);
                }
                ItService_TypedDataContext8 refDataContext52 = ((ItService_TypedDataContext8)(cachedCompiledDataContext[8]));
                return refDataContext52.GetLocation<string>(refDataContext52.ValueType___Expr52Get, refDataContext52.ValueType___Expr52Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 53)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext53 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext53.ValueType___Expr53Get();
            }
            if ((expressionId == 54)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext54 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext54.ValueType___Expr54Get();
            }
            if ((expressionId == 55)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext55 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext55.ValueType___Expr55Get();
            }
            if ((expressionId == 56)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext56 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext56.ValueType___Expr56Get();
            }
            if ((expressionId == 57)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext8_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[9] == null)) {
                    cachedCompiledDataContext[9] = new ItService_TypedDataContext8_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext8_ForReadOnly valDataContext57 = ((ItService_TypedDataContext8_ForReadOnly)(cachedCompiledDataContext[9]));
                return valDataContext57.ValueType___Expr57Get();
            }
            if ((expressionId == 58)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext9.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[10] == null)) {
                    cachedCompiledDataContext[10] = new ItService_TypedDataContext9(locations, activityContext, true);
                }
                ItService_TypedDataContext9 refDataContext58 = ((ItService_TypedDataContext9)(cachedCompiledDataContext[10]));
                return refDataContext58.GetLocation<string>(refDataContext58.ValueType___Expr58Get, refDataContext58.ValueType___Expr58Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 59)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext9_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[11] == null)) {
                    cachedCompiledDataContext[11] = new ItService_TypedDataContext9_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext9_ForReadOnly valDataContext59 = ((ItService_TypedDataContext9_ForReadOnly)(cachedCompiledDataContext[11]));
                return valDataContext59.ValueType___Expr59Get();
            }
            if ((expressionId == 60)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext9.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[10] == null)) {
                    cachedCompiledDataContext[10] = new ItService_TypedDataContext9(locations, activityContext, true);
                }
                ItService_TypedDataContext9 refDataContext60 = ((ItService_TypedDataContext9)(cachedCompiledDataContext[10]));
                return refDataContext60.GetLocation<string>(refDataContext60.ValueType___Expr60Get, refDataContext60.ValueType___Expr60Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 61)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext9_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[11] == null)) {
                    cachedCompiledDataContext[11] = new ItService_TypedDataContext9_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext9_ForReadOnly valDataContext61 = ((ItService_TypedDataContext9_ForReadOnly)(cachedCompiledDataContext[11]));
                return valDataContext61.ValueType___Expr61Get();
            }
            if ((expressionId == 62)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext10.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[12] == null)) {
                    cachedCompiledDataContext[12] = new ItService_TypedDataContext10(locations, activityContext, true);
                }
                ItService_TypedDataContext10 refDataContext62 = ((ItService_TypedDataContext10)(cachedCompiledDataContext[12]));
                return refDataContext62.GetLocation<string>(refDataContext62.ValueType___Expr62Get, refDataContext62.ValueType___Expr62Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 63)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext10_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[13] == null)) {
                    cachedCompiledDataContext[13] = new ItService_TypedDataContext10_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext10_ForReadOnly valDataContext63 = ((ItService_TypedDataContext10_ForReadOnly)(cachedCompiledDataContext[13]));
                return valDataContext63.ValueType___Expr63Get();
            }
            if ((expressionId == 64)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext10.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[12] == null)) {
                    cachedCompiledDataContext[12] = new ItService_TypedDataContext10(locations, activityContext, true);
                }
                ItService_TypedDataContext10 refDataContext64 = ((ItService_TypedDataContext10)(cachedCompiledDataContext[12]));
                return refDataContext64.GetLocation<string>(refDataContext64.ValueType___Expr64Get, refDataContext64.ValueType___Expr64Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 65)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext10_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[13] == null)) {
                    cachedCompiledDataContext[13] = new ItService_TypedDataContext10_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext10_ForReadOnly valDataContext65 = ((ItService_TypedDataContext10_ForReadOnly)(cachedCompiledDataContext[13]));
                return valDataContext65.ValueType___Expr65Get();
            }
            if ((expressionId == 66)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[14] == null)) {
                    cachedCompiledDataContext[14] = new ItService_TypedDataContext11(locations, activityContext, true);
                }
                ItService_TypedDataContext11 refDataContext66 = ((ItService_TypedDataContext11)(cachedCompiledDataContext[14]));
                return refDataContext66.GetLocation<string>(refDataContext66.ValueType___Expr66Get, refDataContext66.ValueType___Expr66Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 67)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[15] == null)) {
                    cachedCompiledDataContext[15] = new ItService_TypedDataContext11_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext11_ForReadOnly valDataContext67 = ((ItService_TypedDataContext11_ForReadOnly)(cachedCompiledDataContext[15]));
                return valDataContext67.ValueType___Expr67Get();
            }
            if ((expressionId == 68)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[14] == null)) {
                    cachedCompiledDataContext[14] = new ItService_TypedDataContext11(locations, activityContext, true);
                }
                ItService_TypedDataContext11 refDataContext68 = ((ItService_TypedDataContext11)(cachedCompiledDataContext[14]));
                return refDataContext68.GetLocation<string>(refDataContext68.ValueType___Expr68Get, refDataContext68.ValueType___Expr68Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 69)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[15] == null)) {
                    cachedCompiledDataContext[15] = new ItService_TypedDataContext11_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext11_ForReadOnly valDataContext69 = ((ItService_TypedDataContext11_ForReadOnly)(cachedCompiledDataContext[15]));
                return valDataContext69.ValueType___Expr69Get();
            }
            if ((expressionId == 70)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[15] == null)) {
                    cachedCompiledDataContext[15] = new ItService_TypedDataContext11_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext11_ForReadOnly valDataContext70 = ((ItService_TypedDataContext11_ForReadOnly)(cachedCompiledDataContext[15]));
                return valDataContext70.ValueType___Expr70Get();
            }
            if ((expressionId == 71)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[15] == null)) {
                    cachedCompiledDataContext[15] = new ItService_TypedDataContext11_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext11_ForReadOnly valDataContext71 = ((ItService_TypedDataContext11_ForReadOnly)(cachedCompiledDataContext[15]));
                return valDataContext71.ValueType___Expr71Get();
            }
            if ((expressionId == 72)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext11_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[15] == null)) {
                    cachedCompiledDataContext[15] = new ItService_TypedDataContext11_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext11_ForReadOnly valDataContext72 = ((ItService_TypedDataContext11_ForReadOnly)(cachedCompiledDataContext[15]));
                return valDataContext72.ValueType___Expr72Get();
            }
            if ((expressionId == 73)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext12.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[16] == null)) {
                    cachedCompiledDataContext[16] = new ItService_TypedDataContext12(locations, activityContext, true);
                }
                ItService_TypedDataContext12 refDataContext73 = ((ItService_TypedDataContext12)(cachedCompiledDataContext[16]));
                return refDataContext73.GetLocation<string>(refDataContext73.ValueType___Expr73Get, refDataContext73.ValueType___Expr73Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 74)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext12_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[17] == null)) {
                    cachedCompiledDataContext[17] = new ItService_TypedDataContext12_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext12_ForReadOnly valDataContext74 = ((ItService_TypedDataContext12_ForReadOnly)(cachedCompiledDataContext[17]));
                return valDataContext74.ValueType___Expr74Get();
            }
            if ((expressionId == 75)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext12.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[16] == null)) {
                    cachedCompiledDataContext[16] = new ItService_TypedDataContext12(locations, activityContext, true);
                }
                ItService_TypedDataContext12 refDataContext75 = ((ItService_TypedDataContext12)(cachedCompiledDataContext[16]));
                return refDataContext75.GetLocation<string>(refDataContext75.ValueType___Expr75Get, refDataContext75.ValueType___Expr75Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 76)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext12_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[17] == null)) {
                    cachedCompiledDataContext[17] = new ItService_TypedDataContext12_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext12_ForReadOnly valDataContext76 = ((ItService_TypedDataContext12_ForReadOnly)(cachedCompiledDataContext[17]));
                return valDataContext76.ValueType___Expr76Get();
            }
            if ((expressionId == 77)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext13.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[18] == null)) {
                    cachedCompiledDataContext[18] = new ItService_TypedDataContext13(locations, activityContext, true);
                }
                ItService_TypedDataContext13 refDataContext77 = ((ItService_TypedDataContext13)(cachedCompiledDataContext[18]));
                return refDataContext77.GetLocation<string>(refDataContext77.ValueType___Expr77Get, refDataContext77.ValueType___Expr77Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 78)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext13_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[19] == null)) {
                    cachedCompiledDataContext[19] = new ItService_TypedDataContext13_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext13_ForReadOnly valDataContext78 = ((ItService_TypedDataContext13_ForReadOnly)(cachedCompiledDataContext[19]));
                return valDataContext78.ValueType___Expr78Get();
            }
            if ((expressionId == 79)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext13.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[18] == null)) {
                    cachedCompiledDataContext[18] = new ItService_TypedDataContext13(locations, activityContext, true);
                }
                ItService_TypedDataContext13 refDataContext79 = ((ItService_TypedDataContext13)(cachedCompiledDataContext[18]));
                return refDataContext79.GetLocation<string>(refDataContext79.ValueType___Expr79Get, refDataContext79.ValueType___Expr79Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 80)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext13_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[19] == null)) {
                    cachedCompiledDataContext[19] = new ItService_TypedDataContext13_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext13_ForReadOnly valDataContext80 = ((ItService_TypedDataContext13_ForReadOnly)(cachedCompiledDataContext[19]));
                return valDataContext80.ValueType___Expr80Get();
            }
            if ((expressionId == 81)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext14.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[20] == null)) {
                    cachedCompiledDataContext[20] = new ItService_TypedDataContext14(locations, activityContext, true);
                }
                ItService_TypedDataContext14 refDataContext81 = ((ItService_TypedDataContext14)(cachedCompiledDataContext[20]));
                return refDataContext81.GetLocation<string>(refDataContext81.ValueType___Expr81Get, refDataContext81.ValueType___Expr81Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 82)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext14_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[21] == null)) {
                    cachedCompiledDataContext[21] = new ItService_TypedDataContext14_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext14_ForReadOnly valDataContext82 = ((ItService_TypedDataContext14_ForReadOnly)(cachedCompiledDataContext[21]));
                return valDataContext82.ValueType___Expr82Get();
            }
            if ((expressionId == 83)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext14.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[20] == null)) {
                    cachedCompiledDataContext[20] = new ItService_TypedDataContext14(locations, activityContext, true);
                }
                ItService_TypedDataContext14 refDataContext83 = ((ItService_TypedDataContext14)(cachedCompiledDataContext[20]));
                return refDataContext83.GetLocation<string>(refDataContext83.ValueType___Expr83Get, refDataContext83.ValueType___Expr83Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 84)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext14_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[21] == null)) {
                    cachedCompiledDataContext[21] = new ItService_TypedDataContext14_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext14_ForReadOnly valDataContext84 = ((ItService_TypedDataContext14_ForReadOnly)(cachedCompiledDataContext[21]));
                return valDataContext84.ValueType___Expr84Get();
            }
            if ((expressionId == 85)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext15.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[22] == null)) {
                    cachedCompiledDataContext[22] = new ItService_TypedDataContext15(locations, activityContext, true);
                }
                ItService_TypedDataContext15 refDataContext85 = ((ItService_TypedDataContext15)(cachedCompiledDataContext[22]));
                return refDataContext85.GetLocation<string>(refDataContext85.ValueType___Expr85Get, refDataContext85.ValueType___Expr85Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 86)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext15_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[23] == null)) {
                    cachedCompiledDataContext[23] = new ItService_TypedDataContext15_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext15_ForReadOnly valDataContext86 = ((ItService_TypedDataContext15_ForReadOnly)(cachedCompiledDataContext[23]));
                return valDataContext86.ValueType___Expr86Get();
            }
            if ((expressionId == 87)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext15.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[22] == null)) {
                    cachedCompiledDataContext[22] = new ItService_TypedDataContext15(locations, activityContext, true);
                }
                ItService_TypedDataContext15 refDataContext87 = ((ItService_TypedDataContext15)(cachedCompiledDataContext[22]));
                return refDataContext87.GetLocation<string>(refDataContext87.ValueType___Expr87Get, refDataContext87.ValueType___Expr87Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 88)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext15_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[23] == null)) {
                    cachedCompiledDataContext[23] = new ItService_TypedDataContext15_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext15_ForReadOnly valDataContext88 = ((ItService_TypedDataContext15_ForReadOnly)(cachedCompiledDataContext[23]));
                return valDataContext88.ValueType___Expr88Get();
            }
            if ((expressionId == 89)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext16.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[24] == null)) {
                    cachedCompiledDataContext[24] = new ItService_TypedDataContext16(locations, activityContext, true);
                }
                ItService_TypedDataContext16 refDataContext89 = ((ItService_TypedDataContext16)(cachedCompiledDataContext[24]));
                return refDataContext89.GetLocation<string>(refDataContext89.ValueType___Expr89Get, refDataContext89.ValueType___Expr89Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 90)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext16_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[25] == null)) {
                    cachedCompiledDataContext[25] = new ItService_TypedDataContext16_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext16_ForReadOnly valDataContext90 = ((ItService_TypedDataContext16_ForReadOnly)(cachedCompiledDataContext[25]));
                return valDataContext90.ValueType___Expr90Get();
            }
            if ((expressionId == 91)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext16.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[24] == null)) {
                    cachedCompiledDataContext[24] = new ItService_TypedDataContext16(locations, activityContext, true);
                }
                ItService_TypedDataContext16 refDataContext91 = ((ItService_TypedDataContext16)(cachedCompiledDataContext[24]));
                return refDataContext91.GetLocation<string>(refDataContext91.ValueType___Expr91Get, refDataContext91.ValueType___Expr91Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 92)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext16_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[25] == null)) {
                    cachedCompiledDataContext[25] = new ItService_TypedDataContext16_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext16_ForReadOnly valDataContext92 = ((ItService_TypedDataContext16_ForReadOnly)(cachedCompiledDataContext[25]));
                return valDataContext92.ValueType___Expr92Get();
            }
            if ((expressionId == 93)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext17.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[26] == null)) {
                    cachedCompiledDataContext[26] = new ItService_TypedDataContext17(locations, activityContext, true);
                }
                ItService_TypedDataContext17 refDataContext93 = ((ItService_TypedDataContext17)(cachedCompiledDataContext[26]));
                return refDataContext93.GetLocation<string>(refDataContext93.ValueType___Expr93Get, refDataContext93.ValueType___Expr93Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 94)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext17_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[27] == null)) {
                    cachedCompiledDataContext[27] = new ItService_TypedDataContext17_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext17_ForReadOnly valDataContext94 = ((ItService_TypedDataContext17_ForReadOnly)(cachedCompiledDataContext[27]));
                return valDataContext94.ValueType___Expr94Get();
            }
            if ((expressionId == 95)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext17.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[26] == null)) {
                    cachedCompiledDataContext[26] = new ItService_TypedDataContext17(locations, activityContext, true);
                }
                ItService_TypedDataContext17 refDataContext95 = ((ItService_TypedDataContext17)(cachedCompiledDataContext[26]));
                return refDataContext95.GetLocation<string>(refDataContext95.ValueType___Expr95Get, refDataContext95.ValueType___Expr95Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 96)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext17_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[27] == null)) {
                    cachedCompiledDataContext[27] = new ItService_TypedDataContext17_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext17_ForReadOnly valDataContext96 = ((ItService_TypedDataContext17_ForReadOnly)(cachedCompiledDataContext[27]));
                return valDataContext96.ValueType___Expr96Get();
            }
            if ((expressionId == 97)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext18.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[28] == null)) {
                    cachedCompiledDataContext[28] = new ItService_TypedDataContext18(locations, activityContext, true);
                }
                ItService_TypedDataContext18 refDataContext97 = ((ItService_TypedDataContext18)(cachedCompiledDataContext[28]));
                return refDataContext97.GetLocation<string>(refDataContext97.ValueType___Expr97Get, refDataContext97.ValueType___Expr97Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 98)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext18_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[29] == null)) {
                    cachedCompiledDataContext[29] = new ItService_TypedDataContext18_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext18_ForReadOnly valDataContext98 = ((ItService_TypedDataContext18_ForReadOnly)(cachedCompiledDataContext[29]));
                return valDataContext98.ValueType___Expr98Get();
            }
            if ((expressionId == 99)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext18.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[28] == null)) {
                    cachedCompiledDataContext[28] = new ItService_TypedDataContext18(locations, activityContext, true);
                }
                ItService_TypedDataContext18 refDataContext99 = ((ItService_TypedDataContext18)(cachedCompiledDataContext[28]));
                return refDataContext99.GetLocation<string>(refDataContext99.ValueType___Expr99Get, refDataContext99.ValueType___Expr99Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 100)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext18_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[29] == null)) {
                    cachedCompiledDataContext[29] = new ItService_TypedDataContext18_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext18_ForReadOnly valDataContext100 = ((ItService_TypedDataContext18_ForReadOnly)(cachedCompiledDataContext[29]));
                return valDataContext100.ValueType___Expr100Get();
            }
            if ((expressionId == 101)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext19.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[30] == null)) {
                    cachedCompiledDataContext[30] = new ItService_TypedDataContext19(locations, activityContext, true);
                }
                ItService_TypedDataContext19 refDataContext101 = ((ItService_TypedDataContext19)(cachedCompiledDataContext[30]));
                return refDataContext101.GetLocation<string>(refDataContext101.ValueType___Expr101Get, refDataContext101.ValueType___Expr101Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 102)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext19_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[31] == null)) {
                    cachedCompiledDataContext[31] = new ItService_TypedDataContext19_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext19_ForReadOnly valDataContext102 = ((ItService_TypedDataContext19_ForReadOnly)(cachedCompiledDataContext[31]));
                return valDataContext102.ValueType___Expr102Get();
            }
            if ((expressionId == 103)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext19.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[30] == null)) {
                    cachedCompiledDataContext[30] = new ItService_TypedDataContext19(locations, activityContext, true);
                }
                ItService_TypedDataContext19 refDataContext103 = ((ItService_TypedDataContext19)(cachedCompiledDataContext[30]));
                return refDataContext103.GetLocation<string>(refDataContext103.ValueType___Expr103Get, refDataContext103.ValueType___Expr103Set, expressionId, this.rootActivity, activityContext);
            }
            if ((expressionId == 104)) {
                System.Activities.XamlIntegration.CompiledDataContext[] cachedCompiledDataContext = ItService_TypedDataContext19_ForReadOnly.GetCompiledDataContextCacheHelper(this.dataContextActivities, activityContext, this.rootActivity, this.forImplementation, 32);
                if ((cachedCompiledDataContext[31] == null)) {
                    cachedCompiledDataContext[31] = new ItService_TypedDataContext19_ForReadOnly(locations, activityContext, true);
                }
                ItService_TypedDataContext19_ForReadOnly valDataContext104 = ((ItService_TypedDataContext19_ForReadOnly)(cachedCompiledDataContext[31]));
                return valDataContext104.ValueType___Expr104Get();
            }
            return null;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public object InvokeExpression(int expressionId, System.Collections.Generic.IList<System.Activities.Location> locations) {
            if ((this.rootActivity == null)) {
                this.rootActivity = this;
            }
            if ((expressionId == 0)) {
                ItService_TypedDataContext3_ForReadOnly valDataContext0 = new ItService_TypedDataContext3_ForReadOnly(locations, true);
                return valDataContext0.ValueType___Expr0Get();
            }
            if ((expressionId == 1)) {
                ItService_TypedDataContext3 refDataContext1 = new ItService_TypedDataContext3(locations, true);
                return refDataContext1.GetLocation<string>(refDataContext1.ValueType___Expr1Get, refDataContext1.ValueType___Expr1Set);
            }
            if ((expressionId == 2)) {
                ItService_TypedDataContext3_ForReadOnly valDataContext2 = new ItService_TypedDataContext3_ForReadOnly(locations, true);
                return valDataContext2.ValueType___Expr2Get();
            }
            if ((expressionId == 3)) {
                ItService_TypedDataContext3 refDataContext3 = new ItService_TypedDataContext3(locations, true);
                return refDataContext3.GetLocation<string>(refDataContext3.ValueType___Expr3Get, refDataContext3.ValueType___Expr3Set);
            }
            if ((expressionId == 4)) {
                ItService_TypedDataContext3_ForReadOnly valDataContext4 = new ItService_TypedDataContext3_ForReadOnly(locations, true);
                return valDataContext4.ValueType___Expr4Get();
            }
            if ((expressionId == 5)) {
                ItService_TypedDataContext3_ForReadOnly valDataContext5 = new ItService_TypedDataContext3_ForReadOnly(locations, true);
                return valDataContext5.ValueType___Expr5Get();
            }
            if ((expressionId == 6)) {
                ItService_TypedDataContext5 refDataContext6 = new ItService_TypedDataContext5(locations, true);
                return refDataContext6.GetLocation<string>(refDataContext6.ValueType___Expr6Get, refDataContext6.ValueType___Expr6Set);
            }
            if ((expressionId == 7)) {
                ItService_TypedDataContext5 refDataContext7 = new ItService_TypedDataContext5(locations, true);
                return refDataContext7.GetLocation<string>(refDataContext7.ValueType___Expr7Get, refDataContext7.ValueType___Expr7Set);
            }
            if ((expressionId == 8)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext8 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext8.ValueType___Expr8Get();
            }
            if ((expressionId == 9)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext9 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext9.ValueType___Expr9Get();
            }
            if ((expressionId == 10)) {
                ItService_TypedDataContext5 refDataContext10 = new ItService_TypedDataContext5(locations, true);
                return refDataContext10.GetLocation<string>(refDataContext10.ValueType___Expr10Get, refDataContext10.ValueType___Expr10Set);
            }
            if ((expressionId == 11)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext11 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext11.ValueType___Expr11Get();
            }
            if ((expressionId == 12)) {
                ItService_TypedDataContext5 refDataContext12 = new ItService_TypedDataContext5(locations, true);
                return refDataContext12.GetLocation<string>(refDataContext12.ValueType___Expr12Get, refDataContext12.ValueType___Expr12Set);
            }
            if ((expressionId == 13)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext13 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext13.ValueType___Expr13Get();
            }
            if ((expressionId == 14)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext14 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext14.ValueType___Expr14Get();
            }
            if ((expressionId == 15)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext15 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext15.ValueType___Expr15Get();
            }
            if ((expressionId == 16)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext16 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext16.ValueType___Expr16Get();
            }
            if ((expressionId == 17)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext17 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext17.ValueType___Expr17Get();
            }
            if ((expressionId == 18)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext18 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext18.ValueType___Expr18Get();
            }
            if ((expressionId == 19)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext19 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext19.ValueType___Expr19Get();
            }
            if ((expressionId == 20)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext20 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext20.ValueType___Expr20Get();
            }
            if ((expressionId == 21)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext21 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext21.ValueType___Expr21Get();
            }
            if ((expressionId == 22)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext22 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext22.ValueType___Expr22Get();
            }
            if ((expressionId == 23)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext23 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext23.ValueType___Expr23Get();
            }
            if ((expressionId == 24)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext24 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext24.ValueType___Expr24Get();
            }
            if ((expressionId == 25)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext25 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext25.ValueType___Expr25Get();
            }
            if ((expressionId == 26)) {
                ItService_TypedDataContext5_ForReadOnly valDataContext26 = new ItService_TypedDataContext5_ForReadOnly(locations, true);
                return valDataContext26.ValueType___Expr26Get();
            }
            if ((expressionId == 27)) {
                ItService_TypedDataContext6 refDataContext27 = new ItService_TypedDataContext6(locations, true);
                return refDataContext27.GetLocation<string>(refDataContext27.ValueType___Expr27Get, refDataContext27.ValueType___Expr27Set);
            }
            if ((expressionId == 28)) {
                ItService_TypedDataContext6 refDataContext28 = new ItService_TypedDataContext6(locations, true);
                return refDataContext28.GetLocation<string>(refDataContext28.ValueType___Expr28Get, refDataContext28.ValueType___Expr28Set);
            }
            if ((expressionId == 29)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext29 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext29.ValueType___Expr29Get();
            }
            if ((expressionId == 30)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext30 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext30.ValueType___Expr30Get();
            }
            if ((expressionId == 31)) {
                ItService_TypedDataContext6 refDataContext31 = new ItService_TypedDataContext6(locations, true);
                return refDataContext31.GetLocation<string>(refDataContext31.ValueType___Expr31Get, refDataContext31.ValueType___Expr31Set);
            }
            if ((expressionId == 32)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext32 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext32.ValueType___Expr32Get();
            }
            if ((expressionId == 33)) {
                ItService_TypedDataContext6 refDataContext33 = new ItService_TypedDataContext6(locations, true);
                return refDataContext33.GetLocation<string>(refDataContext33.ValueType___Expr33Get, refDataContext33.ValueType___Expr33Set);
            }
            if ((expressionId == 34)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext34 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext34.ValueType___Expr34Get();
            }
            if ((expressionId == 35)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext35 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext35.ValueType___Expr35Get();
            }
            if ((expressionId == 36)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext36 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext36.ValueType___Expr36Get();
            }
            if ((expressionId == 37)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext37 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext37.ValueType___Expr37Get();
            }
            if ((expressionId == 38)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext38 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext38.ValueType___Expr38Get();
            }
            if ((expressionId == 39)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext39 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext39.ValueType___Expr39Get();
            }
            if ((expressionId == 40)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext40 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext40.ValueType___Expr40Get();
            }
            if ((expressionId == 41)) {
                ItService_TypedDataContext6_ForReadOnly valDataContext41 = new ItService_TypedDataContext6_ForReadOnly(locations, true);
                return valDataContext41.ValueType___Expr41Get();
            }
            if ((expressionId == 42)) {
                ItService_TypedDataContext7 refDataContext42 = new ItService_TypedDataContext7(locations, true);
                return refDataContext42.GetLocation<string>(refDataContext42.ValueType___Expr42Get, refDataContext42.ValueType___Expr42Set);
            }
            if ((expressionId == 43)) {
                ItService_TypedDataContext7_ForReadOnly valDataContext43 = new ItService_TypedDataContext7_ForReadOnly(locations, true);
                return valDataContext43.ValueType___Expr43Get();
            }
            if ((expressionId == 44)) {
                ItService_TypedDataContext7 refDataContext44 = new ItService_TypedDataContext7(locations, true);
                return refDataContext44.GetLocation<string>(refDataContext44.ValueType___Expr44Get, refDataContext44.ValueType___Expr44Set);
            }
            if ((expressionId == 45)) {
                ItService_TypedDataContext7_ForReadOnly valDataContext45 = new ItService_TypedDataContext7_ForReadOnly(locations, true);
                return valDataContext45.ValueType___Expr45Get();
            }
            if ((expressionId == 46)) {
                ItService_TypedDataContext8 refDataContext46 = new ItService_TypedDataContext8(locations, true);
                return refDataContext46.GetLocation<string>(refDataContext46.ValueType___Expr46Get, refDataContext46.ValueType___Expr46Set);
            }
            if ((expressionId == 47)) {
                ItService_TypedDataContext8 refDataContext47 = new ItService_TypedDataContext8(locations, true);
                return refDataContext47.GetLocation<string>(refDataContext47.ValueType___Expr47Get, refDataContext47.ValueType___Expr47Set);
            }
            if ((expressionId == 48)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext48 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext48.ValueType___Expr48Get();
            }
            if ((expressionId == 49)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext49 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext49.ValueType___Expr49Get();
            }
            if ((expressionId == 50)) {
                ItService_TypedDataContext8 refDataContext50 = new ItService_TypedDataContext8(locations, true);
                return refDataContext50.GetLocation<string>(refDataContext50.ValueType___Expr50Get, refDataContext50.ValueType___Expr50Set);
            }
            if ((expressionId == 51)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext51 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext51.ValueType___Expr51Get();
            }
            if ((expressionId == 52)) {
                ItService_TypedDataContext8 refDataContext52 = new ItService_TypedDataContext8(locations, true);
                return refDataContext52.GetLocation<string>(refDataContext52.ValueType___Expr52Get, refDataContext52.ValueType___Expr52Set);
            }
            if ((expressionId == 53)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext53 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext53.ValueType___Expr53Get();
            }
            if ((expressionId == 54)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext54 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext54.ValueType___Expr54Get();
            }
            if ((expressionId == 55)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext55 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext55.ValueType___Expr55Get();
            }
            if ((expressionId == 56)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext56 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext56.ValueType___Expr56Get();
            }
            if ((expressionId == 57)) {
                ItService_TypedDataContext8_ForReadOnly valDataContext57 = new ItService_TypedDataContext8_ForReadOnly(locations, true);
                return valDataContext57.ValueType___Expr57Get();
            }
            if ((expressionId == 58)) {
                ItService_TypedDataContext9 refDataContext58 = new ItService_TypedDataContext9(locations, true);
                return refDataContext58.GetLocation<string>(refDataContext58.ValueType___Expr58Get, refDataContext58.ValueType___Expr58Set);
            }
            if ((expressionId == 59)) {
                ItService_TypedDataContext9_ForReadOnly valDataContext59 = new ItService_TypedDataContext9_ForReadOnly(locations, true);
                return valDataContext59.ValueType___Expr59Get();
            }
            if ((expressionId == 60)) {
                ItService_TypedDataContext9 refDataContext60 = new ItService_TypedDataContext9(locations, true);
                return refDataContext60.GetLocation<string>(refDataContext60.ValueType___Expr60Get, refDataContext60.ValueType___Expr60Set);
            }
            if ((expressionId == 61)) {
                ItService_TypedDataContext9_ForReadOnly valDataContext61 = new ItService_TypedDataContext9_ForReadOnly(locations, true);
                return valDataContext61.ValueType___Expr61Get();
            }
            if ((expressionId == 62)) {
                ItService_TypedDataContext10 refDataContext62 = new ItService_TypedDataContext10(locations, true);
                return refDataContext62.GetLocation<string>(refDataContext62.ValueType___Expr62Get, refDataContext62.ValueType___Expr62Set);
            }
            if ((expressionId == 63)) {
                ItService_TypedDataContext10_ForReadOnly valDataContext63 = new ItService_TypedDataContext10_ForReadOnly(locations, true);
                return valDataContext63.ValueType___Expr63Get();
            }
            if ((expressionId == 64)) {
                ItService_TypedDataContext10 refDataContext64 = new ItService_TypedDataContext10(locations, true);
                return refDataContext64.GetLocation<string>(refDataContext64.ValueType___Expr64Get, refDataContext64.ValueType___Expr64Set);
            }
            if ((expressionId == 65)) {
                ItService_TypedDataContext10_ForReadOnly valDataContext65 = new ItService_TypedDataContext10_ForReadOnly(locations, true);
                return valDataContext65.ValueType___Expr65Get();
            }
            if ((expressionId == 66)) {
                ItService_TypedDataContext11 refDataContext66 = new ItService_TypedDataContext11(locations, true);
                return refDataContext66.GetLocation<string>(refDataContext66.ValueType___Expr66Get, refDataContext66.ValueType___Expr66Set);
            }
            if ((expressionId == 67)) {
                ItService_TypedDataContext11_ForReadOnly valDataContext67 = new ItService_TypedDataContext11_ForReadOnly(locations, true);
                return valDataContext67.ValueType___Expr67Get();
            }
            if ((expressionId == 68)) {
                ItService_TypedDataContext11 refDataContext68 = new ItService_TypedDataContext11(locations, true);
                return refDataContext68.GetLocation<string>(refDataContext68.ValueType___Expr68Get, refDataContext68.ValueType___Expr68Set);
            }
            if ((expressionId == 69)) {
                ItService_TypedDataContext11_ForReadOnly valDataContext69 = new ItService_TypedDataContext11_ForReadOnly(locations, true);
                return valDataContext69.ValueType___Expr69Get();
            }
            if ((expressionId == 70)) {
                ItService_TypedDataContext11_ForReadOnly valDataContext70 = new ItService_TypedDataContext11_ForReadOnly(locations, true);
                return valDataContext70.ValueType___Expr70Get();
            }
            if ((expressionId == 71)) {
                ItService_TypedDataContext11_ForReadOnly valDataContext71 = new ItService_TypedDataContext11_ForReadOnly(locations, true);
                return valDataContext71.ValueType___Expr71Get();
            }
            if ((expressionId == 72)) {
                ItService_TypedDataContext11_ForReadOnly valDataContext72 = new ItService_TypedDataContext11_ForReadOnly(locations, true);
                return valDataContext72.ValueType___Expr72Get();
            }
            if ((expressionId == 73)) {
                ItService_TypedDataContext12 refDataContext73 = new ItService_TypedDataContext12(locations, true);
                return refDataContext73.GetLocation<string>(refDataContext73.ValueType___Expr73Get, refDataContext73.ValueType___Expr73Set);
            }
            if ((expressionId == 74)) {
                ItService_TypedDataContext12_ForReadOnly valDataContext74 = new ItService_TypedDataContext12_ForReadOnly(locations, true);
                return valDataContext74.ValueType___Expr74Get();
            }
            if ((expressionId == 75)) {
                ItService_TypedDataContext12 refDataContext75 = new ItService_TypedDataContext12(locations, true);
                return refDataContext75.GetLocation<string>(refDataContext75.ValueType___Expr75Get, refDataContext75.ValueType___Expr75Set);
            }
            if ((expressionId == 76)) {
                ItService_TypedDataContext12_ForReadOnly valDataContext76 = new ItService_TypedDataContext12_ForReadOnly(locations, true);
                return valDataContext76.ValueType___Expr76Get();
            }
            if ((expressionId == 77)) {
                ItService_TypedDataContext13 refDataContext77 = new ItService_TypedDataContext13(locations, true);
                return refDataContext77.GetLocation<string>(refDataContext77.ValueType___Expr77Get, refDataContext77.ValueType___Expr77Set);
            }
            if ((expressionId == 78)) {
                ItService_TypedDataContext13_ForReadOnly valDataContext78 = new ItService_TypedDataContext13_ForReadOnly(locations, true);
                return valDataContext78.ValueType___Expr78Get();
            }
            if ((expressionId == 79)) {
                ItService_TypedDataContext13 refDataContext79 = new ItService_TypedDataContext13(locations, true);
                return refDataContext79.GetLocation<string>(refDataContext79.ValueType___Expr79Get, refDataContext79.ValueType___Expr79Set);
            }
            if ((expressionId == 80)) {
                ItService_TypedDataContext13_ForReadOnly valDataContext80 = new ItService_TypedDataContext13_ForReadOnly(locations, true);
                return valDataContext80.ValueType___Expr80Get();
            }
            if ((expressionId == 81)) {
                ItService_TypedDataContext14 refDataContext81 = new ItService_TypedDataContext14(locations, true);
                return refDataContext81.GetLocation<string>(refDataContext81.ValueType___Expr81Get, refDataContext81.ValueType___Expr81Set);
            }
            if ((expressionId == 82)) {
                ItService_TypedDataContext14_ForReadOnly valDataContext82 = new ItService_TypedDataContext14_ForReadOnly(locations, true);
                return valDataContext82.ValueType___Expr82Get();
            }
            if ((expressionId == 83)) {
                ItService_TypedDataContext14 refDataContext83 = new ItService_TypedDataContext14(locations, true);
                return refDataContext83.GetLocation<string>(refDataContext83.ValueType___Expr83Get, refDataContext83.ValueType___Expr83Set);
            }
            if ((expressionId == 84)) {
                ItService_TypedDataContext14_ForReadOnly valDataContext84 = new ItService_TypedDataContext14_ForReadOnly(locations, true);
                return valDataContext84.ValueType___Expr84Get();
            }
            if ((expressionId == 85)) {
                ItService_TypedDataContext15 refDataContext85 = new ItService_TypedDataContext15(locations, true);
                return refDataContext85.GetLocation<string>(refDataContext85.ValueType___Expr85Get, refDataContext85.ValueType___Expr85Set);
            }
            if ((expressionId == 86)) {
                ItService_TypedDataContext15_ForReadOnly valDataContext86 = new ItService_TypedDataContext15_ForReadOnly(locations, true);
                return valDataContext86.ValueType___Expr86Get();
            }
            if ((expressionId == 87)) {
                ItService_TypedDataContext15 refDataContext87 = new ItService_TypedDataContext15(locations, true);
                return refDataContext87.GetLocation<string>(refDataContext87.ValueType___Expr87Get, refDataContext87.ValueType___Expr87Set);
            }
            if ((expressionId == 88)) {
                ItService_TypedDataContext15_ForReadOnly valDataContext88 = new ItService_TypedDataContext15_ForReadOnly(locations, true);
                return valDataContext88.ValueType___Expr88Get();
            }
            if ((expressionId == 89)) {
                ItService_TypedDataContext16 refDataContext89 = new ItService_TypedDataContext16(locations, true);
                return refDataContext89.GetLocation<string>(refDataContext89.ValueType___Expr89Get, refDataContext89.ValueType___Expr89Set);
            }
            if ((expressionId == 90)) {
                ItService_TypedDataContext16_ForReadOnly valDataContext90 = new ItService_TypedDataContext16_ForReadOnly(locations, true);
                return valDataContext90.ValueType___Expr90Get();
            }
            if ((expressionId == 91)) {
                ItService_TypedDataContext16 refDataContext91 = new ItService_TypedDataContext16(locations, true);
                return refDataContext91.GetLocation<string>(refDataContext91.ValueType___Expr91Get, refDataContext91.ValueType___Expr91Set);
            }
            if ((expressionId == 92)) {
                ItService_TypedDataContext16_ForReadOnly valDataContext92 = new ItService_TypedDataContext16_ForReadOnly(locations, true);
                return valDataContext92.ValueType___Expr92Get();
            }
            if ((expressionId == 93)) {
                ItService_TypedDataContext17 refDataContext93 = new ItService_TypedDataContext17(locations, true);
                return refDataContext93.GetLocation<string>(refDataContext93.ValueType___Expr93Get, refDataContext93.ValueType___Expr93Set);
            }
            if ((expressionId == 94)) {
                ItService_TypedDataContext17_ForReadOnly valDataContext94 = new ItService_TypedDataContext17_ForReadOnly(locations, true);
                return valDataContext94.ValueType___Expr94Get();
            }
            if ((expressionId == 95)) {
                ItService_TypedDataContext17 refDataContext95 = new ItService_TypedDataContext17(locations, true);
                return refDataContext95.GetLocation<string>(refDataContext95.ValueType___Expr95Get, refDataContext95.ValueType___Expr95Set);
            }
            if ((expressionId == 96)) {
                ItService_TypedDataContext17_ForReadOnly valDataContext96 = new ItService_TypedDataContext17_ForReadOnly(locations, true);
                return valDataContext96.ValueType___Expr96Get();
            }
            if ((expressionId == 97)) {
                ItService_TypedDataContext18 refDataContext97 = new ItService_TypedDataContext18(locations, true);
                return refDataContext97.GetLocation<string>(refDataContext97.ValueType___Expr97Get, refDataContext97.ValueType___Expr97Set);
            }
            if ((expressionId == 98)) {
                ItService_TypedDataContext18_ForReadOnly valDataContext98 = new ItService_TypedDataContext18_ForReadOnly(locations, true);
                return valDataContext98.ValueType___Expr98Get();
            }
            if ((expressionId == 99)) {
                ItService_TypedDataContext18 refDataContext99 = new ItService_TypedDataContext18(locations, true);
                return refDataContext99.GetLocation<string>(refDataContext99.ValueType___Expr99Get, refDataContext99.ValueType___Expr99Set);
            }
            if ((expressionId == 100)) {
                ItService_TypedDataContext18_ForReadOnly valDataContext100 = new ItService_TypedDataContext18_ForReadOnly(locations, true);
                return valDataContext100.ValueType___Expr100Get();
            }
            if ((expressionId == 101)) {
                ItService_TypedDataContext19 refDataContext101 = new ItService_TypedDataContext19(locations, true);
                return refDataContext101.GetLocation<string>(refDataContext101.ValueType___Expr101Get, refDataContext101.ValueType___Expr101Set);
            }
            if ((expressionId == 102)) {
                ItService_TypedDataContext19_ForReadOnly valDataContext102 = new ItService_TypedDataContext19_ForReadOnly(locations, true);
                return valDataContext102.ValueType___Expr102Get();
            }
            if ((expressionId == 103)) {
                ItService_TypedDataContext19 refDataContext103 = new ItService_TypedDataContext19(locations, true);
                return refDataContext103.GetLocation<string>(refDataContext103.ValueType___Expr103Get, refDataContext103.ValueType___Expr103Set);
            }
            if ((expressionId == 104)) {
                ItService_TypedDataContext19_ForReadOnly valDataContext104 = new ItService_TypedDataContext19_ForReadOnly(locations, true);
                return valDataContext104.ValueType___Expr104Get();
            }
            return null;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public bool CanExecuteExpression(string expressionText, bool isReference, System.Collections.Generic.IList<System.Activities.LocationReference> locations, out int expressionId) {
            if (((isReference == false) 
                        && ((expressionText == "WfIn.drafter") 
                        && (ItService_TypedDataContext3_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 0;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext3.Validate(locations, true, 0) == true)))) {
                expressionId = 1;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext3_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 2;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext3.Validate(locations, true, 0) == true)))) {
                expressionId = 3;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext3_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 4;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink==\"向信息中心提交申请\"") 
                        && (ItService_TypedDataContext3_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 5;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext5.Validate(locations, true, 0) == true)))) {
                expressionId = 6;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext5.Validate(locations, true, 0) == true)))) {
                expressionId = 7;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 8;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 9;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext5.Validate(locations, true, 0) == true)))) {
                expressionId = 10;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 11;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext5.Validate(locations, true, 0) == true)))) {
                expressionId = 12;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink==\"技术科处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 13;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"运维科处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 14;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink==\"驳回\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 15;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"张鹏处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 16;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"杨洋处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 17;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"夏永兵处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 18;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"高静处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 19;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"朱晋昱处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 20;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"朱晓桃处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 21;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"杨瑞处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 22;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"李晓炜处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 23;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"张江处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 24;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"丁慧霞处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 25;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"刘雨牧处理\"") 
                        && (ItService_TypedDataContext5_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 26;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext6.Validate(locations, true, 0) == true)))) {
                expressionId = 27;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext6.Validate(locations, true, 0) == true)))) {
                expressionId = 28;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 29;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 30;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext6.Validate(locations, true, 0) == true)))) {
                expressionId = 31;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 32;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext6.Validate(locations, true, 0) == true)))) {
                expressionId = 33;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"张鹏处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 34;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"杨洋处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 35;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"驳回\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 36;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"高静处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 37;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"朱晋昱处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 38;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"朱晓桃处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 39;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"杨瑞处理\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 40;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"完成\"") 
                        && (ItService_TypedDataContext6_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 41;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext7.Validate(locations, true, 0) == true)))) {
                expressionId = 42;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext7_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 43;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext7.Validate(locations, true, 0) == true)))) {
                expressionId = 44;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext7_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 45;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext8.Validate(locations, true, 0) == true)))) {
                expressionId = 46;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext8.Validate(locations, true, 0) == true)))) {
                expressionId = 47;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 48;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 49;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext8.Validate(locations, true, 0) == true)))) {
                expressionId = 50;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 51;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "OpinionField") 
                        && (ItService_TypedDataContext8.Validate(locations, true, 0) == true)))) {
                expressionId = 52;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"李晓炜处理\"") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 53;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"张江处理\"") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 54;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"丁慧霞处理\"") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 55;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"刘雨牧处理\"") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 56;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"夏永兵处理\"") 
                        && (ItService_TypedDataContext8_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 57;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext9.Validate(locations, true, 0) == true)))) {
                expressionId = 58;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext9_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 59;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext9.Validate(locations, true, 0) == true)))) {
                expressionId = 60;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext9_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 61;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext10.Validate(locations, true, 0) == true)))) {
                expressionId = 62;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext10_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 63;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext10.Validate(locations, true, 0) == true)))) {
                expressionId = 64;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext10_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 65;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext11.Validate(locations, true, 0) == true)))) {
                expressionId = 66;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext11_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 67;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext11.Validate(locations, true, 0) == true)))) {
                expressionId = 68;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext11_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 69;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"结束流程\"") 
                        && (ItService_TypedDataContext11_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 70;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"技术科处理\"") 
                        && (ItService_TypedDataContext11_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 71;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "NextLink == \"运维科处理\"") 
                        && (ItService_TypedDataContext11_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 72;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext12.Validate(locations, true, 0) == true)))) {
                expressionId = 73;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext12_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 74;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext12.Validate(locations, true, 0) == true)))) {
                expressionId = 75;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext12_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 76;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext13.Validate(locations, true, 0) == true)))) {
                expressionId = 77;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext13_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 78;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext13.Validate(locations, true, 0) == true)))) {
                expressionId = 79;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext13_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 80;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext14.Validate(locations, true, 0) == true)))) {
                expressionId = 81;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext14_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 82;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext14.Validate(locations, true, 0) == true)))) {
                expressionId = 83;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext14_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 84;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext15.Validate(locations, true, 0) == true)))) {
                expressionId = 85;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext15_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 86;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext15.Validate(locations, true, 0) == true)))) {
                expressionId = 87;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext15_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 88;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext16.Validate(locations, true, 0) == true)))) {
                expressionId = 89;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext16_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 90;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext16.Validate(locations, true, 0) == true)))) {
                expressionId = 91;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext16_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 92;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext17.Validate(locations, true, 0) == true)))) {
                expressionId = 93;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext17_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 94;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext17.Validate(locations, true, 0) == true)))) {
                expressionId = 95;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext17_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 96;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext18.Validate(locations, true, 0) == true)))) {
                expressionId = 97;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext18_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 98;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext18.Validate(locations, true, 0) == true)))) {
                expressionId = 99;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext18_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 100;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext19.Validate(locations, true, 0) == true)))) {
                expressionId = 101;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "CurrentUser") 
                        && (ItService_TypedDataContext19_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 102;
                return true;
            }
            if (((isReference == true) 
                        && ((expressionText == "NextLink") 
                        && (ItService_TypedDataContext19.Validate(locations, true, 0) == true)))) {
                expressionId = 103;
                return true;
            }
            if (((isReference == false) 
                        && ((expressionText == "WfIn") 
                        && (ItService_TypedDataContext19_ForReadOnly.Validate(locations, true, 0) == true)))) {
                expressionId = 104;
                return true;
            }
            expressionId = -1;
            return false;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public System.Collections.Generic.IList<string> GetRequiredLocations(int expressionId) {
            return null;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        public System.Linq.Expressions.Expression GetExpressionTreeForExpression(int expressionId, System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) {
            if ((expressionId == 0)) {
                return new ItService_TypedDataContext3_ForReadOnly(locationReferences).@__Expr0GetTree();
            }
            if ((expressionId == 1)) {
                return new ItService_TypedDataContext3(locationReferences).@__Expr1GetTree();
            }
            if ((expressionId == 2)) {
                return new ItService_TypedDataContext3_ForReadOnly(locationReferences).@__Expr2GetTree();
            }
            if ((expressionId == 3)) {
                return new ItService_TypedDataContext3(locationReferences).@__Expr3GetTree();
            }
            if ((expressionId == 4)) {
                return new ItService_TypedDataContext3_ForReadOnly(locationReferences).@__Expr4GetTree();
            }
            if ((expressionId == 5)) {
                return new ItService_TypedDataContext3_ForReadOnly(locationReferences).@__Expr5GetTree();
            }
            if ((expressionId == 6)) {
                return new ItService_TypedDataContext5(locationReferences).@__Expr6GetTree();
            }
            if ((expressionId == 7)) {
                return new ItService_TypedDataContext5(locationReferences).@__Expr7GetTree();
            }
            if ((expressionId == 8)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr8GetTree();
            }
            if ((expressionId == 9)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr9GetTree();
            }
            if ((expressionId == 10)) {
                return new ItService_TypedDataContext5(locationReferences).@__Expr10GetTree();
            }
            if ((expressionId == 11)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr11GetTree();
            }
            if ((expressionId == 12)) {
                return new ItService_TypedDataContext5(locationReferences).@__Expr12GetTree();
            }
            if ((expressionId == 13)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr13GetTree();
            }
            if ((expressionId == 14)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr14GetTree();
            }
            if ((expressionId == 15)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr15GetTree();
            }
            if ((expressionId == 16)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr16GetTree();
            }
            if ((expressionId == 17)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr17GetTree();
            }
            if ((expressionId == 18)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr18GetTree();
            }
            if ((expressionId == 19)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr19GetTree();
            }
            if ((expressionId == 20)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr20GetTree();
            }
            if ((expressionId == 21)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr21GetTree();
            }
            if ((expressionId == 22)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr22GetTree();
            }
            if ((expressionId == 23)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr23GetTree();
            }
            if ((expressionId == 24)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr24GetTree();
            }
            if ((expressionId == 25)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr25GetTree();
            }
            if ((expressionId == 26)) {
                return new ItService_TypedDataContext5_ForReadOnly(locationReferences).@__Expr26GetTree();
            }
            if ((expressionId == 27)) {
                return new ItService_TypedDataContext6(locationReferences).@__Expr27GetTree();
            }
            if ((expressionId == 28)) {
                return new ItService_TypedDataContext6(locationReferences).@__Expr28GetTree();
            }
            if ((expressionId == 29)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr29GetTree();
            }
            if ((expressionId == 30)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr30GetTree();
            }
            if ((expressionId == 31)) {
                return new ItService_TypedDataContext6(locationReferences).@__Expr31GetTree();
            }
            if ((expressionId == 32)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr32GetTree();
            }
            if ((expressionId == 33)) {
                return new ItService_TypedDataContext6(locationReferences).@__Expr33GetTree();
            }
            if ((expressionId == 34)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr34GetTree();
            }
            if ((expressionId == 35)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr35GetTree();
            }
            if ((expressionId == 36)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr36GetTree();
            }
            if ((expressionId == 37)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr37GetTree();
            }
            if ((expressionId == 38)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr38GetTree();
            }
            if ((expressionId == 39)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr39GetTree();
            }
            if ((expressionId == 40)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr40GetTree();
            }
            if ((expressionId == 41)) {
                return new ItService_TypedDataContext6_ForReadOnly(locationReferences).@__Expr41GetTree();
            }
            if ((expressionId == 42)) {
                return new ItService_TypedDataContext7(locationReferences).@__Expr42GetTree();
            }
            if ((expressionId == 43)) {
                return new ItService_TypedDataContext7_ForReadOnly(locationReferences).@__Expr43GetTree();
            }
            if ((expressionId == 44)) {
                return new ItService_TypedDataContext7(locationReferences).@__Expr44GetTree();
            }
            if ((expressionId == 45)) {
                return new ItService_TypedDataContext7_ForReadOnly(locationReferences).@__Expr45GetTree();
            }
            if ((expressionId == 46)) {
                return new ItService_TypedDataContext8(locationReferences).@__Expr46GetTree();
            }
            if ((expressionId == 47)) {
                return new ItService_TypedDataContext8(locationReferences).@__Expr47GetTree();
            }
            if ((expressionId == 48)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr48GetTree();
            }
            if ((expressionId == 49)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr49GetTree();
            }
            if ((expressionId == 50)) {
                return new ItService_TypedDataContext8(locationReferences).@__Expr50GetTree();
            }
            if ((expressionId == 51)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr51GetTree();
            }
            if ((expressionId == 52)) {
                return new ItService_TypedDataContext8(locationReferences).@__Expr52GetTree();
            }
            if ((expressionId == 53)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr53GetTree();
            }
            if ((expressionId == 54)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr54GetTree();
            }
            if ((expressionId == 55)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr55GetTree();
            }
            if ((expressionId == 56)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr56GetTree();
            }
            if ((expressionId == 57)) {
                return new ItService_TypedDataContext8_ForReadOnly(locationReferences).@__Expr57GetTree();
            }
            if ((expressionId == 58)) {
                return new ItService_TypedDataContext9(locationReferences).@__Expr58GetTree();
            }
            if ((expressionId == 59)) {
                return new ItService_TypedDataContext9_ForReadOnly(locationReferences).@__Expr59GetTree();
            }
            if ((expressionId == 60)) {
                return new ItService_TypedDataContext9(locationReferences).@__Expr60GetTree();
            }
            if ((expressionId == 61)) {
                return new ItService_TypedDataContext9_ForReadOnly(locationReferences).@__Expr61GetTree();
            }
            if ((expressionId == 62)) {
                return new ItService_TypedDataContext10(locationReferences).@__Expr62GetTree();
            }
            if ((expressionId == 63)) {
                return new ItService_TypedDataContext10_ForReadOnly(locationReferences).@__Expr63GetTree();
            }
            if ((expressionId == 64)) {
                return new ItService_TypedDataContext10(locationReferences).@__Expr64GetTree();
            }
            if ((expressionId == 65)) {
                return new ItService_TypedDataContext10_ForReadOnly(locationReferences).@__Expr65GetTree();
            }
            if ((expressionId == 66)) {
                return new ItService_TypedDataContext11(locationReferences).@__Expr66GetTree();
            }
            if ((expressionId == 67)) {
                return new ItService_TypedDataContext11_ForReadOnly(locationReferences).@__Expr67GetTree();
            }
            if ((expressionId == 68)) {
                return new ItService_TypedDataContext11(locationReferences).@__Expr68GetTree();
            }
            if ((expressionId == 69)) {
                return new ItService_TypedDataContext11_ForReadOnly(locationReferences).@__Expr69GetTree();
            }
            if ((expressionId == 70)) {
                return new ItService_TypedDataContext11_ForReadOnly(locationReferences).@__Expr70GetTree();
            }
            if ((expressionId == 71)) {
                return new ItService_TypedDataContext11_ForReadOnly(locationReferences).@__Expr71GetTree();
            }
            if ((expressionId == 72)) {
                return new ItService_TypedDataContext11_ForReadOnly(locationReferences).@__Expr72GetTree();
            }
            if ((expressionId == 73)) {
                return new ItService_TypedDataContext12(locationReferences).@__Expr73GetTree();
            }
            if ((expressionId == 74)) {
                return new ItService_TypedDataContext12_ForReadOnly(locationReferences).@__Expr74GetTree();
            }
            if ((expressionId == 75)) {
                return new ItService_TypedDataContext12(locationReferences).@__Expr75GetTree();
            }
            if ((expressionId == 76)) {
                return new ItService_TypedDataContext12_ForReadOnly(locationReferences).@__Expr76GetTree();
            }
            if ((expressionId == 77)) {
                return new ItService_TypedDataContext13(locationReferences).@__Expr77GetTree();
            }
            if ((expressionId == 78)) {
                return new ItService_TypedDataContext13_ForReadOnly(locationReferences).@__Expr78GetTree();
            }
            if ((expressionId == 79)) {
                return new ItService_TypedDataContext13(locationReferences).@__Expr79GetTree();
            }
            if ((expressionId == 80)) {
                return new ItService_TypedDataContext13_ForReadOnly(locationReferences).@__Expr80GetTree();
            }
            if ((expressionId == 81)) {
                return new ItService_TypedDataContext14(locationReferences).@__Expr81GetTree();
            }
            if ((expressionId == 82)) {
                return new ItService_TypedDataContext14_ForReadOnly(locationReferences).@__Expr82GetTree();
            }
            if ((expressionId == 83)) {
                return new ItService_TypedDataContext14(locationReferences).@__Expr83GetTree();
            }
            if ((expressionId == 84)) {
                return new ItService_TypedDataContext14_ForReadOnly(locationReferences).@__Expr84GetTree();
            }
            if ((expressionId == 85)) {
                return new ItService_TypedDataContext15(locationReferences).@__Expr85GetTree();
            }
            if ((expressionId == 86)) {
                return new ItService_TypedDataContext15_ForReadOnly(locationReferences).@__Expr86GetTree();
            }
            if ((expressionId == 87)) {
                return new ItService_TypedDataContext15(locationReferences).@__Expr87GetTree();
            }
            if ((expressionId == 88)) {
                return new ItService_TypedDataContext15_ForReadOnly(locationReferences).@__Expr88GetTree();
            }
            if ((expressionId == 89)) {
                return new ItService_TypedDataContext16(locationReferences).@__Expr89GetTree();
            }
            if ((expressionId == 90)) {
                return new ItService_TypedDataContext16_ForReadOnly(locationReferences).@__Expr90GetTree();
            }
            if ((expressionId == 91)) {
                return new ItService_TypedDataContext16(locationReferences).@__Expr91GetTree();
            }
            if ((expressionId == 92)) {
                return new ItService_TypedDataContext16_ForReadOnly(locationReferences).@__Expr92GetTree();
            }
            if ((expressionId == 93)) {
                return new ItService_TypedDataContext17(locationReferences).@__Expr93GetTree();
            }
            if ((expressionId == 94)) {
                return new ItService_TypedDataContext17_ForReadOnly(locationReferences).@__Expr94GetTree();
            }
            if ((expressionId == 95)) {
                return new ItService_TypedDataContext17(locationReferences).@__Expr95GetTree();
            }
            if ((expressionId == 96)) {
                return new ItService_TypedDataContext17_ForReadOnly(locationReferences).@__Expr96GetTree();
            }
            if ((expressionId == 97)) {
                return new ItService_TypedDataContext18(locationReferences).@__Expr97GetTree();
            }
            if ((expressionId == 98)) {
                return new ItService_TypedDataContext18_ForReadOnly(locationReferences).@__Expr98GetTree();
            }
            if ((expressionId == 99)) {
                return new ItService_TypedDataContext18(locationReferences).@__Expr99GetTree();
            }
            if ((expressionId == 100)) {
                return new ItService_TypedDataContext18_ForReadOnly(locationReferences).@__Expr100GetTree();
            }
            if ((expressionId == 101)) {
                return new ItService_TypedDataContext19(locationReferences).@__Expr101GetTree();
            }
            if ((expressionId == 102)) {
                return new ItService_TypedDataContext19_ForReadOnly(locationReferences).@__Expr102GetTree();
            }
            if ((expressionId == 103)) {
                return new ItService_TypedDataContext19(locationReferences).@__Expr103GetTree();
            }
            if ((expressionId == 104)) {
                return new ItService_TypedDataContext19_ForReadOnly(locationReferences).@__Expr104GetTree();
            }
            return null;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext0 : System.Activities.XamlIntegration.CompiledDataContext {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext0(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext0(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext0(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal static object GetDataContextActivitiesHelper(System.Activities.Activity compiledRoot, bool forImplementation) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetDataContextActivities(compiledRoot, forImplementation);
            }
            
            internal static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
            }
            
            public static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 0))) {
                    return false;
                }
                expectedLocationsCount = 0;
                return true;
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext0_ForReadOnly : System.Activities.XamlIntegration.CompiledDataContext {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext0_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext0_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext0_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal static object GetDataContextActivitiesHelper(System.Activities.Activity compiledRoot, bool forImplementation) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetDataContextActivities(compiledRoot, forImplementation);
            }
            
            internal static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
            }
            
            public static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 0))) {
                    return false;
                }
                expectedLocationsCount = 0;
                return true;
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext1 : ItService_TypedDataContext0 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext1(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext1(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext1(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            protected Apache.Models.WorkFlowInParameter WfIn {
                get {
                    return ((Apache.Models.WorkFlowInParameter)(this.GetVariableValue((0 + locationsOffset))));
                }
                set {
                    this.SetVariableValue((0 + locationsOffset), value);
                }
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 1))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 1);
                }
                expectedLocationsCount = 1;
                if (((locationReferences[(offset + 0)].Name != "WfIn") 
                            || (locationReferences[(offset + 0)].Type != typeof(Apache.Models.WorkFlowInParameter)))) {
                    return false;
                }
                return ItService_TypedDataContext0.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext1_ForReadOnly : ItService_TypedDataContext0_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext1_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext1_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext1_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            protected Apache.Models.WorkFlowInParameter WfIn {
                get {
                    return ((Apache.Models.WorkFlowInParameter)(this.GetVariableValue((0 + locationsOffset))));
                }
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 1))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 1);
                }
                expectedLocationsCount = 1;
                if (((locationReferences[(offset + 0)].Name != "WfIn") 
                            || (locationReferences[(offset + 0)].Type != typeof(Apache.Models.WorkFlowInParameter)))) {
                    return false;
                }
                return ItService_TypedDataContext0_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext2 : ItService_TypedDataContext1 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext2(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext2(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext2(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            protected string CurrentUser {
                get {
                    return ((string)(this.GetVariableValue((1 + locationsOffset))));
                }
                set {
                    this.SetVariableValue((1 + locationsOffset), value);
                }
            }
            
            protected string NextLink {
                get {
                    return ((string)(this.GetVariableValue((2 + locationsOffset))));
                }
                set {
                    this.SetVariableValue((2 + locationsOffset), value);
                }
            }
            
            protected string OpinionField {
                get {
                    return ((string)(this.GetVariableValue((3 + locationsOffset))));
                }
                set {
                    this.SetVariableValue((3 + locationsOffset), value);
                }
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                if (((locationReferences[(offset + 1)].Name != "CurrentUser") 
                            || (locationReferences[(offset + 1)].Type != typeof(string)))) {
                    return false;
                }
                if (((locationReferences[(offset + 2)].Name != "NextLink") 
                            || (locationReferences[(offset + 2)].Type != typeof(string)))) {
                    return false;
                }
                if (((locationReferences[(offset + 3)].Name != "OpinionField") 
                            || (locationReferences[(offset + 3)].Type != typeof(string)))) {
                    return false;
                }
                return ItService_TypedDataContext1.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext2_ForReadOnly : ItService_TypedDataContext1_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext2_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext2_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext2_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            protected string CurrentUser {
                get {
                    return ((string)(this.GetVariableValue((1 + locationsOffset))));
                }
            }
            
            protected string NextLink {
                get {
                    return ((string)(this.GetVariableValue((2 + locationsOffset))));
                }
            }
            
            protected string OpinionField {
                get {
                    return ((string)(this.GetVariableValue((3 + locationsOffset))));
                }
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                if (((locationReferences[(offset + 1)].Name != "CurrentUser") 
                            || (locationReferences[(offset + 1)].Type != typeof(string)))) {
                    return false;
                }
                if (((locationReferences[(offset + 2)].Name != "NextLink") 
                            || (locationReferences[(offset + 2)].Type != typeof(string)))) {
                    return false;
                }
                if (((locationReferences[(offset + 3)].Name != "OpinionField") 
                            || (locationReferences[(offset + 3)].Type != typeof(string)))) {
                    return false;
                }
                return ItService_TypedDataContext1_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext3 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext3(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext3(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext3(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr1GetTree() {
                
                #line 101 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr1Get() {
                
                #line 101 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr1Get() {
                this.GetValueTypeValues();
                return this.@__Expr1Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr1Set(string value) {
                
                #line 101 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr1Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr1Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr3GetTree() {
                
                #line 118 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr3Get() {
                
                #line 118 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr3Get() {
                this.GetValueTypeValues();
                return this.@__Expr3Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr3Set(string value) {
                
                #line 118 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr3Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr3Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext3_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext3_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext3_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext3_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr0GetTree() {
                
                #line 106 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                  WfIn.drafter;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr0Get() {
                
                #line 106 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                  WfIn.drafter;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr0Get() {
                this.GetValueTypeValues();
                return this.@__Expr0Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr2GetTree() {
                
                #line 113 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr2Get() {
                
                #line 113 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr2Get() {
                this.GetValueTypeValues();
                return this.@__Expr2Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr4GetTree() {
                
                #line 123 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr4Get() {
                
                #line 123 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr4Get() {
                this.GetValueTypeValues();
                return this.@__Expr4Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr5GetTree() {
                
                #line 132 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
              NextLink=="向信息中心提交申请";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr5Get() {
                
                #line 132 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
              NextLink=="向信息中心提交申请";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr5Get() {
                this.GetValueTypeValues();
                return this.@__Expr5Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext4 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext4(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext4(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext4(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext4_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext4_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext4_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext4_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext5 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext5(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext5(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext5(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr6GetTree() {
                
                #line 141 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr6Get() {
                
                #line 141 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr6Get() {
                this.GetValueTypeValues();
                return this.@__Expr6Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr6Set(string value) {
                
                #line 141 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr6Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr6Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr7GetTree() {
                
                #line 151 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr7Get() {
                
                #line 151 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr7Get() {
                this.GetValueTypeValues();
                return this.@__Expr7Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr7Set(string value) {
                
                #line 151 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                          OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr7Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr7Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr10GetTree() {
                
                #line 171 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr10Get() {
                
                #line 171 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr10Get() {
                this.GetValueTypeValues();
                return this.@__Expr10Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr10Set(string value) {
                
                #line 171 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr10Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr10Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr12GetTree() {
                
                #line 183 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr12Get() {
                
                #line 183 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr12Get() {
                this.GetValueTypeValues();
                return this.@__Expr12Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr12Set(string value) {
                
                #line 183 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                          OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr12Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr12Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext5_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext5_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext5_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext5_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr8GetTree() {
                
                #line 166 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr8Get() {
                
                #line 166 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr8Get() {
                this.GetValueTypeValues();
                return this.@__Expr8Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr9GetTree() {
                
                #line 161 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr9Get() {
                
                #line 161 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr9Get() {
                this.GetValueTypeValues();
                return this.@__Expr9Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr11GetTree() {
                
                #line 176 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr11Get() {
                
                #line 176 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr11Get() {
                this.GetValueTypeValues();
                return this.@__Expr11Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr13GetTree() {
                
                #line 197 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink=="技术科处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr13Get() {
                
                #line 197 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink=="技术科处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr13Get() {
                this.GetValueTypeValues();
                return this.@__Expr13Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr14GetTree() {
                
                #line 869 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "运维科处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr14Get() {
                
                #line 869 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "运维科处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr14Get() {
                this.GetValueTypeValues();
                return this.@__Expr14Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr15GetTree() {
                
                #line 874 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink=="驳回";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr15Get() {
                
                #line 874 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink=="驳回";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr15Get() {
                this.GetValueTypeValues();
                return this.@__Expr15Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr16GetTree() {
                
                #line 879 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "张鹏处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr16Get() {
                
                #line 879 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "张鹏处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr16Get() {
                this.GetValueTypeValues();
                return this.@__Expr16Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr17GetTree() {
                
                #line 884 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "杨洋处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr17Get() {
                
                #line 884 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "杨洋处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr17Get() {
                this.GetValueTypeValues();
                return this.@__Expr17Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr18GetTree() {
                
                #line 889 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "夏永兵处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr18Get() {
                
                #line 889 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "夏永兵处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr18Get() {
                this.GetValueTypeValues();
                return this.@__Expr18Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr19GetTree() {
                
                #line 894 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "高静处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr19Get() {
                
                #line 894 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "高静处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr19Get() {
                this.GetValueTypeValues();
                return this.@__Expr19Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr20GetTree() {
                
                #line 899 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "朱晋昱处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr20Get() {
                
                #line 899 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "朱晋昱处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr20Get() {
                this.GetValueTypeValues();
                return this.@__Expr20Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr21GetTree() {
                
                #line 904 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "朱晓桃处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr21Get() {
                
                #line 904 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "朱晓桃处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr21Get() {
                this.GetValueTypeValues();
                return this.@__Expr21Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr22GetTree() {
                
                #line 909 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "杨瑞处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr22Get() {
                
                #line 909 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "杨瑞处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr22Get() {
                this.GetValueTypeValues();
                return this.@__Expr22Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr23GetTree() {
                
                #line 914 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "李晓炜处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr23Get() {
                
                #line 914 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "李晓炜处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr23Get() {
                this.GetValueTypeValues();
                return this.@__Expr23Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr24GetTree() {
                
                #line 919 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "张江处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr24Get() {
                
                #line 919 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "张江处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr24Get() {
                this.GetValueTypeValues();
                return this.@__Expr24Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr25GetTree() {
                
                #line 924 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "丁慧霞处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr25Get() {
                
                #line 924 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "丁慧霞处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr25Get() {
                this.GetValueTypeValues();
                return this.@__Expr25Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr26GetTree() {
                
                #line 929 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                      NextLink == "刘雨牧处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr26Get() {
                
                #line 929 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                      NextLink == "刘雨牧处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr26Get() {
                this.GetValueTypeValues();
                return this.@__Expr26Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext6 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext6(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext6(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext6(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr27GetTree() {
                
                #line 206 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr27Get() {
                
                #line 206 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr27Get() {
                this.GetValueTypeValues();
                return this.@__Expr27Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr27Set(string value) {
                
                #line 206 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr27Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr27Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr28GetTree() {
                
                #line 216 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr28Get() {
                
                #line 216 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr28Get() {
                this.GetValueTypeValues();
                return this.@__Expr28Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr28Set(string value) {
                
                #line 216 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                  OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr28Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr28Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr31GetTree() {
                
                #line 236 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr31Get() {
                
                #line 236 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr31Get() {
                this.GetValueTypeValues();
                return this.@__Expr31Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr31Set(string value) {
                
                #line 236 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr31Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr31Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr33GetTree() {
                
                #line 248 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr33Get() {
                
                #line 248 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr33Get() {
                this.GetValueTypeValues();
                return this.@__Expr33Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr33Set(string value) {
                
                #line 248 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                  OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr33Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr33Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext6_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext6_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext6_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext6_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr29GetTree() {
                
                #line 231 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr29Get() {
                
                #line 231 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr29Get() {
                this.GetValueTypeValues();
                return this.@__Expr29Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr30GetTree() {
                
                #line 226 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr30Get() {
                
                #line 226 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr30Get() {
                this.GetValueTypeValues();
                return this.@__Expr30Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr32GetTree() {
                
                #line 241 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr32Get() {
                
                #line 241 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr32Get() {
                this.GetValueTypeValues();
                return this.@__Expr32Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr34GetTree() {
                
                #line 262 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "张鹏处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr34Get() {
                
                #line 262 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "张鹏处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr34Get() {
                this.GetValueTypeValues();
                return this.@__Expr34Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr35GetTree() {
                
                #line 640 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "杨洋处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr35Get() {
                
                #line 640 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "杨洋处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr35Get() {
                this.GetValueTypeValues();
                return this.@__Expr35Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr36GetTree() {
                
                #line 683 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "驳回";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr36Get() {
                
                #line 683 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "驳回";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr36Get() {
                this.GetValueTypeValues();
                return this.@__Expr36Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr37GetTree() {
                
                #line 688 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "高静处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr37Get() {
                
                #line 688 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "高静处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr37Get() {
                this.GetValueTypeValues();
                return this.@__Expr37Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr38GetTree() {
                
                #line 731 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "朱晋昱处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr38Get() {
                
                #line 731 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "朱晋昱处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr38Get() {
                this.GetValueTypeValues();
                return this.@__Expr38Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr39GetTree() {
                
                #line 774 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "朱晓桃处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr39Get() {
                
                #line 774 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "朱晓桃处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr39Get() {
                this.GetValueTypeValues();
                return this.@__Expr39Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr40GetTree() {
                
                #line 817 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "杨瑞处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr40Get() {
                
                #line 817 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "杨瑞处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr40Get() {
                this.GetValueTypeValues();
                return this.@__Expr40Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr41GetTree() {
                
                #line 860 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                              NextLink == "完成";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr41Get() {
                
                #line 860 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                              NextLink == "完成";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr41Get() {
                this.GetValueTypeValues();
                return this.@__Expr41Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext7 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext7(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext7(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext7(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr42GetTree() {
                
                #line 271 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr42Get() {
                
                #line 271 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr42Get() {
                this.GetValueTypeValues();
                return this.@__Expr42Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr42Set(string value) {
                
                #line 271 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr42Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr42Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr44GetTree() {
                
                #line 286 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr44Get() {
                
                #line 286 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr44Get() {
                this.GetValueTypeValues();
                return this.@__Expr44Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr44Set(string value) {
                
                #line 286 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr44Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr44Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext7_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext7_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext7_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext7_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr43GetTree() {
                
                #line 281 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr43Get() {
                
                #line 281 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr43Get() {
                this.GetValueTypeValues();
                return this.@__Expr43Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr45GetTree() {
                
                #line 291 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr45Get() {
                
                #line 291 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr45Get() {
                this.GetValueTypeValues();
                return this.@__Expr45Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext8 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext8(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext8(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext8(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr46GetTree() {
                
                #line 357 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr46Get() {
                
                #line 357 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr46Get() {
                this.GetValueTypeValues();
                return this.@__Expr46Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr46Set(string value) {
                
                #line 357 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr46Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr46Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr47GetTree() {
                
                #line 367 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr47Get() {
                
                #line 367 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr47Get() {
                this.GetValueTypeValues();
                return this.@__Expr47Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr47Set(string value) {
                
                #line 367 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                          OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr47Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr47Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr50GetTree() {
                
                #line 387 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr50Get() {
                
                #line 387 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr50Get() {
                this.GetValueTypeValues();
                return this.@__Expr50Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr50Set(string value) {
                
                #line 387 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr50Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr50Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr52GetTree() {
                
                #line 399 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr52Get() {
                
                #line 399 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr52Get() {
                this.GetValueTypeValues();
                return this.@__Expr52Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr52Set(string value) {
                
                #line 399 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                          OpinionField = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr52Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr52Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext8_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext8_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext8_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext8_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr48GetTree() {
                
                #line 382 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          OpinionField;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr48Get() {
                
                #line 382 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          OpinionField;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr48Get() {
                this.GetValueTypeValues();
                return this.@__Expr48Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr49GetTree() {
                
                #line 377 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr49Get() {
                
                #line 377 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr49Get() {
                this.GetValueTypeValues();
                return this.@__Expr49Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr51GetTree() {
                
                #line 392 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr51Get() {
                
                #line 392 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr51Get() {
                this.GetValueTypeValues();
                return this.@__Expr51Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr53GetTree() {
                
                #line 413 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                                      NextLink == "李晓炜处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr53Get() {
                
                #line 413 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                      NextLink == "李晓炜处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr53Get() {
                this.GetValueTypeValues();
                return this.@__Expr53Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr54GetTree() {
                
                #line 456 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                                      NextLink == "张江处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr54Get() {
                
                #line 456 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                      NextLink == "张江处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr54Get() {
                this.GetValueTypeValues();
                return this.@__Expr54Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr55GetTree() {
                
                #line 499 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                                      NextLink == "丁慧霞处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr55Get() {
                
                #line 499 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                      NextLink == "丁慧霞处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr55Get() {
                this.GetValueTypeValues();
                return this.@__Expr55Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr56GetTree() {
                
                #line 542 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                                      NextLink == "刘雨牧处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr56Get() {
                
                #line 542 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                      NextLink == "刘雨牧处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr56Get() {
                this.GetValueTypeValues();
                return this.@__Expr56Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr57GetTree() {
                
                #line 585 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                                      NextLink == "夏永兵处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr57Get() {
                
                #line 585 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                      NextLink == "夏永兵处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr57Get() {
                this.GetValueTypeValues();
                return this.@__Expr57Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext9 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext9(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext9(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext9(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr58GetTree() {
                
                #line 649 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr58Get() {
                
                #line 649 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr58Get() {
                this.GetValueTypeValues();
                return this.@__Expr58Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr58Set(string value) {
                
                #line 649 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr58Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr58Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr60GetTree() {
                
                #line 664 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr60Get() {
                
                #line 664 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr60Get() {
                this.GetValueTypeValues();
                return this.@__Expr60Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr60Set(string value) {
                
                #line 664 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr60Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr60Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext9_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext9_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext9_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext9_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr59GetTree() {
                
                #line 659 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr59Get() {
                
                #line 659 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr59Get() {
                this.GetValueTypeValues();
                return this.@__Expr59Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr61GetTree() {
                
                #line 669 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr61Get() {
                
                #line 669 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr61Get() {
                this.GetValueTypeValues();
                return this.@__Expr61Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext10 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext10(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext10(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext10(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr62GetTree() {
                
                #line 594 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr62Get() {
                
                #line 594 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr62Get() {
                this.GetValueTypeValues();
                return this.@__Expr62Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr62Set(string value) {
                
                #line 594 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr62Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr62Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr64GetTree() {
                
                #line 609 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr64Get() {
                
                #line 609 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr64Get() {
                this.GetValueTypeValues();
                return this.@__Expr64Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr64Set(string value) {
                
                #line 609 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr64Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr64Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext10_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext10_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext10_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext10_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr63GetTree() {
                
                #line 604 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr63Get() {
                
                #line 604 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr63Get() {
                this.GetValueTypeValues();
                return this.@__Expr63Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr65GetTree() {
                
                #line 614 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr65Get() {
                
                #line 614 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr65Get() {
                this.GetValueTypeValues();
                return this.@__Expr65Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext11 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext11(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext11(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext11(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr66GetTree() {
                
                #line 306 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr66Get() {
                
                #line 306 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr66Get() {
                this.GetValueTypeValues();
                return this.@__Expr66Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr66Set(string value) {
                
                #line 306 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr66Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr66Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr68GetTree() {
                
                #line 321 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr68Get() {
                
                #line 321 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr68Get() {
                this.GetValueTypeValues();
                return this.@__Expr68Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr68Set(string value) {
                
                #line 321 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr68Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr68Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext11_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext11_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext11_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext11_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr67GetTree() {
                
                #line 316 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr67Get() {
                
                #line 316 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr67Get() {
                this.GetValueTypeValues();
                return this.@__Expr67Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr69GetTree() {
                
                #line 326 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr69Get() {
                
                #line 326 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr69Get() {
                this.GetValueTypeValues();
                return this.@__Expr69Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr70GetTree() {
                
                #line 335 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                              NextLink == "结束流程";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr70Get() {
                
                #line 335 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                              NextLink == "结束流程";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr70Get() {
                this.GetValueTypeValues();
                return this.@__Expr70Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr71GetTree() {
                
                #line 343 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                              NextLink == "技术科处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr71Get() {
                
                #line 343 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                              NextLink == "技术科处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr71Get() {
                this.GetValueTypeValues();
                return this.@__Expr71Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr72GetTree() {
                
                #line 348 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<bool>> expression = () => 
                                              NextLink == "运维科处理";
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public bool @__Expr72Get() {
                
                #line 348 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                              NextLink == "运维科处理";
                
                #line default
                #line hidden
            }
            
            public bool ValueType___Expr72Get() {
                this.GetValueTypeValues();
                return this.@__Expr72Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext12 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext12(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext12(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext12(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr73GetTree() {
                
                #line 740 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr73Get() {
                
                #line 740 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr73Get() {
                this.GetValueTypeValues();
                return this.@__Expr73Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr73Set(string value) {
                
                #line 740 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr73Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr73Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr75GetTree() {
                
                #line 755 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr75Get() {
                
                #line 755 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr75Get() {
                this.GetValueTypeValues();
                return this.@__Expr75Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr75Set(string value) {
                
                #line 755 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr75Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr75Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext12_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext12_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext12_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext12_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr74GetTree() {
                
                #line 750 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr74Get() {
                
                #line 750 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr74Get() {
                this.GetValueTypeValues();
                return this.@__Expr74Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr76GetTree() {
                
                #line 760 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr76Get() {
                
                #line 760 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr76Get() {
                this.GetValueTypeValues();
                return this.@__Expr76Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext13 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext13(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext13(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext13(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr77GetTree() {
                
                #line 783 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr77Get() {
                
                #line 783 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr77Get() {
                this.GetValueTypeValues();
                return this.@__Expr77Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr77Set(string value) {
                
                #line 783 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr77Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr77Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr79GetTree() {
                
                #line 798 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr79Get() {
                
                #line 798 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr79Get() {
                this.GetValueTypeValues();
                return this.@__Expr79Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr79Set(string value) {
                
                #line 798 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr79Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr79Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext13_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext13_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext13_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext13_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr78GetTree() {
                
                #line 793 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr78Get() {
                
                #line 793 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr78Get() {
                this.GetValueTypeValues();
                return this.@__Expr78Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr80GetTree() {
                
                #line 803 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr80Get() {
                
                #line 803 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr80Get() {
                this.GetValueTypeValues();
                return this.@__Expr80Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext14 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext14(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext14(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext14(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr81GetTree() {
                
                #line 697 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr81Get() {
                
                #line 697 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr81Get() {
                this.GetValueTypeValues();
                return this.@__Expr81Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr81Set(string value) {
                
                #line 697 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr81Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr81Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr83GetTree() {
                
                #line 712 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr83Get() {
                
                #line 712 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr83Get() {
                this.GetValueTypeValues();
                return this.@__Expr83Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr83Set(string value) {
                
                #line 712 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr83Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr83Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext14_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext14_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext14_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext14_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr82GetTree() {
                
                #line 707 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr82Get() {
                
                #line 707 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr82Get() {
                this.GetValueTypeValues();
                return this.@__Expr82Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr84GetTree() {
                
                #line 717 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr84Get() {
                
                #line 717 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr84Get() {
                this.GetValueTypeValues();
                return this.@__Expr84Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext15 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext15(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext15(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext15(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr85GetTree() {
                
                #line 826 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr85Get() {
                
                #line 826 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr85Get() {
                this.GetValueTypeValues();
                return this.@__Expr85Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr85Set(string value) {
                
                #line 826 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr85Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr85Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr87GetTree() {
                
                #line 841 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr87Get() {
                
                #line 841 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr87Get() {
                this.GetValueTypeValues();
                return this.@__Expr87Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr87Set(string value) {
                
                #line 841 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                          NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr87Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr87Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext15_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext15_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext15_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext15_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr86GetTree() {
                
                #line 836 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                          CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr86Get() {
                
                #line 836 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr86Get() {
                this.GetValueTypeValues();
                return this.@__Expr86Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr88GetTree() {
                
                #line 846 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                          WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr88Get() {
                
                #line 846 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                          WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr88Get() {
                this.GetValueTypeValues();
                return this.@__Expr88Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext16 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext16(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext16(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext16(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr89GetTree() {
                
                #line 465 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr89Get() {
                
                #line 465 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr89Get() {
                this.GetValueTypeValues();
                return this.@__Expr89Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr89Set(string value) {
                
                #line 465 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr89Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr89Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr91GetTree() {
                
                #line 480 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr91Get() {
                
                #line 480 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr91Get() {
                this.GetValueTypeValues();
                return this.@__Expr91Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr91Set(string value) {
                
                #line 480 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr91Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr91Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext16_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext16_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext16_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext16_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr90GetTree() {
                
                #line 475 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr90Get() {
                
                #line 475 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr90Get() {
                this.GetValueTypeValues();
                return this.@__Expr90Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr92GetTree() {
                
                #line 485 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr92Get() {
                
                #line 485 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr92Get() {
                this.GetValueTypeValues();
                return this.@__Expr92Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext17 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext17(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext17(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext17(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr93GetTree() {
                
                #line 422 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr93Get() {
                
                #line 422 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr93Get() {
                this.GetValueTypeValues();
                return this.@__Expr93Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr93Set(string value) {
                
                #line 422 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr93Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr93Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr95GetTree() {
                
                #line 437 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr95Get() {
                
                #line 437 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr95Get() {
                this.GetValueTypeValues();
                return this.@__Expr95Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr95Set(string value) {
                
                #line 437 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr95Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr95Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext17_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext17_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext17_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext17_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr94GetTree() {
                
                #line 432 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr94Get() {
                
                #line 432 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr94Get() {
                this.GetValueTypeValues();
                return this.@__Expr94Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr96GetTree() {
                
                #line 442 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr96Get() {
                
                #line 442 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr96Get() {
                this.GetValueTypeValues();
                return this.@__Expr96Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext18 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext18(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext18(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext18(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr97GetTree() {
                
                #line 508 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr97Get() {
                
                #line 508 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr97Get() {
                this.GetValueTypeValues();
                return this.@__Expr97Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr97Set(string value) {
                
                #line 508 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr97Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr97Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr99GetTree() {
                
                #line 523 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr99Get() {
                
                #line 523 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr99Get() {
                this.GetValueTypeValues();
                return this.@__Expr99Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr99Set(string value) {
                
                #line 523 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr99Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr99Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext18_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext18_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext18_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext18_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr98GetTree() {
                
                #line 518 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr98Get() {
                
                #line 518 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr98Get() {
                this.GetValueTypeValues();
                return this.@__Expr98Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr100GetTree() {
                
                #line 528 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr100Get() {
                
                #line 528 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr100Get() {
                this.GetValueTypeValues();
                return this.@__Expr100Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext19 : ItService_TypedDataContext2 {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext19(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext19(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext19(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr101GetTree() {
                
                #line 551 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr101Get() {
                
                #line 551 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr101Get() {
                this.GetValueTypeValues();
                return this.@__Expr101Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr101Set(string value) {
                
                #line 551 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  CurrentUser = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr101Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr101Set(value);
                this.SetValueTypeValues();
            }
            
            internal System.Linq.Expressions.Expression @__Expr103GetTree() {
                
                #line 566 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  NextLink;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr103Get() {
                
                #line 566 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  NextLink;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr103Get() {
                this.GetValueTypeValues();
                return this.@__Expr103Get();
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public void @__Expr103Set(string value) {
                
                #line 566 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                
                                                                  NextLink = value;
                
                #line default
                #line hidden
            }
            
            public void ValueType___Expr103Set(string value) {
                this.GetValueTypeValues();
                this.@__Expr103Set(value);
                this.SetValueTypeValues();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2.Validate(locationReferences, false, offset);
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Activities", "4.0.0.0")]
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        private class ItService_TypedDataContext19_ForReadOnly : ItService_TypedDataContext2_ForReadOnly {
            
            private int locationsOffset;
            
            private static int expectedLocationsCount;
            
            public ItService_TypedDataContext19_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locations, System.Activities.ActivityContext activityContext, bool computelocationsOffset) : 
                    base(locations, activityContext, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext19_ForReadOnly(System.Collections.Generic.IList<System.Activities.Location> locations, bool computelocationsOffset) : 
                    base(locations, false) {
                if ((computelocationsOffset == true)) {
                    this.SetLocationsOffset((locations.Count - expectedLocationsCount));
                }
            }
            
            public ItService_TypedDataContext19_ForReadOnly(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences) : 
                    base(locationReferences) {
            }
            
            internal new static System.Activities.XamlIntegration.CompiledDataContext[] GetCompiledDataContextCacheHelper(object dataContextActivities, System.Activities.ActivityContext activityContext, System.Activities.Activity compiledRoot, bool forImplementation, int compiledDataContextCount) {
                return System.Activities.XamlIntegration.CompiledDataContext.GetCompiledDataContextCache(dataContextActivities, activityContext, compiledRoot, forImplementation, compiledDataContextCount);
            }
            
            public new virtual void SetLocationsOffset(int locationsOffsetValue) {
                locationsOffset = locationsOffsetValue;
                base.SetLocationsOffset(locationsOffset);
            }
            
            internal System.Linq.Expressions.Expression @__Expr102GetTree() {
                
                #line 561 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<string>> expression = () => 
                                                                  CurrentUser;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public string @__Expr102Get() {
                
                #line 561 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  CurrentUser;
                
                #line default
                #line hidden
            }
            
            public string ValueType___Expr102Get() {
                this.GetValueTypeValues();
                return this.@__Expr102Get();
            }
            
            internal System.Linq.Expressions.Expression @__Expr104GetTree() {
                
                #line 571 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                System.Linq.Expressions.Expression<System.Func<Apache.Models.WorkFlowInParameter>> expression = () => 
                                                                  WfIn;
                
                #line default
                #line hidden
                return base.RewriteExpressionTree(expression);
            }
            
            [System.Diagnostics.DebuggerHiddenAttribute()]
            public Apache.Models.WorkFlowInParameter @__Expr104Get() {
                
                #line 571 "C:\USERS\JSK\DESKTOP\APACHE_IT_V1.0.0_2015-7-29\APACHE\WORKFLOW\ITSERVICE.XAML"
                return 
                                                                  WfIn;
                
                #line default
                #line hidden
            }
            
            public Apache.Models.WorkFlowInParameter ValueType___Expr104Get() {
                this.GetValueTypeValues();
                return this.@__Expr104Get();
            }
            
            public new static bool Validate(System.Collections.Generic.IList<System.Activities.LocationReference> locationReferences, bool validateLocationCount, int offset) {
                if (((validateLocationCount == true) 
                            && (locationReferences.Count < 4))) {
                    return false;
                }
                if ((validateLocationCount == true)) {
                    offset = (locationReferences.Count - 4);
                }
                expectedLocationsCount = 4;
                return ItService_TypedDataContext2_ForReadOnly.Validate(locationReferences, false, offset);
            }
        }
    }
}
