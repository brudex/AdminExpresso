using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
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
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;

namespace ZenExpressoInstall
{
    class ReplacePdfFile
    {
        
        public void ManipulatePdf(string dest)
        {
            PdfDocument pdfDoc = new PdfDocument(new PdfWriter(dest));
            Document doc = new Document(pdfDoc);
            Table table = new Table(UnitValue.CreatePercentArray(4)).UseAllAvailableWidth();
            for (int i = 0; i < 12; i++)
            {
                table.AddCell(CreateBarcode(string.Format("{0:d8}", i), pdfDoc));
            }
            doc.Add(table); 
            doc.Close();
        }


        //barcodebackground
        public void ManipulatePdf2(String dest)
        {
            PdfDocument pdfDoc = new PdfDocument(new PdfWriter(dest));

            Barcode128 code128 = new Barcode128(pdfDoc);
            code128.SetCode("12345XX789XXX");
            code128.SetCodeType(Barcode128.CODE128);
            PdfFormXObject xObject = code128.CreateFormXObject(ColorConstants.BLACK,
                ColorConstants.BLACK, pdfDoc);

            float x = 36;
            float y = 750;
            float width = xObject.GetWidth();
            float height = xObject.GetHeight();

            // Draw the rectangle with set background color and add the created barcode object.
            PdfCanvas canvas = new PdfCanvas(pdfDoc.AddNewPage());
            canvas.SaveState();
            canvas.SetFillColor(ColorConstants.LIGHT_GRAY);
            canvas.Rectangle(x, y, width, height);
            canvas.Fill();
            canvas.RestoreState();
            canvas.AddXObjectAt(xObject, 36, 750);
            pdfDoc.Close();
        }


        //barcodeintable
        public void ManipulatePdf3(String dest)
        {
            PdfDocument pdfDoc = new PdfDocument(new PdfWriter(dest));
            Document doc = new Document(pdfDoc);
            String code = "675-FH-A12";

            Table table = new Table(UnitValue.CreatePercentArray(2)).UseAllAvailableWidth();
            table.AddCell("Change baseline:");

            Barcode128 code128 = new Barcode128(pdfDoc);

            // If value is positive, the text distance under the bars. If zero or negative,
            // the text distance above the bars.
            code128.SetBaseline(-1);
            code128.SetSize(12);
            code128.SetCode(code);
            code128.SetCodeType(Barcode128.CODE128);
            Image code128Image = new Image(code128.CreateFormXObject(pdfDoc));

            // Notice that in iText5 in default PdfPCell constructor (new PdfPCell(Image img))
            // this image does not fit the cell, but it does in addCell().
            // In iText7 there is no constructor (new Cell(Image img)),
            // so the image adding to the cell can be done only using method add().
            Cell cell = new Cell().Add(code128Image);
            table.AddCell(cell);
            table.AddCell("Add text and bar code separately:");

            code128 = new Barcode128(pdfDoc);

            // Suppress the barcode text
            code128.SetFont(null);
            code128.SetCode(code);
            code128.SetCodeType(Barcode128.CODE128);

            // Let the image resize automatically by setting it to be autoscalable.
            code128Image = new Image(code128.CreateFormXObject(pdfDoc)).SetAutoScale(true);
            cell = new Cell();
            cell.Add(new Paragraph("PO #: " + code));
            cell.Add(code128Image);
            table.AddCell(cell);
            doc.Add(table);
            doc.Close();
        }

        public Image CreateBarcode(float xScale, float yScale, PdfDocument pdfDoc)
        {
            BarcodePDF417 barcode = new BarcodePDF417();
            barcode.SetCode("BarcodePDF417 barcode");
            PdfFormXObject barcodeObject = barcode.CreateFormXObject(ColorConstants.BLACK, pdfDoc);
            Image barcodeImage = new Image(barcodeObject).Scale(xScale, yScale);
            return barcodeImage;
        }


        //barcodeplacement
        public void ManipulatePdf4(String dest)
        {
            PdfDocument pdfDoc = new PdfDocument(new PdfWriter(dest));
            Document doc = new Document(pdfDoc);

            Image img = CreateBarcode(1, 1, pdfDoc);
            doc.Add(new Paragraph(String.Format("This barcode measures {0:0.0} by {1:0.0} user units",
                img.GetImageScaledWidth(), img.GetImageScaledHeight())));
            doc.Add(img);

            img = CreateBarcode(3, 3, pdfDoc);
            doc.Add(new Paragraph(String.Format("This barcode measures {0:0.0} by {1:0.0} user units",
                img.GetImageScaledWidth(), img.GetImageScaledHeight())));
            doc.Add(img);

            img = CreateBarcode(3, 1, pdfDoc);
            doc.Add(new Paragraph(String.Format("This barcode measures {0:0.0} by {1:0.0} user units",
                img.GetImageScaledWidth(), img.GetImageScaledHeight())));
            doc.Add(img);

            doc.Close();
        }

        private static Cell CreateBarcode(string code, PdfDocument pdfDoc)
        {
            BarcodeEAN barcode = new BarcodeEAN(pdfDoc);
            barcode.SetCodeType(BarcodeEAN.EAN8);
            barcode.SetCode(code);
            // Create barcode object to put it to the cell as image
            PdfFormXObject barcodeObject = barcode.CreateFormXObject(null, null, pdfDoc);
            Cell cell = new Cell().Add(new Image(barcodeObject));
            cell.SetPaddingTop(10);
            cell.SetPaddingRight(10);
            cell.SetPaddingBottom(10);
            cell.SetPaddingLeft(10);

            return cell;
        }

        public static void SetBarCodeFormField(string src,string dest)
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
            qrCode.SetSize(10);
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
