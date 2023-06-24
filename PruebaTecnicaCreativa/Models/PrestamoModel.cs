namespace PruebaTecnicaCreativa.Models
{
    public class PrestamoModel
    {
        public int IdPrestamo { get; set; }
        public string NombrePersona { get; set; }
        public EquipoModel Equipo { get; set; }
        public MarcaModel Marca { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Estado { get; set; }
    }
}
