//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AssetManagmentSite
{
    using System;
    using System.Collections.Generic;
    
    public partial class UsageRegistration
    {
        public int UsageRegistrationID { get; set; }
        public int AssetID { get; set; }
        public int PersonelID { get; set; }
        public System.DateTime UsageDateStart { get; set; }
        public System.DateTime UsageDateEnd { get; set; }
        public string UsageRegistrationStatus { get; set; }
    }
}