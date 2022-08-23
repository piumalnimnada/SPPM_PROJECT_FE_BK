using System.ComponentModel.DataAnnotations;

namespace ASP.NET_WebAPI6.Entities
{
    public class Auth
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
