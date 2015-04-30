namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class officehour : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.OfficeHours",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Duration = c.Int(nullable: false),
                        Time = c.DateTime(nullable: false),
                        User_Id = c.String(maxLength: 128),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.AspNetUsers", t => t.User_Id)
                .Index(t => t.User_Id);
            
            CreateTable(
                "dbo.OfficeHourRepeats",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Repeat = c.Int(nullable: false),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(nullable: false),
                        OfficeHour_ID = c.Int(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.OfficeHours", t => t.OfficeHour_ID)
                .Index(t => t.OfficeHour_ID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.OfficeHours", "User_Id", "dbo.AspNetUsers");
            DropForeignKey("dbo.OfficeHourRepeats", "OfficeHour_ID", "dbo.OfficeHours");
            DropIndex("dbo.OfficeHourRepeats", new[] { "OfficeHour_ID" });
            DropIndex("dbo.OfficeHours", new[] { "User_Id" });
            DropTable("dbo.OfficeHourRepeats");
            DropTable("dbo.OfficeHours");
        }
    }
}
