namespace Concordia42.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class whatever : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.SubjectApplicationUsers", "Subject_ID", "dbo.Subjects");
            DropForeignKey("dbo.SubjectApplicationUsers", "ApplicationUser_Id", "dbo.AspNetUsers");
            DropIndex("dbo.SubjectApplicationUsers", new[] { "Subject_ID" });
            DropIndex("dbo.SubjectApplicationUsers", new[] { "ApplicationUser_Id" });
            CreateTable(
                "dbo.SubjectUsers",
                c => new
                    {
                        UserID = c.String(nullable: false, maxLength: 128),
                        SubjectID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserID, t.SubjectID })
                .ForeignKey("dbo.Subjects", t => t.SubjectID, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.UserID, cascadeDelete: true)
                .Index(t => t.UserID)
                .Index(t => t.SubjectID);
            
            DropTable("dbo.SubjectApplicationUsers");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.SubjectApplicationUsers",
                c => new
                    {
                        Subject_ID = c.Int(nullable: false),
                        ApplicationUser_Id = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.Subject_ID, t.ApplicationUser_Id });
            
            DropForeignKey("dbo.SubjectUsers", "UserID", "dbo.AspNetUsers");
            DropForeignKey("dbo.SubjectUsers", "SubjectID", "dbo.Subjects");
            DropIndex("dbo.SubjectUsers", new[] { "SubjectID" });
            DropIndex("dbo.SubjectUsers", new[] { "UserID" });
            DropTable("dbo.SubjectUsers");
            CreateIndex("dbo.SubjectApplicationUsers", "ApplicationUser_Id");
            CreateIndex("dbo.SubjectApplicationUsers", "Subject_ID");
            AddForeignKey("dbo.SubjectApplicationUsers", "ApplicationUser_Id", "dbo.AspNetUsers", "Id", cascadeDelete: true);
            AddForeignKey("dbo.SubjectApplicationUsers", "Subject_ID", "dbo.Subjects", "ID", cascadeDelete: true);
        }
    }
}
