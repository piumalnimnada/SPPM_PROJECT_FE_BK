using Microsoft.AspNetCore.Mvc;
using ASP.NET_WebAPI6.DTO;
using ASP.NET_WebAPI6.Entities;
using Microsoft.EntityFrameworkCore;
using System.Net;
using System.Xml.Linq;

namespace ASP.NET_WebAPI6.Controllers
{
    [ApiController]
    [Route("api/[controller]")]

    public class ProductController : ControllerBase
    {
        private readonly DBContext DBContext;

        public ProductController(DBContext DBContext)
        {
            this.DBContext = DBContext;
        }

        [HttpGet("GetProducts")]
        public async Task<ActionResult<List<ProductDTO>>> Get()
        {
            var List = await DBContext.Products.Select(
                s => new ProductDTO
                {
                    Id = s.Id,
                    Name = s.Name,
                    Price = s.Price,
                    Stock = s.Stock,
                    SalePrice = s.SalePrice,
                    Discount = s.Discount,
                    Pictures = s.Pictures,
                    ShortDetails = s.ShortDetails,
                    Description = s.Description,
                    Brand = s.Brand,
                    Sale = s.Sale,
                    State = s.State,
                    Category = s.Category,
                }
            ).ToListAsync();

            if (List.Count < 0)
            {
                return NotFound();
            }
            else
            {
                return List;
            }
        }


        [HttpGet("GetProductById")]
        public async Task<ActionResult<ProductDTO>> GetUserById(int Id)
        {
            ProductDTO prod = await DBContext.Products.Select(
                    s => new ProductDTO
                    {

                        Id = s.Id,
                        Name = s.Name,
                        Price = s.Price,
                        Stock = s.Stock,
                        SalePrice = s.SalePrice,
                        Discount = s.Discount,
                        Pictures = s.Pictures,
                        ShortDetails = s.ShortDetails,
                        Description = s.Description,
                        Brand = s.Brand,
                        Sale = s.Sale,
                        State = s.State,
                        Category = s.Category,
                    })
                .FirstOrDefaultAsync(s => s.Id == Id);

            if (prod == null)
            {
                return NotFound();
            }
            else
            {
                return prod;
            }
        }



        [HttpPost("InsertProduct")]
        public async Task<HttpStatusCode> InsertUser(ProductDTO s)
        {
            var entity = new Product()
            {

                Id = s.Id,
                Name = s.Name,
                Price = s.Price,
                Stock = s.Stock,
                SalePrice = s.SalePrice,
                Discount = s.Discount,
                Pictures = s.Pictures,
                ShortDetails = s.ShortDetails,
                Description = s.Description,
                Brand = s.Brand,
                Sale = s.Sale,
                State = s.State,
                Category = s.Category,
            };

            DBContext.Products.Add(entity);
            await DBContext.SaveChangesAsync();

            return HttpStatusCode.Created;
        }





        [HttpPut("UpdateProduct")]
        public async Task<HttpStatusCode> UpdateUser(ProductDTO s)
        {
            var entity = await DBContext.Products.FirstOrDefaultAsync(p => p.Id == s.Id);


            entity.Id = s.Id;
            entity.Name = s.Name;
            entity.Price = s.Price;
            entity.Stock = s.Stock;
            entity.SalePrice = s.SalePrice;
            entity.Discount = s.Discount;
            entity.Pictures = s.Pictures;
            entity.ShortDetails = s.ShortDetails;
            entity.Description = s.Description;
            entity.Brand = s.Brand;
            entity.Sale = s.Sale;
            entity.State = s.State;
            entity.Category = s.Category;

            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

        [HttpDelete("DeleteProduct/{Id}")]
        public async Task<HttpStatusCode> DeleteUser(int Id)
        {
            var entity = new Product()
            {
                Id = Id
            };
            DBContext.Products.Attach(entity);
            DBContext.Products.Remove(entity);
            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

    }
}
