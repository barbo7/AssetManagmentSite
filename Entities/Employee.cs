namespace AssetManagmentSite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Employee
    {
        public int EmployeeID { get; set; }

        [Required]
        [StringLength(100)]
        public string EmployeeName { get; set; }

        [Required]
        [StringLength(100)]
        public string EmployeeDepartment { get; set; }

        [Required]
        [StringLength(50)]
        public string EmployeeRole { get; set; }

        [Required]
        [StringLength(200)]
        public string EmployeeDetails { get; set; }
    }
}
