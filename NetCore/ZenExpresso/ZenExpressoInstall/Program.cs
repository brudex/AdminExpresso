using System;
using System.IO;

namespace ZenExpressoInstall
{
    public class Program
    {
        static void Main(string[] args)
        {
            // var DEST = "C:\\developer\\zenithbank\\ZenExpresso\\NetCore\\ZenExpresso\\barCodePlacement.pdf";
            // FileInfo file = new FileInfo(DEST);
            // file.Directory.Create();
            // new ReplacePdfFile().ManipulatePdf4(DEST);
            // Console.WriteLine("Hello World!");

            var fileSrc = "C:\\developer\\zenithbank\\ZenExpresso\\NetCore\\ZenExpresso\\ZenExpresso\\wwwroot\\uploads\\pdftemplate.pdf";
            var fileDest = "C:\\developer\\zenithbank\\ZenExpresso\\NetCore\\ZenExpresso\\pdftemplate9.pdf";
            // FileInfo file = new FileInfo(DEST);
            // file.Directory.Create();
            Console.WriteLine("Start barcode replacement");
              ReplacePdfFile.SetBarCodeFormField(fileSrc,fileDest);
              Console.WriteLine("Completed barcode replacement");
            Console.ReadLine();
        }
    }
}
