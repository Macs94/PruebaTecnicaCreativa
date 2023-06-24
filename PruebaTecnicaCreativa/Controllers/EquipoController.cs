using Microsoft.AspNetCore.Mvc;
using PruebaTecnicaCreativa.DataAccess;

namespace PruebaTecnicaCreativa.Controllers
{
    public class EquipoController:Controller
    {
        private readonly PruebaCreativaDbContext _db;
        

        public EquipoController(PruebaCreativaDbContext db)
        {
            _db = db;
        }

        private IActionResult Create()
        {

            return View();
        }
        private IActionResult Edit(int id) { return View(); }
        private IActionResult Delete(int id) { return View(); }
    }
}
