using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZenExpressoCore.TaskFlows
{
   public class PlaceHolder
    {
      public  PlaceHolder()
      {
           resultIndex = -1;
           sequenceIndex = -1;
      }
        public string replaceText { get; set; }
        public int sequenceIndex { get; set; }
        public int resultIndex { get; set; }
        public string fieldName { get; set; }
    }
}
