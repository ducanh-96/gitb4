using AspNetCoreHero.ToastNotification;
using DotnetTraining.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using System.Threading.Tasks;

namespace DotnetTraining
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var stringConnectdb = Configuration.GetConnectionString("dbRookies");
            services.AddDbContext<dbEcommerceRookiesContext>(options => options.UseSqlServer(stringConnectdb));
            services.AddMvc();
            services.AddSession();
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                    .AddCookie(p =>
                    {
                        p.LoginPath = "/dang-nhap.html";
                        p.AccessDeniedPath = "/";
                    });
            services.AddDistributedMemoryCache();
            services.AddControllersWithViews().AddRazorRuntimeCompilation();
            services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));
            services.AddMemoryCache();
            services.AddResponseCompression();
            services.AddResponseCaching();
            services.AddSingleton<IFileProvider>(new PhysicalFileProvider(
                                               Path.Combine(Directory.GetCurrentDirectory(), "wwwroot")));
            services.AddMvc();
            services.AddNotyf(config => { config.DurationInSeconds = 5; config.IsDismissable = true; config.Position = NotyfPosition.BottomRight; });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSession();
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                  name: "areas",
                  pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
                );
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
