using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ZenExpresso
{
    public class Program
    {
        private static CancellationTokenSource cts = new CancellationTokenSource();
        private static string[] _args;
        private static bool _restartRequest;
        // public static void Main(string[] args)
        // {
        //     CreateHostBuilder(args).Build().Run();
        // }


        public static void Main(string[] args)
        {
            _args = args;
            StartServer();
            while (_restartRequest)
            {
                _restartRequest = false;
                Console.WriteLine("Restarting App");
                StartServer();
            }
        }

        public static void Restart()
        {
            _restartRequest = true;
            cts.Cancel();
        }

        private static void StartServer()
        {
            try
            {
                cts = new CancellationTokenSource();
                var host = CreateHostBuilder(_args).Build();
                host.RunAsync(cts.Token).GetAwaiter().GetResult();
            }
            catch (OperationCanceledException e)
            {
                Console.WriteLine(e);
            }
        }
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
