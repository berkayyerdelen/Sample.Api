using System;
using System.Collections;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Sample.Domain;
using Sample.Infrastructure;

namespace SampleApi.IntegrationTests.Common
{
    public class ApplicationContextFactory
    {
        public static ApplicationContext Create()
        {
            var options = new DbContextOptionsBuilder<ApplicationContext>()
                .UseInMemoryDatabase(Guid.NewGuid().ToString()).UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking)
                .EnableSensitiveDataLogging().Options;

            var context = new ApplicationContext(options);
            context.Database.EnsureCreated();
            context.Products.AddRange(CreateProductsInMemory());           
            context.Products.AsNoTracking();           
            context.SaveChanges();

            return context;
        }

        public static void Destroy(ApplicationContext context)
        {
            context.Database.EnsureDeleted();
            context.Dispose();
        }

        public static ICollection<Product> CreateProductsInMemory()
        => new List<Product>()
        {
            new Product()
            {
                Id = 1,
                Name = "MSI",
                CreatedDate = DateTime.Now
            },
            new Product()
            {
                Id = 2,
                Name = "DELL",
                CreatedDate = DateTime.Now.AddDays(1)
            },
            new Product()
            {
                Id =3 ,
                Name = "Monster",
                CreatedDate =  DateTime.Now.AddDays(2)
            }
        };


    }
}