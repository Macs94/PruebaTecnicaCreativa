using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace PruebaTecnicaCreativa.Models
{
    public class MarcaModel
    {
        [Key]
        public int IdMarca { get; set; }

        [Required(ErrorMessage = "El nombre de la marca es obligatorio")]
        public string NombreMarca { get; set; }
        public string Descripcion { get; set; }
        [Required(ErrorMessage = "El tipo de herramienta es obligatorio")]
        [TipoHerramientas(ErrorMessage = "El tipo de herramienta debe ser 'Cableado', 'Pinzas' o 'Registradores'")]
        public string TipoHerramientas { get; set; }
        public decimal? Exactitud { get; set; }

        private class TipoHerramientasAttribute : ValidationAttribute
        {
            protected override ValidationResult IsValid(object value, ValidationContext validationContext)
            {
                var tipoHerramientas = value as string;
                if (tipoHerramientas != null)
                {
                    if (tipoHerramientas != "Cableado" && tipoHerramientas != "Pinzas" && tipoHerramientas != "Registradores")
                    {
                        return new ValidationResult("El tipo de herramienta debe ser 'Cableado', 'Pinzas' o 'Registradores'");
                    }
                }
                return ValidationResult.Success;
            }
        }
    }
}
