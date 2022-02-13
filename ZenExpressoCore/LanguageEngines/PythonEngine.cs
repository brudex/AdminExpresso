using System;
using System.Threading.Tasks;
using Jint;
using ZenExpressoCore.Models;
using Jering.Javascript.NodeJS;


namespace ZenExpressoCore.LanguageEngines
{
    public class PythonEngine
    {
        public async Task<ServiceResponse> ExecuteScript(ScriptInfo scriptInfo)
        {
            var scriptResult = new ServiceResponse();
            try
            {
                if (SettingsData.NodejsRuntimeConfigured)
                {
                    scriptResult = await RunProcessInNodejs(scriptInfo);
                }
                else
                {
                    scriptResult = RunProcessWithJint(scriptInfo);
                }
            }
            catch (Exception ex)
            {
                scriptResult.status = "01";
                Console.WriteLine(ex.Message);
                scriptResult.message = ex.Message; 
                Logger.Error(this,ex.Message,ex);
            }
            return scriptResult;
        }

        private ServiceResponse RunProcessWithJint(ScriptInfo scriptInfo)
        {
            var scriptResult = new ServiceResponse();
            var function = $@"function {scriptInfo.functionName}(scriptResult,resultSequence){{
                            {scriptInfo.scriptCode}
                }}";
            Console.WriteLine(function);
            var engine = new Engine();
            var add = engine.Execute(function).GetValue(scriptInfo.functionName);
            var output = add.Invoke(scriptInfo.clientInputs, scriptInfo.resultSequence);
            scriptResult.status = "00";
            scriptResult.data = output.ToString();
            return scriptResult;
        }

        private async  Task<ServiceResponse> RunProcessInNodejs(ScriptInfo scriptInfo)
        {
            var scriptResult = new ServiceResponse(); 
            var function = $@"function {scriptInfo.functionName}(clientInputs,resultSequence){{
                            {scriptInfo.scriptCode}
                }}";
            string javascriptModule = $@"                 
                    module.exports = (callback,clientInputs, resultSequence) => {{  // Module must export a function that takes a callback as its first parameter
                        {function}         
                        try{{
                            let result = {scriptInfo.functionName}(); 
                            if (typeof result === 'object' && typeof result.then === 'function') {{
                                result.then(value => {{
                                    callback(null, value)
                                }}).catch(err => {{
                                callback(err)
                            }});
                            }}else{{
                                 callback(null,result);
                            }}
                        }}catch(e){{
                            callback(e);
                        }}                      
                    }}";
            Console.WriteLine(javascriptModule);
            // Invoke javascript
            var result = await StaticNodeJSService.InvokeFromStringAsync<string>(javascriptModule, args: new object[] { scriptInfo.clientInputs,scriptInfo.resultSequence});
            scriptResult.status = "00";
            scriptResult.data = result;
            Console.WriteLine(result);
            return scriptResult;
        }
    }
    
    
}