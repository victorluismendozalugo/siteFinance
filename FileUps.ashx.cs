using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebSystems2021
{
    /// <summary>
    /// Descripción breve de FileUploadHandler
    /// </summary>
    public class FileUps : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hola a todos");
            try
            {
                if (context.Request.QueryString["upload"] != null)
                {
                    string pathrefer = context.Request.UrlReferrer.ToString();
                    string Serverpath = HttpContext.Current.Server.MapPath("images");

                    var postedFile = context.Request.Files[0];

                    string file;

                    //In case of IE
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE")
                    {
                        string[] files = postedFile.FileName.Split(new char[] {
                '\\'
            });
                        file = files[files.Length - 1];
                    }
                    else // In case of other browsers
                    {
                        file = postedFile.FileName;
                    }

                    //file = file.Split('.')[0];

                    if (!Directory.Exists(Serverpath))
                        Directory.CreateDirectory(Serverpath);

                    string fileDirectory = Serverpath;
                    if (context.Request.QueryString["fileName"] != null)
                    {
                        file = context.Request.QueryString["fileName"];
                        if (File.Exists(fileDirectory + "\\" + file))
                        {
                            File.Delete(fileDirectory + "\\" + file);
                        }
                    }

                    string ext = Path.GetExtension(fileDirectory + "\\" + file);
                    //file = Guid.NewGuid() + ext; // Creating a unique name for the file 
                    //file = file + ext; // Creating a unique name for the file 

                    fileDirectory = Serverpath + "\\" + file;

                    postedFile.SaveAs(fileDirectory);

                    context.Response.AddHeader("Vary", "Accept");
                    try
                    {
                        if (context.Request["HTTP_ACCEPT"].Contains("application/json"))
                            context.Response.ContentType = "application/json";
                        else
                            context.Response.ContentType = "text/plain";
                    }
                    catch
                    {
                        context.Response.ContentType = "text/plain";
                    }

                    //context.Response.Write("Success");
                    context.Response.Write("{\"estatus\":\"Success\"}");

                }
            }
            catch (Exception exp)
            {
                context.Response.Write("{\"estatus\":\"" + exp.Message + "\"}");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}