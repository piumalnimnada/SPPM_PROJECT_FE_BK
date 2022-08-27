using ASP.NET_WebAPI6.DTO;
using ASP.NET_WebAPI6.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Org.BouncyCastle.Utilities.Net;
using System.Net;

namespace ASP.NET_WebAPI6.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BillingController : ControllerBase
    {
        private readonly DBContext DBContext;

        public BillingController(DBContext DBContext)
        {
            this.DBContext = DBContext;
        }

        [HttpGet("GetBillDetails")]
        public async Task<ActionResult<List<Billing>>> Get()
        {
            var List = await DBContext.Billings.Select(
                s => new Billing
                {
                    Id = s.Id,
                    FirstName = s.FirstName,
                    LastName = s.LastName,
                    CompanyName = s.CompanyName,
                    Address = s.Address,
                    Town = s.Town,
                    State = s.State,
                    PostCode = s.PostCode,
                    Email = s.Email,
                    Phone = s.Phone,
                    Notes = s.Notes,
                    User_id=s.User_id
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


        [HttpGet("GetBillDetailsById")]
        public async Task<ActionResult<Billing>> GetBillById(int Id)
        {
            Billing prod = await DBContext.Billings.Select(
                    s => new Billing
                    {
                        Id = s.Id,
                        FirstName = s.FirstName,
                        LastName = s.LastName,
                        CompanyName = s.CompanyName,
                        Address = s.Address,
                        Town = s.Town,
                        State = s.State,
                        PostCode = s.PostCode,
                        Email = s.Email,
                        Phone = s.Phone,
                        Notes = s.Notes,
                        User_id = s.User_id
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



        [HttpPost("InsertBillDetails")]
        public async Task<HttpStatusCode> InsertBill(Billing s)
        {
            var entity = new Billing()
            {

                Id = s.Id,
                FirstName = s.FirstName,
                LastName = s.LastName,
                CompanyName = s.CompanyName,
                Address = s.Address,
                Town = s.Town,
                State = s.State,
                PostCode = s.PostCode,
                Email = s.Email,
                Phone = s.Phone,
                Notes = s.Notes,
                User_id = s.User_id
            };

            DBContext.Billings.Add(entity);
            await DBContext.SaveChangesAsync();

            return HttpStatusCode.Created;
        }





        [HttpPut("UpdateBillDetails")]
        public async Task<HttpStatusCode> UpdateBill(Billing s)
        {
            var entity = await DBContext.Billings.FirstOrDefaultAsync(p => p.Id == s.Id);

            entity.Id = s.Id;
            entity.FirstName = s.FirstName;
            entity.LastName = s.LastName;
            entity.CompanyName = s.CompanyName;
            entity.Address = s.Address;
            entity.Town = s.Town;
            entity.State = s.State;
            entity.PostCode = s.PostCode;
            entity.Email = s.Email;
            entity.Phone = s.Phone;
            entity.Notes = s.Notes;
            entity.User_id = s.User_id;

            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

        [HttpDelete("DeleteBillDetails/{Id}")]
        public async Task<HttpStatusCode> DeleteBill(int Id)
        {
            var entity = new Billing()
            {
                Id = Id
            };
            DBContext.Billings.Attach(entity);
            DBContext.Billings.Remove(entity);
            await DBContext.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

    }
}

