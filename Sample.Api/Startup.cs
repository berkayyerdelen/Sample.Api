using AutoMapper;
using FluentValidation;
using FluentValidation.AspNetCore;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Sample.Core.Common;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.DeleteProduct.Validator;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct.Validator;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProductByName.Validator;
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Infrastructure;

namespace Sample.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var connectionString = Configuration.GetValue<string>("ConnectionString");
            services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(connectionString));

            //services.AddScoped<IApplicationDbContext>(x => x.GetService<ApplicationContext>());
            services.AddScoped<IApplicationDbContext, ApplicationContext>();           
            services.AddMvc().AddFluentValidation();

            services.AddTransient<IValidator<DeleteProductRequest>, DeleteProductValidator>();
            services.AddTransient<IValidator<UpsertProductRequest>, UpsertProductValidator>();
            services.AddTransient<IValidator<GetProductByNameRequest>, GetProductByNameValidator>();

            services.AddMediatR(typeof(GetProductsRequestHandler));
            services.AddMediatR(typeof(DeleteProductRequestHandler));
            services.AddMediatR(typeof(UpsertProductRequestHandler));
            services.AddMediatR(typeof(GetProductByNameRequestHandler));

            services.AddApiVersioning(config =>
            {
                // Specify the default API Version
                config.DefaultApiVersion = new ApiVersion(1, 0);
                // If the client hasn't specified the API version in the request, use the default API version number 
                config.AssumeDefaultVersionWhenUnspecified = true;
                // Advertise the API versions supported for the particular endpoint
                config.ReportApiVersions = true;
                // Versioning using media type
                //config.ApiVersionReader = new MediaTypeApiVersionReader("v");
                // Supporting multiple versioning scheme
                //config.ApiVersionReader = ApiVersionReader.Combine(new HeaderApiVersionReader("X-version"), new QueryStringApiVersionReader("api-version"));
            });


            var mappingConfig = new MapperConfiguration(mc => { mc.AddProfile(new MapperProfile()); });

            var mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment()) app.UseDeveloperExceptionPage();

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints => { endpoints.MapControllers(); });
        }
    }
}