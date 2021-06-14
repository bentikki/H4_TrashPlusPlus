using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Users.Models
{
    public class CreateUserRequest : IUser
    {
        public int Id { get; set; }

        [Required]
        public string Mail { get; set; }

        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

        public CreateUserRequest() { }

        public CreateUserRequest(string email, string username, string password)
        {
            Mail = email;
            Username = username;
            Password = password;
        }
    }
}
