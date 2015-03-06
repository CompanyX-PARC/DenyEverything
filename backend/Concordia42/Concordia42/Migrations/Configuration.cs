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
            var userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(context));

            roleManager.Create(new IdentityRole("admin"));
            roleManager.Create(new IdentityRole("assistant"));
            roleManager.Create(new IdentityRole("leader"));
            roleManager.Create(new IdentityRole("student"));
            roleManager.Create(new IdentityRole("verified"));

            context.Locations.AddOrUpdate(
                l => l.locName,
                new Location { locName = "Home" },
                new Location { locName = "PARC HQ"},
                new Location { locName = "Library"}
            );
            
            


        }
    }
}
