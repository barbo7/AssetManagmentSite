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
    
    public partial class MaintenanceRecord
    {
        public int MaintenanceRecordID { get; set; }
        public int AssetID { get; set; }
        public System.DateTime MaintenanceDate { get; set; }
        public string MaintenanceDetails { get; set; }
        public Nullable<decimal> MaintenanceCost { get; set; }
    }
}
