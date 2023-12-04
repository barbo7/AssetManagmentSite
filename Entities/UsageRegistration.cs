namespace AssetManagmentSite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class UsageRegistration
    {
        public int UsageRegistrationID { get; set; }

        public int AssetID { get; set; }

        public int PersonelID { get; set; }

        public DateTime UsageDateStart { get; set; }

        public DateTime UsageDateEnd { get; set; }

        [Required]
        [StringLength(50)]
        public string UsageRegistrationStatus { get; set; }
    }
}
