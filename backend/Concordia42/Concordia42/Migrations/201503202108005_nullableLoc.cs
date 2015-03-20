namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class nullableLoc : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Activities", "locationId", "dbo.Locations");
            DropIndex("dbo.Activities", new[] { "locationId" });
            AlterColumn("dbo.Activities", "locationId", c => c.Int());
            CreateIndex("dbo.Activities", "locationId");
            AddForeignKey("dbo.Activities", "locationId", "dbo.Locations", "ID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Activities", "locationId", "dbo.Locations");
            DropIndex("dbo.Activities", new[] { "locationId" });
            AlterColumn("dbo.Activities", "locationId", c => c.Int(nullable: false));
            CreateIndex("dbo.Activities", "locationId");
            AddForeignKey("dbo.Activities", "locationId", "dbo.Locations", "ID", cascadeDelete: true);
        }
    }
}
