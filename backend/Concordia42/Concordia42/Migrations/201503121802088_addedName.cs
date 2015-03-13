namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addedName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String());
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String());
            DropColumn("dbo.StudentProfiles", "Name");
        }
        
        public override void Down()
        {
            AddColumn("dbo.StudentProfiles", "Name", c => c.String());
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "FirstName");
        }
    }
}
