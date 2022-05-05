using AspNetCoreHero.ToastNotification.Abstractions;
using DotnetTraining.Extension;
using DotnetTraining.Models;
using DotnetTraining.ModelViews;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace DotnetTraining.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly dbEcommerceRookiesContext _context;
        public INotyfService _notifyService { get; }
        public ShoppingCartController(dbEcommerceRookiesContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }
        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }
        public IActionResult Checkout()
        {
            return View();
        }

        [HttpPost]
        [Route("api/cart/add")]
        public IActionResult AddToCart(int productID, int? amount)
        {
            List<CartItem> cart = GioHang;
            try
            {
                //Thêm vào giỏ hàng
                CartItem item = cart.SingleOrDefault(p => p.product.ProductId == productID);

                //Đã có -> cập nhật số lượng
                if (item != null)
                {
                        item.amount = item.amount + amount.Value;
                        //Lưu lại session
                        HttpContext.Session.Set<List<CartItem>>("GioHang", cart);
                }
                else
                {
                    Product hh = _context.Products.SingleOrDefault(p => p.ProductId == productID);
                    item = new CartItem
                    {
                        amount = amount.HasValue ? amount.Value : 1,
                        product = hh
                    };
                    cart.Add(item);//Thêm vào giỏ
                }

                //Lưu lại session
                HttpContext.Session.Set<List<CartItem>>("GioHang", cart);
                _notifyService.Success("Thêm sản phẩm thành công");
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }

        }
        [HttpPost]
        [Route("api/cart/update")]
        public IActionResult UpdateCart(int productID, int? amount)
        {
            //lay gio hang ra de xu ly
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            try
            {
                if (cart != null)
                {
                    CartItem item = cart.SingleOrDefault(p => p.product.ProductId == productID);
                    if(item != null && amount.HasValue) //đã có -> cập nhật số lượng
                    {
                        item.amount = amount.Value;
                    }
                    //Lưu lại sessison
                    HttpContext.Session.Set<List<CartItem>>("GioHang", cart);
                }
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        [Route("api/cart/remove")]
        public ActionResult Remove(int productID)
        {
            try
            {
                List<CartItem> gioHang = GioHang;
                CartItem item = gioHang.SingleOrDefault(p => p.product.ProductId == productID);
                if (item != null)
                {
                    gioHang.Remove(item);
                }
                //Lưu lại session
                HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }

        }

        [Route("cart.html", Name = "Cart")]
        public IActionResult Index()
        {
            //List<int> lsProductIDs = new List<int>();
            //var lsGioHang = GioHang;
            //foreach (var item in lsGioHang)
            //{
            //    lsProductIDs.Add(item.product.ProductId);
            //}
            //List<Product> lsProducts = _context.Products
            //    .OrderByDescending(x => x.ProductId)
            //    .Where(x => x.BestSellers == true && !lsProductIDs.Contains(x.ProductId))
            //    .Take(4)
            //    .ToList();
            //ViewBag.lsSanPham = lsProducts;
            return View(GioHang);
        }
    }
}
