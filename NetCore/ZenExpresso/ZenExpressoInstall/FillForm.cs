using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using iText.Barcodes;
using iText.Forms;
using iText.IO.Font;
using iText.Kernel.Colors;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Canvas;
using iText.Kernel.Pdf.Xobject;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;

namespace ZenExpressoInstall
{
    public class FillFormSpecialChars
    {
        // //public static readonly String DEST = "results/sandbox/acroforms/fill_form_special_chars.pdf";
        // public static readonly String FONT = "C:\\Users\\brudex\\Desktop\\Roboto-Bold.ttf";
        // //public static readonly String SRC = "../../../resources/pdfs/test.pdf";
        //
        // // ěščřžýáíé characters
        // public const String VALUE = "TestValue";

        // public static void Main(String[] args)
        // {
        //     FileInfo file = new FileInfo(DEST);
        //     file.Directory.Create();
        //
        //     new FillFormSpecialChars().ManipulatePdf(DEST);
        // }

        public void ManipulatePdf(string src,String dest)
        {
            PdfDocument pdfDoc = new PdfDocument(new PdfReader(src), new PdfWriter(dest));
            PdfAcroForm form = PdfAcroForm.GetAcroForm(pdfDoc, true);
            // Being set as true, this parameter is responsible to generate an appearance Stream
            // while flattening for all form fields that don't have one. Generating appearances will
            // slow down form flattening, but otherwise Acrobat might render the pdf on its own rules.
            // form.SetGenerateAppearance(true);
            // PdfFont font = PdfFontFactory.CreateFont(FONT, PdfEncodings.IDENTITY_H);
            // form.GetField("Text1").SetValue(VALUE, font, 12f);
            // form.GetField("Text2").SetValue(VALUE, font, 12f);
            form.GetField("fullName").SetValue("TestVal");
            form.FlattenFields();
            pdfDoc.Close();
        }
    }
}
