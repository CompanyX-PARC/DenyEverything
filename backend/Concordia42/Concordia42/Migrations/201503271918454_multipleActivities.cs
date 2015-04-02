namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class multipleActivities : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Activities", "UserId", "dbo.AspNetUsers");
            DropPrimaryKey("dbo.Activities");
            AddColumn("dbo.Activities", "ActivityId", c => c.Int(nullable: false, identity: true));
            AddColumn("dbo.Activities", "sessionId", c => c.String());
            AddPrimaryKey("dbo.Activities", "ActivityId");
            AddForeignKey("dbo.Activities", "UserId", "dbo.AspNetUsers", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Activities", "UserId", "dbo.AspNetUsers");
            DropPrimaryKey("dbo.Activities");
            DropColumn("dbo.Activities", "sessionId");
            DropColumn("dbo.Activities", "ActivityId");
            AddPrimaryKey("dbo.Activities", "UserId");
            AddForeignKey("dbo.Activities", "UserId", "dbo.AspNetUsers", "Id");
        }
    }
}
