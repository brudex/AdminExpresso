(function ($,buckets) {
    'use strict';
    angular
        .module('app')
        .controller('ExecuteAdvancedTaskController', ExecuteAdvancedTaskController);
    ExecuteAdvancedTaskController.$inject = ['brudexservices', 'brudexutils', 'BeforeRenderDataStore','DataHolder'];
    function ExecuteAdvancedTaskController(services, utils, BeforeRenderDataStore, DataHolder) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.formSubmitted = false;
        vm.model = {searchFields:[]};
        var supportTaskId = $("#__supportTaskId").val();
        var supportTaskInfo = {};
        vm.taskFlowItems = [];
        var taskResults = [];
         vm.outputFormatingScripts = [];
        var clientResults = [];
        vm.scriptExecutiongStage = 'beforeRender';
        var validationScriptsQueue =  new buckets.Queue();
        var broadcastFunctions = {
            getTaskResults: function() {
                return taskResults;
            },
            submitTaskResult : submitTaskResult 
        };

        console.log('broadcastFunctions', broadcastFunctions);
        DataHolder.setParentFunctions(broadcastFunctions);
        vm.init = function() {
            executeOnRender(); 
        }

        function getNextValidationScriptInfo() {
            if (validationScriptsQueue.isEmpty()) {
                return null;
            }
            return validationScriptsQueue.dequeue();
        }

        function submitTaskResult(taskResult) {
            console.log('The Task Result has been submitted>>', JSON.stringify(taskResult));
            if (taskResult.flowItemType === 'inputForm.html') {
                clientResults.push(taskResult);
            } else {
                if (taskResult.taskResult.status !== "00") {
                    return;
                }
            }
            var taskInfo = getNextValidationScriptInfo();
            if (taskInfo) {
                var validationScriptTool = DataHolder.getValidationScriptReference();
                validationScriptTool.init(taskInfo, taskResult);
            } else {
                console.log('Executing form post');
                var payload = {};
                payload.taskId = supportTaskId;
                payload.clientResults = clientResults;
                executeFormPost(payload);
            } 
        }


        function executeOnRender() {
            var beforeRenderResults = BeforeRenderDataStore.getBeforeRenderResults();
            var clientRenderFlows = BeforeRenderDataStore.getClientRenderFlows();
            taskResults = beforeRenderResults;
            if(clientRenderFlows.length === 0) {
                console.log('Before Render results length>>>', beforeRenderResults.length);
                if (beforeRenderResults.length) {
                    var obj = {};
                    obj.supportTaskFlowId = supportTaskInfo.id;
                    obj.controlName = '';
                    obj.controlIdentifier = '';
                    obj.description = '';
                    obj.flowItemType = 'tableResult.html';
                    obj.flowGroup = '';
                    vm.taskFlowItems.push(obj);
                }
            }
            for(var k = 0, len = clientRenderFlows.length; k < len; k++) {
                var flow = clientRenderFlows[k]; 
                flow.flowData = JSON.parse(flow.flowData);
                if(flow.flowItemType === 'validationScript'){
                    validationScriptsQueue.enqueue(flow);
                } else {
                    flow.flowItemType = flow.flowItemType + '.html';
                    vm.taskFlowItems.push(flow);
                }
            }
        }


        function executeFormPost(data) {
            services.executeAdvancedTask(data, function (response) {
                if (response.status === "00") {
                    executeOnFormResult(response);
                } else {
                    utils.alertError(response.message);
                }
            });
        }

        function executeOnFormResult(response) {
            console.log('The task flow response ', JSON.stringify(response));
           // return;
            var renderResults = response.taskFlowResults;
            taskResults = renderResults;
            var clientRenderFlows = response.taskFlowItems;
            vm.taskFlowItems = [];
            if (clientRenderFlows.length === 0) {
                console.log('Before Render results length>>>', renderResults.length);
                if (renderResults.length) {
                    var obj = {};
                    obj.supportTaskFlowId = supportTaskInfo.id;
                    obj.controlName = '';
                    obj.controlIdentifier = '';
                    obj.description = '';
                    obj.flowItemType = 'tableResult.html';
                    obj.flowGroup = '';
                    vm.taskFlowItems.push(obj);
                }
            }
            for (var k = 0, len = clientRenderFlows.length; k < len; k++) {
                var flow = clientRenderFlows[k];
                flow.flowData = JSON.parse(flow.flowData);
                if (flow.flowItemType === 'validationScript') {
                    validationScriptsQueue.enqueue(flow); //todo change to execute data transform script
                } else {
                    flow.flowItemType = flow.flowItemType + '.html';
                    vm.taskFlowItems.push(flow);
                }
            }
        }
 
 
    }
})(window.jQuery,window.buckets);
