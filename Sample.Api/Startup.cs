using System;
using System.IO;
using System.Reflection;
using AutoMapper;
using FluentValidation;
using FluentValidation.AspNetCore;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.PlatformAbstractions;
using Sample.Api.Infrastructure.Swagger;
using Sample.Core.Common;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.DeleteProduct.Validator;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct.Validator;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProductByName.Validator;
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Infrastructure;
using Sample.Infrastructure.Identity;
using Sample.Infrastructure.Identity.Domain.Commands.AddUserToRole;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp.Validator;
using Sample.Infrastructure.Identity.Domain.Queries.SignIn;
using Sample.Infrastructure.Identity.Mapper;
using Swashbuckle.AspNetCore.SwaggerGen;

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
            services.AddIdentity<User, Role>(options =>
                    {
                        options.Password.RequiredLength = 8;
                        options.Password.RequireNonAlphanumeric = false;
                        options.Password.RequireUppercase = true;
                        options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(1d);
                        options.Lockout.MaxFailedAccessAttempts = 5;
                        options.User.RequireUniqueEmail = true;
                    }).AddEntityFrameworkStores<ApplicationContext>().AddDefaultTokenProviders();
            services.AddScoped<IApplicationDbContext, ApplicationContext>();
            services.AddMvc().AddFluentValidation();

            services.AddTransient<IValidator<DeleteProductRequest>, DeleteProductValidator>();
            services.AddTransient<IValidator<UpsertProductRequest>, UpsertProductValidator>();
            services.AddTransient<IValidator<GetProductByNameRequest>, GetProductByNameValidator>();
            services.AddTransient<IValidator<SignUpRequest>, SignUpValidator>();


            services.AddMediatR(typeof(GetProductsRequestHandler));
            services.AddMediatR(typeof(DeleteProductRequestHandler));
            services.AddMediatR(typeof(UpsertProductRequestHandler));
            services.AddMediatR(typeof(GetProductByNameRequestHandler));
            services.AddMediatR(typeof(SignUpRequestHandler));
            services.AddMediatR(typeof(SignInRequestHandler));
            services.AddMediatR(typeof(AddUserToRoleRequestHandler));



            services.AddApiVersioning(o =>
            {
                o.DefaultApiVersion = new ApiVersion(1, 0);
                o.ReportApiVersions = true;
                o.ApiVersionReader = new HeaderApiVersionReader("x-monosign-api-version");
            });

            services.AddVersionedApiExplorer(
                options =>
                {
                    // add the versioned api explorer, which also adds IApiVersionDescriptionProvider service
                    // note: the specified format code will format the version as "'v'major[.minor][-status]"
                    options.GroupNameFormat = "'v'VVV";

                    // note: this option is only necessary when versioning by url segment. the SubstitutionFormat
                    // can also be used to control the format of the API version in route templates
                    options.SubstituteApiVersionInUrl = true;
                });

            services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();


            services.AddSwaggerGen(
                options =>
                {
                    // add a custom operation filter which sets default values
                    options.OperationFilter<SwaggerDefaultValues>();

                    // integrate xml comments
                    options.IncludeXmlComments(XmlCommentsFilePath);
                });


            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MapperProfile());
                mc.AddProfile(new IdentityMapperProfile());
            });

            var mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);
            services.AddControllers();
            ServiceTool.CreateService(services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IApiVersionDescriptionProvider provider)
        {

            if (env.IsDevelopment()) app.UseDeveloperExceptionPage();

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints => { endpoints.MapControllers(); });

            app.UseSwagger();
            app.UseSwaggerUI(
                options =>
                {
                    // build a swagger endpoint for each discovered API version
                    foreach (var description in provider.ApiVersionDescriptions)
                    {
                        options.SwaggerEndpoint($"/swagger/{description.GroupName}/swagger.json",
                            description.GroupName.ToUpperInvariant());
                    }
                });
        }

        static string XmlCommentsFilePath
        {
            get
            {
                var basePath = PlatformServices.Default.Application.ApplicationBasePath;
                var fileName = typeof(Startup).GetTypeInfo().Assembly.GetName().Name + ".xml";
                return Path.Combine(basePath, fileName);
            }
        }
    }
}