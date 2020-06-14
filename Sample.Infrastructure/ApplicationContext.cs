using System;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Sample.Core.Common;
using Sample.Domain;
using Sample.Infrastructure.Identity;

namespace Sample.Infrastructure
{
    public class ApplicationContext : IdentityDbContext<User,Role,Guid>, IApplicationDbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
        {
           
        }

        public DbSet<Product> Products { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(builder:modelBuilder);
            modelBuilder.Seed();
        }
            
    }
}