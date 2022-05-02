using Microsoft.AspNetCore.Mvc;

namespace DotnetTraining.Controllers
{
    public class BlogController : Controller
    {

        public IActionResult Index()
        {
            return View();
        }
    }
}
