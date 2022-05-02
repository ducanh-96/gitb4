using DotnetTraining.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace DotnetTraining.Controllers
{
    public class ProductController : Controller
    {
        private readonly dbEcommerceRookiesContext _context;
        public ProductController(dbEcommerceRookiesContext context)
        {
            context= context;
        }
        
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Details(int id)
        {
            var product = _context.Products.Include(x => x.Cat).FirstOrDefault(x => x.ProductId == id);
            if (product == null)
            {
                return RedirectToAction("Index");
            }
            return View(product);
        }
    }
}
