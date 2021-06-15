using Library_H4_TrashPlusPlus.Hashing;

namespace Library_H4_TrashPlusPlus.Hashing.Models
{
    class HashedUser : IHashedUser
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Salt { get; set; }
    }
}
