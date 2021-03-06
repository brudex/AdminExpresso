using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.CodeAnalysis.FlowAnalysis;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using ZenExpresso.Data;
using ZenExpresso.Helpers;
using ZenExpresso.Models;
using ZenExpressoCore;

namespace ZenExpresso
{
    public class Startup
    {
        private IWebHostEnvironment _env;
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            _env = env;

        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            if (_env.IsDevelopment())
            {
                services.AddRazorPages()
                .AddRazorRuntimeCompilation();
            }
            services.AddControllersWithViews().AddNewtonsoftJson();
             var connectionString = Configuration.GetConnectionString("DefaultConnection");
             services.AddDbContext<ApplicationDbContext>(options =>
              options.UseSqlServer(connectionString));
           
            
            services.Configure<IdentityOptions>(options =>
            {
                //Password settings
                options.Password.RequireDigit = true;
                options.Password.RequiredLength = 8;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = true;
                options.Password.RequireLowercase = false;
                options.Password.RequiredUniqueChars = 6;
                //Lockout settings
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30);
                options.Lockout.MaxFailedAccessAttempts = 10;
                options.Lockout.AllowedForNewUsers = false;
                //User settings
                options.User.RequireUniqueEmail = true;
                options.SignIn.RequireConfirmedEmail = false;
            });
            services.ConfigureApplicationCookie(options =>
            {
                // Cookie settings
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromDays(150);
                options.Cookie.IsEssential = true;
                // If the LoginPath isn't set, ASP.NET Core defaults 
                // the path to /Account/Login.
                options.LoginPath = "/Account/Login";
                // If the AccessDeniedPath isn't set, ASP.NET Core defaults 
                // the path to /Account/AccessDenied.
                options.AccessDeniedPath = "/Account/AccessDenied";
                // options.SlidingExpiration = true;
            });
            
            services.AddIdentity<ApplicationUser, IdentityRole>(options => {
                options.User.AllowedUserNameCharacters = null;
            }).AddClaimsPrincipalFactory<CustomClaimsPrincipalFactory>()
             .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            services.AddAuthentication(o =>
            {
                o.DefaultScheme = IdentityConstants.ApplicationScheme;
                //o.DefaultSignInScheme = IdentityConstants.ExternalScheme;
            });
            // Add application services.
            if (_env.IsProduction())
            {
                 services.AddDataProtection()
                .SetApplicationName("AdminExpresso");
                //.PersistKeysToFileSystem(new System.IO.DirectoryInfo(@"/var/www/dashboard.cedix/keys"));
            }

            services.AddHttpContextAccessor();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            var settings = Configuration.GetSection("SettingsData").GetChildren()
                .Select(item => new KeyValuePair<string, string>(item.Key, item.Value)).ToDictionary(x => x.Key, x => x.Value); ;
            SettingsData.DefaultConnection = connectionString;
            SettingsData.Initialize(settings);
            SettingsData.WebRootPath = _env.WebRootPath;
            
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            var dbInitialized = true;
            SettingsData.AspNetEnv = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
            loggerFactory.AddLog4Net();
            app.UseStaticFiles();
            if (InitializeDatabase.DbInitialized())
            {
                SettingsData.DbInitialzed = true;
            }
            else
            {
                dbInitialized = false;
                SettingsData.DbInitialzed = false; 
            }
            app.UseCookiePolicy();
            Logger.EnsureInitialized();
            //app.UseHttpsRedirection();
            app.UseStatusCodePagesWithReExecute("/error/{0}");
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
            if (dbInitialized)
            {
                SettingsData.SetInstallSettings();
                var superAdmin = AppInstallHandler.GetInitialAdmin();
                if (superAdmin != null)
                {
                    var adminPass = AppInstallHandler.GetAdminInitialPassword();
                    if (!string.IsNullOrEmpty(adminPass))
                    {
                        SettingsData.SuperAdminCreationPending = true;
                    }
                }
                MemDb.Instance.Init();
            } 
          
        }
    }
}
