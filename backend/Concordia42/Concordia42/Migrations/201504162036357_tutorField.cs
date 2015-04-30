namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tutorField : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Appointments", "Tutor_Id", c => c.String(maxLength: 128));
            CreateIndex("dbo.Appointments", "Tutor_Id");
            AddForeignKey("dbo.Appointments", "Tutor_Id", "dbo.AspNetUsers", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Appointments", "Tutor_Id", "dbo.AspNetUsers");
            DropIndex("dbo.Appointments", new[] { "Tutor_Id" });
            DropColumn("dbo.Appointments", "Tutor_Id");
        }
    }
}
