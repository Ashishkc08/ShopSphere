using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ShopShere.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetProducts()
        {
            var products = new[]
            {
                new { Id = 1, Name = "Product A", Price = 100 },
                new { Id = 2, Name = "Product B", Price = 200 }
            };

            return Ok(products);  // Returns HTTP 200 with the products list
        }
        [HttpGet("{id}")]
        public IActionResult GetProduct(int id)
        {
            var product = new { Id = id, Name = $"Product {id}", Price = 100 * id };

            return Ok(product);  // Returns a single product based on the ID
        }
    }
}
