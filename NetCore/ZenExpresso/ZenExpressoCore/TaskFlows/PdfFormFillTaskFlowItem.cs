using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using iText.Barcodes;
using iText.Forms;
using iText.Forms.Fields;
using iText.IO.Font;
using iText.Kernel.Colors;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Annot;
using iText.Kernel.Pdf.Canvas;
using iText.Kernel.Pdf.Xobject;
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
            var fontStylePath = System.IO.Path.Combine(SettingsData.WebRootPath,"fonts", "Roboto-Light.ttf");
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

        public void ManipulatePdf(string src, string dest, List<ScriptParameter> inputList,JObject fieldData,string fontPath)
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
                     pdfFormField.Value.SetValue(fieldValue, font, 10f);
                 } 
            }

            string barCode = fieldData["barCode"].ToStringOrEmpty();
            if (!string.IsNullOrEmpty(barCode))
            {
                SetBarCodeFormField(ref pdfDoc,ref form,barCode,font);
            }
            form.FlattenFields();
            pdfDoc.Close();
        }


        public void SetBarCodeFormField(ref PdfDocument pdfDoc, ref PdfAcroForm form,string barCode,PdfFont font)
        {
             
            PdfFormField field = form.GetField("Barcode1");
            // Get the annotation. If you might have multiple representations of the same field across the document the just iterate over all widgets
            if (field == null)
            {
                return;
            }
            PdfWidgetAnnotation annotation = field.GetWidgets().FirstOrDefault();
            if (annotation == null)
            {
                return;
            }
            // This class will help us draw the barcode
            // BarcodeQRCode qrCode = new BarcodeQRCode(this.generateXMLDataMatrix()); 
            Barcode128 qrCode = new Barcode128(pdfDoc,font);
            // If value is positive, the text distance under the bars. If zero or negative,
            // the text distance above the bars.
            qrCode.SetBaseline(10);
            qrCode.SetSize(12);
            qrCode.SetCode(barCode);
            qrCode.SetCodeType(Barcode128.CODE128);
            // Creating a new FormXObject that will become our apperance. Set the dimension(bbox) of the current appearance
            PdfFormXObject newAppearance = new PdfFormXObject(annotation.GetAppearanceObject(PdfName.N).GetAsRectangle(PdfName.BBox));
            // Helper class to draw on FormXObject
            PdfCanvas barcodeCanvas = new PdfCanvas(newAppearance, pdfDoc);
            // Calculating the side of the smaller rectangle in the barcode
            qrCode.PlaceBarcode(barcodeCanvas, ColorConstants.BLACK, ColorConstants.BLACK);
            // Set appearance to the newly generated one
            annotation.SetAppearance(PdfName.N, newAppearance.GetPdfObject()); 
        }

        public static void SetBarCodeFormField2(string src, string dest)
        {

            PdfDocument pdfDoc = new PdfDocument(new PdfReader(src), new PdfWriter(dest));
            PdfAcroForm form = PdfAcroForm.GetAcroForm(pdfDoc, true);
            var fields = form.GetFormFields();
            PdfFormField field = form.GetField("Barcode1");
            // Get the annotation. If you might have multiple representations of the same field across the document the just iterate over all widgets
            PdfWidgetAnnotation annotation = field.GetWidgets().FirstOrDefault();
            // This class will help us draw the barcode
            // BarcodeQRCode qrCode = new BarcodeQRCode(this.generateXMLDataMatrix()); 
            Barcode128 qrCode = new Barcode128(pdfDoc);
            // If value is positive, the text distance under the bars. If zero or negative,
            // the text distance above the bars.
            qrCode.SetBaseline(10);
            qrCode.SetSize(12);
            qrCode.SetCode("A123");
            qrCode.SetCodeType(Barcode128.CODE128);
            // Get the number of rectangles constituting the barcode
            Rectangle size = qrCode.GetBarcodeSize();
            // Creating a new FormXObject that will become our apperance. Set the dimension(bbox) of the current appearance
            PdfFormXObject newAppearance = new PdfFormXObject(annotation.GetAppearanceObject(PdfName.N).GetAsRectangle(PdfName.BBox));
            // Helper class to draw on FormXObject
            PdfCanvas barcodeCanvas = new PdfCanvas(newAppearance, pdfDoc);
            // Calculating the side of the smaller rectangle in the barcode
            float side = Math.Min(annotation.GetRectangle().ToRectangle().GetHeight() / size.GetHeight(),
                annotation.GetRectangle().ToRectangle().GetWidth() / size.GetWidth());
            // Draw the barcode on the XObject
            qrCode.PlaceBarcode(barcodeCanvas, ColorConstants.BLACK, ColorConstants.BLACK);
            // Set appearance to the newly generated one
            annotation.SetAppearance(PdfName.N, newAppearance.GetPdfObject());
            pdfDoc.Close();
        }




    }
}
