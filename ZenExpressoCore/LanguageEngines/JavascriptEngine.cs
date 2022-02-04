using System;
using System.Collections.Generic;
using System.Text;
using Jint;
using ZenExpressoCore.Models;
using Esprima.Ast;



namespace ZenExpressoCore.LanguageEngines
{
    public class JavascriptEngine
    {
        public ServiceResponse ExecuteScript(ScriptInfo scriptInfo)
        {
            var scriptResult = new ServiceResponse(); 
            var engine = new Engine();
            var add = engine.Execute(scriptInfo.scriptCode).GetValue(scriptInfo.functionName);
            try
            {
                var output = add.Invoke(scriptInfo.clientInputs, scriptInfo.resultSequence);
                scriptResult.status = "00";
                scriptResult.data = output.ToString();

            }
            catch (Exception ex)
            {
                scriptResult.status = "01";
                scriptResult.message = ex.Message; 
                Logger.Error(this,ex.Message,ex);
            }

            return scriptResult;
        }
        
        // private ServiceResponse RunProcessWithEdge()
        // {
        //     var func = Edge.Func(@"
        //     return function (data, callback) {
        //         callback(null, 'Node.js welcomes ' + data);
        //     }
        // ");    
        // }
    }
    
    
}