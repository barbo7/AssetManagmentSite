namespace AssetManagmentSite.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class mig1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Assets",
                c => new
                    {
                        AssetID = c.Int(nullable: false, identity: true),
                        AssetName = c.String(nullable: false, maxLength: 100),
                        AssetBoughtDate = c.DateTime(nullable: false),
                        AssetPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        AssetStatus = c.String(nullable: false, maxLength: 50),
                        AssetLocation = c.String(nullable: false, maxLength: 100),
                    })
                .PrimaryKey(t => t.AssetID);
            
            CreateTable(
                "dbo.__MigrationHistory",
                c => new
                    {
                        MigrationId = c.String(nullable: false, maxLength: 150),
                        ContextKey = c.String(nullable: false, maxLength: 300),
                        Model = c.Binary(nullable: false),
                        ProductVersion = c.String(nullable: false, maxLength: 32),
                    })
                .PrimaryKey(t => new { t.MigrationId, t.ContextKey });
            
            CreateTable(
                "dbo.Employees",
                c => new
                    {
                        EmployeeID = c.Int(nullable: false, identity: true),
                        EmployeeName = c.String(nullable: false, maxLength: 100),
                        EmployeeDepartment = c.String(nullable: false, maxLength: 100),
                        EmployeeRole = c.String(nullable: false, maxLength: 50),
                        EmployeeDetails = c.String(nullable: false, maxLength: 200),
                    })
                .PrimaryKey(t => t.EmployeeID);
            
            CreateTable(
                "dbo.Inventory",
                c => new
                    {
                        ProductID = c.Int(nullable: false, identity: true),
                        ProductName = c.String(nullable: false, maxLength: 100),
                        ProductAmount = c.Int(nullable: false),
                        RecorderLevel = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID);
            
            CreateTable(
                "dbo.MaintenanceRecords",
                c => new
                    {
                        MaintenanceRecordID = c.Int(nullable: false, identity: true),
                        AssetID = c.Int(nullable: false),
                        MaintenanceDate = c.DateTime(nullable: false),
                        MaintenanceDetails = c.String(nullable: false),
                        MaintenanceCost = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.MaintenanceRecordID);
            
            CreateTable(
                "dbo.UsageRegistrations",
                c => new
                    {
                        UsageRegistrationID = c.Int(nullable: false, identity: true),
                        AssetID = c.Int(nullable: false),
                        PersonelID = c.Int(nullable: false),
                        UsageDateStart = c.DateTime(nullable: false),
                        UsageDateEnd = c.DateTime(nullable: false),
                        UsageRegistrationStatus = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.UsageRegistrationID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.UsageRegistrations");
            DropTable("dbo.MaintenanceRecords");
            DropTable("dbo.Inventory");
            DropTable("dbo.Employees");
            DropTable("dbo.__MigrationHistory");
            DropTable("dbo.Assets");
        }
    }
}
