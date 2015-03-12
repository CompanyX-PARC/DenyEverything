namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class studentIdField : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "StudentId", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "StudentId");
        }
    }
}
