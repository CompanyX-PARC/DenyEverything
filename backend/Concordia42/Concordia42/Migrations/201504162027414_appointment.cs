namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class appointment : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Appointments",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        ShowedUp = c.Boolean(nullable: false),
                        Duration = c.Int(nullable: false),
                        StartDate = c.DateTime(nullable: false),
                        Comment = c.String(),
                        Profile_UserId = c.String(maxLength: 128),
                        Subject_ID = c.Int(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.StudentProfiles", t => t.Profile_UserId)
                .ForeignKey("dbo.Subjects", t => t.Subject_ID)
                .Index(t => t.Profile_UserId)
                .Index(t => t.Subject_ID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Appointments", "Subject_ID", "dbo.Subjects");
            DropForeignKey("dbo.Appointments", "Profile_UserId", "dbo.StudentProfiles");
            DropIndex("dbo.Appointments", new[] { "Subject_ID" });
            DropIndex("dbo.Appointments", new[] { "Profile_UserId" });
            DropTable("dbo.Appointments");
        }
    }
}
