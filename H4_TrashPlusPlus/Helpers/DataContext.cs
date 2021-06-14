using Microsoft.EntityFrameworkCore;
using ApiWithJwtRefreshToken.Entities;

namespace H4_TrashPlusPlus.Helpers
{
    public class DataContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
    }
}