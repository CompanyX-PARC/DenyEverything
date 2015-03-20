namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class activityTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Activities",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        lastAction = c.DateTime(nullable: false),
                        whenLoggedIn = c.DateTime(nullable: false),
                        currentLocation_ID = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Locations", t => t.currentLocation_ID)
                .Index(t => t.currentLocation_ID);
            
            AddColumn("dbo.AspNetUsers", "activity_Id", c => c.Int());
            CreateIndex("dbo.AspNetUsers", "activity_Id");
            AddForeignKey("dbo.AspNetUsers", "activity_Id", "dbo.Activities", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AspNetUsers", "activity_Id", "dbo.Activities");
            DropForeignKey("dbo.Activities", "currentLocation_ID", "dbo.Locations");
            DropIndex("dbo.Activities", new[] { "currentLocation_ID" });
            DropIndex("dbo.AspNetUsers", new[] { "activity_Id" });
            DropColumn("dbo.AspNetUsers", "activity_Id");
            DropTable("dbo.Activities");
        }
    }
}
