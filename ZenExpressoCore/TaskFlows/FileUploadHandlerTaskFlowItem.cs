using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
   public class FileUploadHandlerTaskFlowItem : TaskFlowItem, ITaskExecutor
   {
       private List<ScriptParameter> _inputList;
       private List<TaskFlowResult> _resultSequence;

       private StringBuilder _errorsSb;
       public FileUploadHandlerTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
       { 

       }
         

        public  TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            _errorsSb = new StringBuilder();
            _inputList = inputList;
            _resultSequence = resultSequence;
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;
            response.status = "00";
            response.message = "FileUpload Successful";
            var jsonFlowData = JObject.Parse(flowData);
            var processedFiles = new List<string>();
            string fieldSelect = jsonFlowData["fieldSelect"].ToStringOrEmpty();
            bool saveFiles = jsonFlowData["saveFiles"].ToBoolean();
            List<ScriptParameter> fileUploadFields= new List<ScriptParameter>();
            if (fieldSelect == "all")
            {
                fileUploadFields = inputList.Where(f => f.parameterType == "fileupload").ToList();
            }
            else
            {
                var handlerFields = jsonFlowData["handlerFields"].ToStringOrEmpty().Split(new string[] {","},StringSplitOptions.RemoveEmptyEntries);
                fileUploadFields = inputList.Where(f => f.parameterType == "fileupload" && handlerFields.Contains(f.parameterName)).ToList();
            }
            foreach (var fileUploadField in fileUploadFields)
            {
                var fileUploadCache = MemDb.Instance.GetFromCache<List<FileUploadMeta>>(fileUploadField.parameterValue);
                foreach (var fileUploadMeta in fileUploadCache)
                {
                    string sourceFile = GetSourcePathAndFilename(fileUploadMeta.DestFileName);
                    if (saveFiles)
                    {
                            string destFolder = jsonFlowData["destFolder"].ToStringOrEmpty();
                            string destinationFile = GenerateDestFileName(fileUploadMeta.SourceFileName,jsonFlowData);
                            string destinationPathAndFile = GetDestPathAndFilename(destFolder,destinationFile);
                            if (System.IO.File.Exists(destinationPathAndFile))
                            {
                                destinationFile = AddTimeStampToFileName(destinationFile);
                                destinationPathAndFile = GetDestPathAndFilename(destFolder,destinationFile); 
                            }
                            try
                            {
                                CopyFileToFinalDestination(sourceFile, destinationPathAndFile);
                                processedFiles.Add(destinationPathAndFile);
                            }
                            catch (Exception ex)
                            {
                                _errorsSb.Append(ex.Message + "\n\n" + ex.InnerException);
                                Logger.Error(this, ex);
                            }
                    }
                    else
                    {
                        processedFiles.Add(sourceFile);
                    }
                }
              
            }

            if (processedFiles.Count == 0)
            {
                response.status = "02";
                response.message = _errorsSb.ToString();
            }
            else
            {
                response.status = "00";
                response.data = processedFiles;
                if (!string.IsNullOrEmpty(_errorsSb.ToString()))
                {
                    response.message = "The following errors where encountered : " + _errorsSb.ToString();
                } 
            } 
            return response;  
         }

        private void CopyFileToFinalDestination(string sourceFile, string destinationPathAndFile)
        {
            File.Copy(sourceFile,destinationPathAndFile);
        }

        //add time and date to file to prevent overwrite
        private string AddTimeStampToFileName(string destinationFile)
        {
            var fileNameOnly = Path.GetFileNameWithoutExtension(destinationFile);
            fileNameOnly = fileNameOnly + "_" + DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string extension = Path.GetExtension(destinationFile);
            return fileNameOnly + extension;
        }

        private string GetSourcePathAndFilename(string filename)
        {
            return SettingsData.WebRootPath + "\\uploads\\" + filename;
        } 
        
        private string GetDestPathAndFilename(string destFolder, string filename)
        {
            
            return System.IO.Path.Combine(destFolder, filename);
        }

        private string GenerateDestFileName(string sourceFileName,JObject jsonFlowData)
        {
            string fileNameLogic = jsonFlowData["fileNameLogic"].ToStringOrEmpty();
            string retFileName = DateTime.Now.ToString("yyyy-MM-dd_HH_mm_ss");
            string fileNameOnly = Path.GetFileNameWithoutExtension(sourceFileName);
            string fileExtension = Path.GetExtension(sourceFileName);
            switch (fileNameLogic)
            {
                case "sameName":
                     retFileName =fileNameOnly;
                     retFileName += fileExtension;
                    break;
                case "fileNameDateTime":
                    retFileName = $"{fileNameOnly}_{DateTime.Now.ToString("yyyyMMdd_HH_mm_ss")}";
                    retFileName += fileExtension;
                    break; 
                case "dateTime":
                    retFileName = DateTime.Now.ToString("yyyyMMdd_HH_mm_ss");
                    retFileName += fileExtension;
                    break; 
                case "uuid":
                    retFileName = Guid.NewGuid().ToString();
                    retFileName += fileExtension;
                    break;
                case "fileNameUuid":
                    retFileName = $"{fileNameOnly}_{Guid.NewGuid().ToString()}";
                    retFileName += fileExtension;
                    break; 
                case "javascript":
                    var javascriptTaskFlowItem = new JavascriptTaskFlowItem(this);
                    var result = javascriptTaskFlowItem.ExecuteResult(_inputList, _resultSequence);
                    if (result.status == "00")
                    {
                        retFileName = result.data + "";
                    }
                    else
                    {
                        _errorsSb.Append(result.message);
                        retFileName += fileExtension;
                    }
                    break;
            }

            return retFileName;
        }
    }
}
