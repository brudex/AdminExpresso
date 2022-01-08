(function ($,buckets) {
    'use strict';
    angular
        .module('app')
        .controller('ExecuteAdvancedTaskController', ExecuteAdvancedTaskController);
    ExecuteAdvancedTaskController.$inject = ['brudexservices', 'brudexutils', 'BeforeRenderDataStore', 'DataHolder', '$sce', '$scope', '$controller'];
    function ExecuteAdvancedTaskController(services, utils, BeforeRenderDataStore, DataHolder, $sce, $scope, $controller) {
        var vm = this;
        vm.formData = null;
        var supportTaskId = $("#__supportTaskId").val();
        var supportTaskInfo = {};
        vm.taskFlowItems = [];
        var taskResults = [];
        var clientResults = [];
        vm.scriptExecutiongStage = 'beforeRender';
        var validationScriptsQueue = new buckets.Queue();
        var currentValidationScript = null;
        var currentTaskResult = null;
        var formSubmitSuccessCallbacks = [];
        var broadcastFunctions = {
            getTaskResults: function() {
                return taskResults;
            },
            submitTaskResult: submitTaskResult,
            setFormData: function (formData) { vm.formData = formData; } 
        }; 

        DataHolder.setParentFunctions(broadcastFunctions);
        vm.init = function() {
            executeOnRender(); 
        }

        function getNextValidationScriptInfo() {
            if (currentValidationScript != null) {
                return currentValidationScript;
            }
            if (validationScriptsQueue.isEmpty()) {
                return null;
            }
            return validationScriptsQueue.dequeue();
        }

        function executeScriptWithResult(scriptInfo, callback) {
            executeJsScriptController(scriptInfo, function (jsResult) {
                callback(jsResult.status);
            });
        }
        
        //recursive function to run thru queued submit scripts synchronously
        function executeOnFormSubmitScripts() {
            var validationScripInfo = getNextValidationScriptInfo();
            if (validationScripInfo) {
                executeScriptWithResult(validationScripInfo,
                    function (status) {
                        if (status === "00") {
                            currentValidationScript = null;
                            executeOnFormSubmitScripts();
                        } else {
                            executeOnFormSubmitScripts();
                        }
                    });
            } else {
                //taskResult.updateFormData(taskResult.payload, vm.formData);  update the form data modified by the script
                delete currentTaskResult.formData;
                clientResults.push(currentTaskResult);
                submitData();
            }
        }

        function submitData() {
            var payload = {};
            payload.taskId = supportTaskId;
            payload.clientResults = clientResults;
            executeFormPost(payload);
        }

        function submitTaskResult(taskResult, successCallback) {
            if (successCallback) {
               formSubmitSuccessCallbacks.push(successCallback);
            }
            if (taskResult.flowItemType === 'inputForm.html' ) {
                currentTaskResult = taskResult;
                vm.formData = taskResult.formData;
                executeOnFormSubmitScripts(); 
            }else {
                if (taskResult.status === "00") {
                    currentValidationScript = null;
                }
            }
        }
        
        //todo raise an event get all inputs and s

        function getControllerByFlowItemType(flowItemType) {
            var dict = {
                'javascript': 'ExecuteScriptViewController'
            }
            return $controller(dict[flowItemType], { $scope: $scope });
        } 
         
        function executeJsScriptController(flow,callback) {
            var controller = getControllerByFlowItemType(flow.flowItemType);
            controller.init(flow,vm.formData,callback); //init and execute called in function
         }

        function executeOnRender() {
            var beforeRenderResults = BeforeRenderDataStore.getBeforeRenderResults();
            console.log('The before Render Results >>>', beforeRenderResults);
            var clientRenderFlows = BeforeRenderDataStore.getClientRenderFlows();
            console.log('The before Render Results >>>', clientRenderFlows);
            taskResults = beforeRenderResults;
            if(clientRenderFlows.length === 0) {
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
            clientRenderFlows = clientRenderFlows.map(function(item) {
                item.flowData = JSON.parse(item.flowData);
                if (item.flowItemType === 'javascript' && item.flowData.runMode === 'onRender') {
                    validationScriptsQueue.enqueue(item); //caching on Render scripts for executing
                }
                return item; 
            });
            if (validationScriptsQueue.length) {
                vm.formData = null;
                executeOnFormRenderScripts(); //run scripts the should be executed on page load
            } else {
                runRenderFlows();
            }
            function executeOnFormRenderScripts() {
                var taskInfo = getNextValidationScriptInfo();
                if (taskInfo) {
                    executeScriptWithResult(taskInfo,
                        function (status) {
                            if (status === "00") {
                                currentValidationScript = null;
                                executeOnFormRenderScripts();
                            } else {
                                executeOnFormRenderScripts();
                            }
                        });
                } else {
                    runRenderFlows();
                }
            }

            function runRenderFlows() {
                var indexIterator = 0;
                function recursiveIterator() {
                    var flow = clientRenderFlows[indexIterator];
                    if (flow.flowItemType === 'javascript') {
                        if (flow.flowData.runMode === 'followFlow') {  //todo use callback to continue executing
                             executeScriptWithResult(flow,
                                function (status) {
                                    if (status === "00") {
                                        indexIterator += 1;
                                        if (indexIterator < clientRenderFlows.length) {
                                            recursiveIterator();
                                        } 
                                    } else {
                                        recursiveIterator();
                                    }
                                }); 

                        } else if (flow.flowData.runMode === 'onSubmit') {
                            validationScriptsQueue.enqueue(flow);
                        }
                    } else {
                        flow.flowItemType = flow.flowItemType + '.html';
                        vm.taskFlowItems.push(flow);
                        indexIterator += 1;
                        if (indexIterator < clientRenderFlows.length) {
                            recursiveIterator();
                        }
                    }
                }
                recursiveIterator();
            } 
        }


        function executeFormPost(data) {
            services.executeAdvancedTask(data, function (response) {
                clientResults = [];
                if (response.status === "00") {
                    executeOnFormResult(response);
                } else {
                    utils.alertError(response.message);
                }
            });
        }

        function executeOnFormResult(response) {
            taskResults = response.taskFlowResults;  //value retrieved by other control widgets
            var renderResults = response.taskFlowResults;
            var clientRenderFlows = response.taskFlowItems;  //modified in this function
            if (response.status === "00") {
                formSubmitSuccessCallbacks.forEach(function (func) {
                    func(response);
                });
                formSubmitSuccessCallbacks = [];
            }
            if (clientRenderFlows.length === 0) {
                console.log('Before Render results length>>>', renderResults.length);
                if (renderResults.length) {
                    if (vm.taskFlowItems[0].flowData.removeOnResult) { //clear Screen if the form widget says so
                        vm.taskFlowItems = [];
                    }
                    var obj = {};
                    obj.supportTaskFlowId = supportTaskInfo.id;
                    obj.controlName = '';
                    obj.controlIdentifier = '';
                    obj.description = '';
                    obj.flowItemType = 'tableResult.html';
                    obj.flowGroup = '';
                    vm.taskFlowItems.push(obj);
                }
            } else {
                var clearScreen = true;
                if (clientRenderFlows.length === 1 && ['javascript', 'successMessage'].indexOf(clientRenderFlows[0].flowItemType) > -1) {
                    clearScreen = false;
                }
                if (clearScreen && vm.taskFlowItems.length){
                    for (var k = (vm.taskFlowItems.length - 1); k >= 0; k--) {
                        if (vm.taskFlowItems[k].flowData.onSuccessResult=="removeForm") {
                            vm.taskFlowItems.splice(k, 1);
                            continue;
                        }
                        if (vm.taskFlowItems[k].flowItemType!="inputForm.html") {
                            vm.taskFlowItems.splice(k, 1);
                        }
                    }
                }
            }
            clientRenderFlows = clientRenderFlows.map(function (item) {
                item.flowData = JSON.parse(item.flowData);
                if (item.flowItemType === 'javascript' && item.flowData.runMode === 'onRender') {
                    validationScriptsQueue.enqueue(item); //caching on Render scripts for executing
                }
                return item;
            });
            if (validationScriptsQueue.length) {
                 executeOnFormRenderScripts(); //run scripts the should be executed on page load
            } else {
                runRenderFlows();
            }
            function executeOnFormRenderScripts() {
                var taskInfo = getNextValidationScriptInfo();
                if (taskInfo) {
                    executeScriptWithResult(taskInfo,
                        function (status) {
                            if (status === "00") {
                                currentValidationScript = null;
                                executeOnFormRenderScripts();
                            } else {
                                executeOnFormRenderScripts();
                            }
                        });
                } else {
                    runRenderFlows();
                }
            }

            function runRenderFlows() {
                console.log('RENDERING FLOWS FROM RESULT');
                for (var k = 0, len = clientRenderFlows.length; k < len; k++) {
                    var flow = clientRenderFlows[k];
                    flow.flowItemType = flow.flowItemType + '.html';
                    vm.taskFlowItems.push(flow);
                }
            }  
        }  
    }
})(window.jQuery,window.buckets);
