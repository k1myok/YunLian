//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CityService.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class schedual
    {
        public int ID { get; set; }
        public string HospName { get; set; }
        public string DepartName { get; set; }
        public string DoctorName { get; set; }
        public Nullable<System.DateTime> WorkDate { get; set; }
        public string WorkType { get; set; }
        public string WorkStatus { get; set; }
        public string ExpertFee { get; set; }
        public string Remark { get; set; }
    }
}
