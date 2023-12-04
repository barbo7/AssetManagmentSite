namespace AssetManagmentSite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MaintenanceRecord
    {
        public int MaintenanceRecordID { get; set; }

        public int AssetID { get; set; }

        public DateTime MaintenanceDate { get; set; }

        [Required]
        public string MaintenanceDetails { get; set; }

        public decimal MaintenanceCost { get; set; }
    }
}
