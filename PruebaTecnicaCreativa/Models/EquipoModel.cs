using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaCreativa.Models
{
    public class EquipoModel
    {
        [Key]
        public int IdEquipo { get; set; }
        [Required(ErrorMessage = "La marca es obligatoria")]
        public MarcaModel Marca { get; set; }
        [Required(ErrorMessage = "El nombre del equipo es obligatorio")]
        public string NombreEquipo { get; set; }
        [Required(ErrorMessage = "El número de serie es obligatorio")]
        public string NumeroSerial { get; set; }
        public string Descripcion { get; set; } 
    }
}
