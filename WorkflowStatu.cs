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
    
    public partial class WorkflowStatu
    {
        public int WorkflowStatusID { get; set; }
        public int WorkFlowID { get; set; }
        public string Step { get; set; }
        public string AssignedTo { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> CompletedDate { get; set; }
    
        public virtual Workflow Workflow { get; set; }
    }
}
