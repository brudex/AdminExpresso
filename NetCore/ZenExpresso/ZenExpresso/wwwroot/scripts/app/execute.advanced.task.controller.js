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

        console.log('broadcastFunctions', broadcastFunctions);
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
            console.log('The Task Result has been submitted>>', JSON.stringify(taskResult));
            if (taskResult.flowItemType === 'inputForm.html') {
                currentTaskResult = taskResult;
                vm.formData = taskResult.formData;
                executeOnFormSubmitScripts(); 
            } else {
                if (taskResult.status === "00") {
                    currentValidationScript = null;
                }
            } 
        }


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
              
            taskResults = response.taskFlowResults;
            var renderResults = response.taskFlowResults;
            var clientRenderFlows = response.taskFlowItems;
            if (clientRenderFlows.length === 0) {
                console.log('Before Render results length>>>', renderResults.length);
                if (renderResults.length) {
                    vm.taskFlowItems = [];
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
                if (clientRenderFlows.length == 1) {
                    if (['javascript', 'successMessage'].indexOf(clientRenderFlows[0].flowItemType) == -1) { //don't clear screen if its js or successMessage result
                        console.log("Screen is cleard")
                        vm.taskFlowItems = [];
                    }
                } else {
                    vm.taskFlowItems = []; //clears screen
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
