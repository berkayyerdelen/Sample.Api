using Microsoft.EntityFrameworkCore;
using Sample.Core.Common;
using Sample.Domain;

namespace Sample.Infrastructure
{
    public class ApplicationContext : DbContext, IApplicationDbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
    }
}