namespace AssetManagmentSite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Asset
    {
        public int AssetID { get; set; }

        [Required]
        [StringLength(100)]
        public string AssetName { get; set; }

        public DateTime AssetBoughtDate { get; set; }

        public decimal AssetPrice { get; set; }

        [Required]
        [StringLength(50)]
        public string AssetStatus { get; set; }

        [Required]
        [StringLength(100)]
        public string AssetLocation { get; set; }
    }
}
