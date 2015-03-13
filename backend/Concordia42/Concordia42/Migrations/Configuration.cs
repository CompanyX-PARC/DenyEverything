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

            
            if (context == null)
            {
                throw new ArgumentNullException("context", "Context must not be null.");
            }

            string name;
          
            var adminRole = new IdentityRole { Name = "admin", Id = Guid.NewGuid().ToString() };
            context.Roles.Add(adminRole);

            var assistantRole = new IdentityRole { Name = "assistant", Id = Guid.NewGuid().ToString() };
            context.Roles.Add(assistantRole);

            var leaderRole = new IdentityRole { Name = "leader", Id = Guid.NewGuid().ToString() };
            context.Roles.Add(leaderRole);

            var studentRole = new IdentityRole { Name = "student", Id = Guid.NewGuid().ToString() };
            context.Roles.Add(studentRole);

            var verifiedRole = new IdentityRole { Name = "verified", Id = Guid.NewGuid().ToString() };
            context.Roles.Add(verifiedRole);

            var hasher = new PasswordHasher();

            name = "admin";
            var admin = new ApplicationUser
            {
                UserName = name,
                PasswordHash = hasher.HashPassword(name),
                Email = "admin@concordia.com",
                EmailConfirmed = true,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            admin.Roles.Add(new IdentityUserRole { RoleId = adminRole.Id, UserId = admin.Id });

            context.Users.Add(admin);

            name = "assistant";
            var assistant = new ApplicationUser
            {
                UserName = name,
                PasswordHash = hasher.HashPassword(name),
                Email = "assistant@concordia.com",
                EmailConfirmed = true,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            assistant.Roles.Add(new IdentityUserRole { RoleId = assistantRole.Id, UserId = assistant.Id });

            context.Users.Add(assistant);

            name = "leader";
            var leader = new ApplicationUser
            {
                UserName = name,
                PasswordHash = hasher.HashPassword(name),
                Email = "leader@concordia.com",
                EmailConfirmed = true,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            leader.Roles.Add(new IdentityUserRole { RoleId = leaderRole.Id, UserId = leader.Id });

            context.Users.Add(leader);

            name = "student";
            var student = new ApplicationUser
            {
                UserName = name,
                PasswordHash = hasher.HashPassword(name),
                Email = "student@concordia.com",
                EmailConfirmed = true,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            student.Roles.Add(new IdentityUserRole { RoleId = studentRole.Id, UserId = student.Id });

            context.Users.Add(student);

            base.Seed(context);
            
             
            /*
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(context));
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            var admin = new IdentityRole {Name = "admin", Id = Guid.NewGuid().ToString() };
            var leader = new IdentityRole {Name = "leader", Id = Guid.NewGuid().ToString() };
            var assistant = new IdentityRole {Name = "assistant", Id = Guid.NewGuid().ToString() };
            var student = new IdentityRole {Name = "student", Id = Guid.NewGuid().ToString() };
            var verified = new IdentityRole {Name = "verified", Id = Guid.NewGuid().ToString() };
          

            context.Roles.Add(admin);
            context.Roles.Add(leader);
            context.Roles.Add(assistant);
            context.Roles.Add(student);
            context.Roles.Add(verified);

            var User0 = new ApplicationUser() { FirstName = "student", LastName = "student", Email = "student@concordia.com", UserName = "student@concordia.com", Id = Guid.NewGuid().ToString() };
            var User1 = new ApplicationUser() { FirstName = "si", LastName = "si", Email = "si@concordia.com", UserName = "si@concordia.com", Id = Guid.NewGuid().ToString() };
            var User2 = new ApplicationUser() { FirstName = "staff", LastName = "staff", Email = "staff@concordia.com", UserName = "staff@concordia.com", Id = Guid.NewGuid().ToString() };
            var User3 = new ApplicationUser() { FirstName = "admin", LastName = "admin", Email = "admin@concordia.com", UserName = "admin@concordia.com", Id = Guid.NewGuid().ToString() };

            userManager.Create(User0, "concordia");
            userManager.Create(User1, "concordia");
            userManager.Create(User2, "concordia");
            userManager.Create(User3, "concordia");

            userManager.AddToRole(User0.Id, "student");
            userManager.AddToRole(User1.Id, "leader");
            userManager.AddToRole(User2.Id, "assistant");
            userManager.AddToRole(User3.Id, "admin");
            */



            context.Locations.AddOrUpdate(
                l => l.locName,
                new Location { locName = "Home" },
                new Location { locName = "PARC HQ"},
                new Location { locName = "Library"}
            );
            
            


        }
    }
}
