using System;
using System.Collections.Generic;
using System.Text;

namespace ZenExpressoCore.Models
{
    public class FileUploadMeta
    {
        public int Id { get; set; } 
        public string SourceFileName { get; set; }
        public string DestFileName { get; set; }
        public string BatchId { get; set; }
        public bool Processed { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
