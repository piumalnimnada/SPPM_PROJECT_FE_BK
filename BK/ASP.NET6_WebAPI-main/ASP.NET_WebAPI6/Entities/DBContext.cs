using Microsoft.EntityFrameworkCore;

namespace ASP.NET_WebAPI6.Entities
{
    public partial class DBContext : DbContext
    {
        public DBContext()
        {
        }

        public DBContext(DbContextOptions<DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Product> Products { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySQL("server=127.0.0.1;port=3306;user=root;password=;database=database");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(45);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("product");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Price)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.Stock)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.SalePrice)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.Discount)
                   .IsRequired()
                   .HasMaxLength(100);

                entity.Property(e => e.Pictures)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.ShortDetails)
                    .IsRequired();

                entity.Property(e => e.Description)
                    .IsRequired();
                entity.Property(e => e.Brand)
                  .IsRequired()
                  .HasMaxLength(100);

                entity.Property(e => e.NewPro)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.Sale)
                    .IsRequired()
                    .HasMaxLength(45);

                entity.Property(e => e.State)
                    .IsRequired()
                    .HasMaxLength(45);
                entity.Property(e => e.Category)
                 .IsRequired()
                 .HasMaxLength(45);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
