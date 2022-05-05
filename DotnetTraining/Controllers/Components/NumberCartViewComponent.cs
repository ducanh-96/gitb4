using DotnetTraining.Extension;
using DotnetTraining.ModelViews;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace DotnetTraining.Controllers.Components
{
    public class NumberCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            
            return View(cart);
        }
    }
}
