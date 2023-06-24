using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PruebaTecnicaCreativa.DataAccess;
using PruebaTecnicaCreativa.Models;

namespace PruebaTecnicaCreativa.Controllers
{
    public class MarcaController : Controller
    {
        private readonly PruebaCreativaDbContext _db;

        public MarcaController(PruebaCreativaDbContext db)
        {
            _db = db;
        }
        private IActionResult Index()
        {
            var marcas = _db.Marca.FromSqlRaw("EXEC spMarca_GetAll").ToList();

            var marcaModels = marcas.Select(m => new MarcaModel
            {
                IdMarca = m.IdMarca,
                NombreMarca = m.NombreMarca,
                Descripcion = m.Descripcion,
                TipoHerramientas = m.TipoHerramientas,
                Exactitud = m.Exactitud
            }).ToList();
            return View(marcaModels);
        }
        private IActionResult Create(MarcaModel marca)
        {
            var nombreMarcaParam = new SqlParameter("@NombreMarca", marca.NombreMarca);
            var descripcionParam = new SqlParameter("@Descripcion", marca.Descripcion);
            var tipoHerramientasParam = new SqlParameter("@TipoHerramientas", marca.TipoHerramientas);
            var exactitudParam = new SqlParameter("@Exactitud", marca.Exactitud);

            // Parámetro de salida para el ID generado
            var idParam = new SqlParameter("@id", SqlDbType.Int);
            idParam.Direction = ParameterDirection.Output;

            // Ejecución del procedimiento almacenado
            _db.Database.ExecuteSqlRaw("EXEC spMarca_Insert @NombreMarca, @Descripcion, @TipoHerramientas, @Exactitud, @id OUTPUT",
                nombreMarcaParam,
                descripcionParam,
                tipoHerramientasParam,
                exactitudParam,
                idParam);

            // Obtener el ID generado
            int idGenerado = Convert.ToInt32(idParam.Value);


            return RedirectToAction("Index");
        }
        private IActionResult Edit(MarcaModel marca) 
        {
            var idMarcaParameter = new SqlParameter("@IdMarca", marca.IdMarca);
            var nombreMarcaParameter = new SqlParameter("@NombreMarca", marca.NombreMarca);
            var descripcionParameter = new SqlParameter("@Descripcion", marca.Descripcion);
            var tipoHerramientasParameter = new SqlParameter("@TipoHerramientas", marca.TipoHerramientas);
            var exactitudParameter = new SqlParameter("@Exactitud", marca.Exactitud);

            _db.Database.ExecuteSqlRaw("EXEC spMarca_Edit @IdMarca, @NombreMarca, @Descripcion, @TipoHerramientas, @Exactitud",
                idMarcaParameter,
                nombreMarcaParameter,
                descripcionParameter,
                tipoHerramientasParameter,
                exactitudParameter);

            

            return RedirectToAction("Index");

        }
        private IActionResult Delete(int IdMarca) 
        {
            var idMarcaParameter = new SqlParameter("@IdMarca", IdMarca);

            _db.Database.ExecuteSqlRaw("EXEC spMarca_Delete @IdMarca", idMarcaParameter);

            

            return RedirectToAction("Index");
        }
    }
}
