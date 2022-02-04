using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using CliWrap;

namespace ZenExpressoCore.LanguageEngines
{
    public class PackageManager
    {

        public static async Task<int> InstallNodePackage(string packageName, string version)
        {
            string execPath = @"C:\developer\zenithbank\ZenExpresso\ZenExpressoCoreTest\bin\Debug\netcoreapp3.1\";
            string installCmd = "install --save";
            if (!string.IsNullOrEmpty(version))
            {
                installCmd = $"{packageName}@{version} --save";
            }
            
            var result = await Cli.Wrap("npm")
                    .WithCredentials(creds => creds
                         .SetUserName("brudex")
                        .SetPassword("star1905staS"))
                .WithArguments(installCmd)
                
                .WithWorkingDirectory(execPath)
                .ExecuteAsync();
            return result.ExitCode;
        }
    }
}
