namespace Concordia42.Migrations
{
    using Concordia42.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Concordia42.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(Concordia42.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            // http://stackoverflow.com/questions/27498921/creating-asp-net-identity-user-in-seed-method-of-db-initializer
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            var User0 = new ApplicationUser() { FirstName = "student", LastName = "student", Email = "student@concordia.com", UserName = "student@concordia.com"};
            var User1 = new ApplicationUser() { FirstName = "si", LastName = "si", Email = "si@concordia.com", UserName = "si@concordia.com" };
            var User2 = new ApplicationUser() { FirstName = "staff", LastName = "staff", Email = "staff@concordia.com", UserName = "staff@concordia.com" };
            var User3 = new ApplicationUser() { FirstName = "admin", LastName = "admin", Email = "admin@concordia.com", UserName = "admin@concordia.com" };

            userManager.Create(User0, "concordia");
            userManager.Create(User1, "concordia");
            userManager.Create(User2, "concordia");
            userManager.Create(User3, "concordia");

            roleManager.Create(new IdentityRole("admin"));
            roleManager.Create(new IdentityRole("assistant"));
            roleManager.Create(new IdentityRole("leader"));
            roleManager.Create(new IdentityRole("student"));
            roleManager.Create(new IdentityRole("verified"));

            userManager.AddToRole(User0.Id, "student");
            userManager.AddToRole(User1.Id, "leader");
            userManager.AddToRole(User2.Id, "assistant");
            userManager.AddToRole(User3.Id, "admin");




            context.Locations.AddOrUpdate(
                l => l.locName,
                new Location { locName = "Home" },
                new Location { locName = "PARC HQ"},
                new Location { locName = "Library"}
            );
            
            


        }
    }
}
