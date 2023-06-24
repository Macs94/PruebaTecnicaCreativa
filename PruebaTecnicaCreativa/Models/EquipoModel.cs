namespace PruebaTecnicaCreativa.Models
{
    public class EquipoModel
    {
        public int IdEquipo { get; set; }
        public MarcaModel Marca { get; set; }
        public string NombreEquipo { get; set; }
        public string NumeroSerial { get; set; }
        public string Descripcion { get; set; } 
    }
}
