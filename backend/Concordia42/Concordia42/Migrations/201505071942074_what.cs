namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class what : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Appointments", "Profile_UserId", "dbo.StudentProfiles");
            DropIndex("dbo.Appointments", new[] { "Profile_UserId" });
            AddColumn("dbo.Appointments", "Tutee_Id", c => c.String(maxLength: 128));
            CreateIndex("dbo.Appointments", "Tutee_Id");
            AddForeignKey("dbo.Appointments", "Tutee_Id", "dbo.AspNetUsers", "Id");
            DropColumn("dbo.Appointments", "Profile_UserId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Appointments", "Profile_UserId", c => c.String(maxLength: 128));
            DropForeignKey("dbo.Appointments", "Tutee_Id", "dbo.AspNetUsers");
            DropIndex("dbo.Appointments", new[] { "Tutee_Id" });
            DropColumn("dbo.Appointments", "Tutee_Id");
            CreateIndex("dbo.Appointments", "Profile_UserId");
            AddForeignKey("dbo.Appointments", "Profile_UserId", "dbo.StudentProfiles", "UserId");
        }
    }
}
