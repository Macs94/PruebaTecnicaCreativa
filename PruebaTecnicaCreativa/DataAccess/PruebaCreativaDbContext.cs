using Microsoft.EntityFrameworkCore;
using PruebaTecnicaCreativa.Models;

namespace PruebaTecnicaCreativa.DataAccess
{
    public class PruebaCreativaDbContext : DbContext
    {
        public PruebaCreativaDbContext(DbContextOptions<PruebaCreativaDbContext> options) : base(options)
        {
        }

        public DbSet<MarcaModel> Marca { get; set; }
        public DbSet<EquipoModel> Equipo { get; set; }
        public DbSet<PrestamoModel> Prestamo { get; set; }
    }
}
