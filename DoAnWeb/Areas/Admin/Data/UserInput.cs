using System.ComponentModel.DataAnnotations;
namespace DoAnWeb.Areas.Admin.Data
{
    public class UserInput
    {
        public string FullName { get; set; } = string.Empty;

        public string UserId { get; set; } = string.Empty;

        public int Age { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email address.")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Username is required.")]
        public string UserName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Password is required.")]
        [DataType(DataType.Password)]
        public string PasswordHash { get; set; } = string.Empty;

        [DataType(DataType.Password)]
        [Compare("PasswordHash", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; } = string.Empty;
        [Required(ErrorMessage = "Role is required.")]
        public string SelectedRole { get; set; } = string.Empty;
        public string SelectedWareHouse { get; set; } = string.Empty;
    }
}