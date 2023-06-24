using Microsoft.AspNetCore.Mvc;
using PruebaTecnicaCreativa.DataAccess;

namespace PruebaTecnicaCreativa.Controllers
{
    public class PrestamoController:Controller
    {
        private readonly PruebaCreativaDbContext _db;

        public PrestamoController(PruebaCreativaDbContext db)
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
