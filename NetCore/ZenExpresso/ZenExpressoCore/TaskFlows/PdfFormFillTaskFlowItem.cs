using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using iText.Forms;
using iText.IO.Font;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
   public class PdfFormFillTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        
       public PdfFormFillTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
       {} 
        public  TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;
            flowData = TaskFlowUtilities.InterpolateParams(flowData, inputList,"\\\"");
             Console.WriteLine("Before interpolate Params  +"+flowData);
            if (resultSequence.Any())
            {
                List<PlaceHolder> placeHolders = TaskFlowUtilities.ExtractPlaceHolders(flowData);
                flowData = TaskFlowUtilities.InterpolateSequenceParams(flowData, placeHolders, resultSequence); 
            }
            Console.WriteLine("After interpolate Params  +"+flowData);
            var jsonFlowData = JObject.Parse(flowData);
            var filePrefix = jsonFlowData["filePrefix"].ToStringOrEmpty();
            var fileDateFormat = jsonFlowData["fileDateFormat"].ToStringOrEmpty();
            var uploadsFolder =System.IO.Path.Combine(SettingsData.WebRootPath , "uploads");
            var pdfTemplateFile = System.IO.Path.Combine(uploadsFolder, "pdftemplate.pdf");//todo get pdf template location
            var inputMapStr = jsonFlowData["inputMap"].ToStringOrEmpty();
            var fontStylePath = System.IO.Path.Combine(SettingsData.WebRootPath,"fonts", "Roboto-Bold.ttf");
            try
            {
                if (string.IsNullOrEmpty(fileDateFormat))
                {
                    fileDateFormat = "yyyyMMdd";
                }
                Console.WriteLine("The inputMapStr +"+inputMapStr);
                var inputMap = JObject.Parse(inputMapStr);
                var fileName = filePrefix + Guid.NewGuid().ToString().Substring(0, 10) + "_" +
                               DateTime.Now.ToString(fileDateFormat) + ".pdf";
                var destFileName = System.IO.Path.Combine(uploadsFolder,fileName);
                ManipulatePdf(pdfTemplateFile, destFileName,inputList, inputMap,fontStylePath);
                response.status = "00";
                response.message = "Pdf File Successfully Generated";

                response.data = $"{SettingsData.HostUrl}/uploads/{fileName}";
            }
            catch (Exception ex)
            {
                response.status = "07";
                Logger.Error(this, ex);
                response.message = ex.Message;
            }
            return response;  
         }

        public void ManipulatePdf(string src, String dest, List<ScriptParameter> inputList,JObject fieldData,string fontPath)
        {

            PdfFont font = PdfFontFactory.CreateFont(fontPath, PdfEncodings.IDENTITY_H); 
            PdfDocument pdfDoc = new PdfDocument(new PdfReader(src), new PdfWriter(dest));
            PdfAcroForm form = PdfAcroForm.GetAcroForm(pdfDoc, true);  
            var fields = form.GetFormFields();
            foreach (var pdfFormField in fields)
            {
                 var fieldName = pdfFormField.Key;
                 string fieldValue = "";
                 fieldValue = fieldData[fieldName].ToStringOrEmpty();
                 if (string.IsNullOrEmpty(fieldValue))
                 {
                    var parameter = inputList.FirstOrDefault(x => x.parameterName == fieldName);
                    if (parameter != null)
                    {
                        fieldValue = parameter.parameterValue;
                    }
                 }
                 if (!string.IsNullOrEmpty(fieldValue))
                 {
                     pdfFormField.Value.SetValue(fieldValue, font, 12f);
                 } 
            }
            form.FlattenFields();
            pdfDoc.Close();
        }

    }
}
