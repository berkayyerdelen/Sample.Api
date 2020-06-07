using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Sample.Domain;

namespace Sample.Infrastructure
{
    public static class Seeder
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>().HasData(new Product[]
            {
                new Product()
                {
                    Name = "MSI",
                    CreatedDate =DateTime.Now,
                    Id = 1
                },
                new Product()
                {
                    Name = "Dell",
                    CreatedDate = DateTime.Now,
                    Id = 2
                },
                new Product()
                {
                    Id = 3,
                    Name = "HP",
                    CreatedDate = DateTime.Now
                }
            });
        }
    }
}
