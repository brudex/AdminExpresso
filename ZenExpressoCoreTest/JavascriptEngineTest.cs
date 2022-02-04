using System.Threading.Tasks;
using MongoDB.Driver;
using NUnit.Framework;
using ZenExpressoCore;
using ZenExpressoCore.LanguageEngines;

namespace ZenExpressoCoreTest
{
    public class JavascriptEngineTest
    {
        private string clientInputs;
        private string resultSequence;
        private ScriptInfo scriptInfo;
        private JavascriptEngine _engine;
        [SetUp]
        public void Setup()
        {
            scriptInfo= new ScriptInfo();
            scriptInfo.clientInputs = "[]";
            scriptInfo.resultSequence = "[]";
            scriptInfo.scriptCode = @"
 const path = require('path');
 const axios = require('axios');

return new Promise(function(resolve,reject){
    axios.get('https://api.github.com/users/mapbox')
      .then((response) => {
        console.log(response.data);
        console.log(response.status);
        console.log(response.statusText);
        console.log(response.headers);
        console.log(response.config);
        resolve(response.data)
      });
})
";
            scriptInfo.functionName = "testFunctionName1";
            _engine= new JavascriptEngine();
        }

        // [Test]
        // public async  Task TestExecutionWithJint()
        // {
        //   SettingsData.NodejsRuntimeConfigured=false;
        //   var response = await _engine.ExecuteScript(scriptInfo);
        //   Assert.AreEqual(response.status,"00");
        //   Assert.AreEqual(response.data.ToString(), "The quick brown fox");
        // }

        [Test]
        public async Task TestExecutionWithNodeJs()
        {
            SettingsData.NodejsRuntimeConfigured = true;
            var response = await _engine.ExecuteScript(scriptInfo);
            Assert.AreEqual(response.status, "00");
            Assert.AreEqual(response.data.ToString(), "The quick brown fox");
        
        }
    }
}