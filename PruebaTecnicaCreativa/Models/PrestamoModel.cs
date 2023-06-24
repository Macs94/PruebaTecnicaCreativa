using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaCreativa.Models
{
    public class PrestamoModel
    {
        [Key]
        public int IdPrestamo { get; set; }
        [Required(ErrorMessage = "El nombre de la persona es obligatorio")]
        public string NombrePersona { get; set; }

        [Required(ErrorMessage = "El equipo es obligatorio")]
        public EquipoModel Equipo { get; set; }

        [Required(ErrorMessage = "La marca es obligatoria")]
        public MarcaModel Marca { get; set; }
        [Required(ErrorMessage = "La fecha de inicio es obligatoria")]
        [Display(Name = "Fecha de inicio")]
        public DateTime FechaInicio { get; set; }
        [Required(ErrorMessage = "La fecha de fin es obligatoria")]
        [Display(Name = "Fecha de fin")]
        public DateTime FechaFin { get; set; }
        [Required(ErrorMessage = "El estado es obligatorio")]
        [RegularExpression("^(Activo|Inactivo)$", ErrorMessage = "El estado debe ser 'Activo' o 'Inactivo'")]
        public string Estado { get; set; }
    }
}
