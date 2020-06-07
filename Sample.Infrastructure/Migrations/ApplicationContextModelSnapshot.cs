﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Sample.Infrastructure;

namespace Sample.Infrastructure.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    partial class ApplicationContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.3")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Sample.Domain.Product", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Products");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            CreatedDate = new DateTime(2020, 6, 7, 21, 46, 53, 537, DateTimeKind.Local).AddTicks(6426),
                            Name = "MSI"
                        },
                        new
                        {
                            Id = 2,
                            CreatedDate = new DateTime(2020, 6, 7, 21, 46, 53, 537, DateTimeKind.Local).AddTicks(7794),
                            Name = "Dell"
                        },
                        new
                        {
                            Id = 3,
                            CreatedDate = new DateTime(2020, 6, 7, 21, 46, 53, 537, DateTimeKind.Local).AddTicks(7815),
                            Name = "HP"
                        });
                });
#pragma warning restore 612, 618
        }
    }
}
