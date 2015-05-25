namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addedSubjectTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Subjects",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Department = c.String(),
                        Number = c.String(),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SubjectApplicationUsers",
                c => new
                    {
                        Subject_ID = c.Int(nullable: false),
                        ApplicationUser_Id = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.Subject_ID, t.ApplicationUser_Id })
                .ForeignKey("dbo.Subjects", t => t.Subject_ID, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.ApplicationUser_Id, cascadeDelete: true)
                .Index(t => t.Subject_ID)
                .Index(t => t.ApplicationUser_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.SubjectApplicationUsers", "ApplicationUser_Id", "dbo.AspNetUsers");
            DropForeignKey("dbo.SubjectApplicationUsers", "Subject_ID", "dbo.Subjects");
            DropIndex("dbo.SubjectApplicationUsers", new[] { "ApplicationUser_Id" });
            DropIndex("dbo.SubjectApplicationUsers", new[] { "Subject_ID" });
            DropTable("dbo.SubjectApplicationUsers");
            DropTable("dbo.Subjects");
        }
    }
}
