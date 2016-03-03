using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

  public class RegisterDB
{
      public RegisterDB()
      {
          this.RegisterDate = DateTime.Now;
          this.ClinicDate = DateTime.Now;
      }
    [DataMember]
      public int ID { get; set; }
    [DataMember]
    public string Name { get; set; }
    [DataMember]
    public string IDCard { get; set; }
    [DataMember]
    public string OpenId { get; set; }
    [DataMember]
    public string HospName { get; set; }
    [DataMember]
    public string DepartName { get; set; }
    [DataMember]
    public string DoctorName { get; set; }
    [DataMember]
    public string Phone { get; set; }
    [DataMember]
    public DateTime RegisterDate { get; set; }
    [DataMember]
    public DateTime ClinicDate { get; set; }
    [DataMember]
    public string StartTime { get; set; }
    [DataMember]
    public string EndTime { get; set; }
    [DataMember]
    public string RegisterFee { get; set; }
    [DataMember]
    public string SN { get; set; }
    [DataMember]
    public string Status { get; set; }
    [DataMember]
    public string DocRate { get; set; }
    [DataMember]
    public string Style { get; set; }
    [DataMember]
    public string ClinicSerialNo { get; set; }
    [DataMember]
    public string ClinicDateTime { get; set; }
}
