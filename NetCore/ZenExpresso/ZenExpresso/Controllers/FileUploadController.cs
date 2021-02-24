using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    public class FileUploadController : Controller
    {
        private readonly IWebHostEnvironment _hostEnvironment;
        public FileUploadController(IWebHostEnvironment hostEnvironment)
        {
            _hostEnvironment = hostEnvironment;
        }

        [HttpPost]
        public async Task<ActionResult> Index(IList<IFormFile> files)
        {
            var response = new ServiceResponse();
            response.status = "00";
            response.message = Guid.NewGuid().ToString();
            var fileList = new List<FileUploadMeta>();
            foreach (IFormFile source in files)
            {
                var upload = new FileUploadMeta();
                string filename = ContentDispositionHeaderValue.Parse(source.ContentDisposition).FileName.Trim('"');
                filename = System.IO.Path.GetFileName(filename);
                upload.SourceFileName = filename;
                upload.DestFileName = $"{Guid.NewGuid().ToString()}{System.IO.Path.GetExtension(filename)}";
                upload.CreatedAt = DateTime.Now;
                upload.BatchId = response.message;
                await using (FileStream output = System.IO.File.Create(this.GetPathAndFilename(upload.DestFileName)))
                {
                    await source.CopyToAsync(output);
                }
                fileList.Add(upload); 
            } 
          
            return Ok(response);
        }

        private string EnsureCorrectFilename(string filename)
        {
            if (filename.Contains("\\"))
                filename = filename.Substring(filename.LastIndexOf("\\") + 1);
            return filename;
        }

        private string GetPathAndFilename(string filename)
        {
            return _hostEnvironment.WebRootPath + "\\uploads\\" + filename;
        }
    }
}
