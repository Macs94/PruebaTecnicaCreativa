using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PruebaTecnicaCreativa.Migrations
{
    /// <inheritdoc />
    public partial class FirstMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Marca",
                columns: table => new
                {
                    IdMarca = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreMarca = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TipoHerramientas = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Exactitud = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Marca", x => x.IdMarca);
                });

            migrationBuilder.CreateTable(
                name: "Equipo",
                columns: table => new
                {
                    IdEquipo = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MarcaIdMarca = table.Column<int>(type: "int", nullable: false),
                    NombreEquipo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NumeroSerial = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Equipo", x => x.IdEquipo);
                    table.ForeignKey(
                        name: "FK_Equipo_Marca_MarcaIdMarca",
                        column: x => x.MarcaIdMarca,
                        principalTable: "Marca",
                        principalColumn: "IdMarca",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Prestamo",
                columns: table => new
                {
                    IdPrestamo = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombrePersona = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    EquipoIdEquipo = table.Column<int>(type: "int", nullable: false),
                    MarcaIdMarca = table.Column<int>(type: "int", nullable: false),
                    FechaInicio = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaFin = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Estado = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Prestamo", x => x.IdPrestamo);
                    table.ForeignKey(
                        name: "FK_Prestamo_Equipo_EquipoIdEquipo",
                        column: x => x.EquipoIdEquipo,
                        principalTable: "Equipo",
                        principalColumn: "IdEquipo",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Prestamo_Marca_MarcaIdMarca",
                        column: x => x.MarcaIdMarca,
                        principalTable: "Marca",
                        principalColumn: "IdMarca",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Equipo_MarcaIdMarca",
                table: "Equipo",
                column: "MarcaIdMarca");

            migrationBuilder.CreateIndex(
                name: "IX_Prestamo_EquipoIdEquipo",
                table: "Prestamo",
                column: "EquipoIdEquipo");

            migrationBuilder.CreateIndex(
                name: "IX_Prestamo_MarcaIdMarca",
                table: "Prestamo",
                column: "MarcaIdMarca");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Prestamo");

            migrationBuilder.DropTable(
                name: "Equipo");

            migrationBuilder.DropTable(
                name: "Marca");
        }
    }
}
