﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using PruebaTecnicaCreativa.DataAccess;

#nullable disable

namespace PruebaTecnicaCreativa.Migrations
{
    [DbContext(typeof(PruebaCreativaDbContext))]
    [Migration("20230624045738_FirstMigration")]
    partial class FirstMigration
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("PruebaTecnicaCreativa.Models.EquipoModel", b =>
                {
                    b.Property<int>("IdEquipo")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdEquipo"));

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("MarcaIdMarca")
                        .HasColumnType("int");

                    b.Property<string>("NombreEquipo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NumeroSerial")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdEquipo");

                    b.HasIndex("MarcaIdMarca");

                    b.ToTable("Equipo");
                });

            modelBuilder.Entity("PruebaTecnicaCreativa.Models.MarcaModel", b =>
                {
                    b.Property<int>("IdMarca")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdMarca"));

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal?>("Exactitud")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("NombreMarca")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("TipoHerramientas")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdMarca");

                    b.ToTable("Marca");
                });

            modelBuilder.Entity("PruebaTecnicaCreativa.Models.PrestamoModel", b =>
                {
                    b.Property<int>("IdPrestamo")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdPrestamo"));

                    b.Property<int>("EquipoIdEquipo")
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("FechaFin")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("FechaInicio")
                        .HasColumnType("datetime2");

                    b.Property<int>("MarcaIdMarca")
                        .HasColumnType("int");

                    b.Property<string>("NombrePersona")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdPrestamo");

                    b.HasIndex("EquipoIdEquipo");

                    b.HasIndex("MarcaIdMarca");

                    b.ToTable("Prestamo");
                });

            modelBuilder.Entity("PruebaTecnicaCreativa.Models.EquipoModel", b =>
                {
                    b.HasOne("PruebaTecnicaCreativa.Models.MarcaModel", "Marca")
                        .WithMany()
                        .HasForeignKey("MarcaIdMarca")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Marca");
                });

            modelBuilder.Entity("PruebaTecnicaCreativa.Models.PrestamoModel", b =>
                {
                    b.HasOne("PruebaTecnicaCreativa.Models.EquipoModel", "Equipo")
                        .WithMany()
                        .HasForeignKey("EquipoIdEquipo")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("PruebaTecnicaCreativa.Models.MarcaModel", "Marca")
                        .WithMany()
                        .HasForeignKey("MarcaIdMarca")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Equipo");

                    b.Navigation("Marca");
                });
#pragma warning restore 612, 618
        }
    }
}
