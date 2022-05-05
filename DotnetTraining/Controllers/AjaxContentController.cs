using Microsoft.AspNetCore.Mvc;

namespace DotnetTraining.Controllers
{
    public class AjaxContentController : Controller
    {
        public IActionResult HeaderCart()
        {
            return ViewComponent("HeaderCart");
        }
        public IActionResult HeaderFavourites()
        {
            return ViewComponent("HeaderCart");
        }
    }
}
