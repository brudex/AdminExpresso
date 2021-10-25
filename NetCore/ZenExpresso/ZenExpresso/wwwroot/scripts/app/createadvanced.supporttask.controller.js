(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('CreateAdvancedTaskController', CreateAdvancedTaskController);
    CreateAdvancedTaskController.$inject = ['brudexservices', 'brudexutils', 'DataHolder', '$sce', '$scope','$controller'];
    function CreateAdvancedTaskController(services, utils, DataHolder, $sce, $scope, $controller) {
        var vm = this;
        vm.errorMsg = [];
        vm.errorParameter = []; 
        vm.beforeRenderFlows = [];
        vm.clientFlows = [];
        vm.postActionsFlows = [];
        vm.clientResultFlows = [];
        vm.successMsg = [];
        vm.topMenus = [];
        vm.model = { parameters:[],inputFormPresent:false};
        vm.formSubmitted = false;
        vm.parameter = {};
        vm.supportTasks =[];
        var isEditting = false;
        vm.insertIndex=-1;
        var flowsIncrementer = {}
         

        var broadcastFunctions = {
            getFlowCounterIndex: getFlowCounterIndex,
            getBeforeRenderDataSources: getBeforeRenderDataSources,
            getPostActionDataSources: getPostActionDataSources,
            inputFormAdded: function () { return vm.model.inputFormPresent },
            getParentModel: function () { return vm; },
            getAllSupportTasks :getAllSupportTasks
        };

        vm.trustAsHtml = function (html) {
            return $sce.trustAsHtml(html);
        }



        function getAllSupportTasks(callback){
            if(vm.supportTasks.length===0){
                services.getAllSupportTasks(function(response){
                    if(response.status==="00"){
                        vm.supportTasks = response.data;
                        callback(response.data);
                    }
                });
            }else{
                return  callback(vm.supportTasks);
            }
        }

        function incrementFlowCounter(flowItemType) {
            if (flowsIncrementer[flowItemType]) {
                flowsIncrementer[flowItemType] += 1;
            } else {
                flowsIncrementer[flowItemType] = 1;
            }
        }

        function getFlowCounterIndex(flowItemType) {
            if (flowsIncrementer[flowItemType]) {
               return  flowsIncrementer[flowItemType];
            } else {
                flowsIncrementer[flowItemType] = 1;
                return flowsIncrementer[flowItemType];
            }
        }

        function getBeforeRenderDataSources() {
            var array = [];
            vm.beforeRenderFlows.forEach(function (item) {
                console.log('getBeforeRenderDataSources Befor render flow item', item);
                array.push({ key: item.controlIdentifier, dataSourceName: item.controlIdentifier, inputFormat: item.flowItemType,isFlowItem:true });
            });
            return array;
        }

        function getPostActionDataSources(flowType) {
            var array = [];
            if (flowType) {
                vm.postActionsFlows.forEach(function (item) {
                    console.log('Iterating post action flows>>>', item);
                    if (item.flowItemType === flowType) {
                        array.push({
                            key: item.controlIdentifier,
                            dataSourceName: item.controlIdentifier,
                            inputFormat: item.flowItemType,
                            isFlowItem: true
                        });
                    } 
                });
            } else {
                vm.postActionsFlows.forEach(function (item) {
                    array.push({ key: item.controlIdentifier, dataSourceName: item.controlIdentifier, inputFormat: item.flowItemType, isFlowItem: true });
                });
            }
            
            return array;
        }

        function getControllerByFlowItemType(flowItemType) {
            console.log('the flowItemType ,', flowItemType);
            var dict = {
                'inputForm': 'ClientInputWidgetController',
                'sqlQuery': 'SqlQueryWidgetController',
                'successMessage': 'SuccessMessageWidgetController',
                'tableResult': 'TableResultWidgetController',
                'cardResult': 'CardWidgetController',
                'rest': 'RestApiWidgetController',
                'javascript': 'JavascriptWidgetController',
                'fileUploadClient': 'FileUploadClientWidgetController',
                'fileUploadServer': 'FileUploadServerWidgetController',
                'pdfform': 'PdfFormInputWidgetController',
                'fileDownload': 'FileDownloadWidgetController',
                'linkButton': 'LinkButtonWidgetController',
                'excelCsvProcessing': 'ExcelCsvWidgetController',
                'dynamicForm': 'DynamicFormWidgetController'
            }
            return $controller(dict[flowItemType], { $scope: $scope });
        }


        //Called on page load when editting a task
        function addInitialFlow(data) {
            var controller = getControllerByFlowItemType(data.flowItemType);
            var dataModel = controller.initDataModel(data);
            addFlow(dataModel);
        }

        function addFlow(data) {
            incrementFlowCounter(data.flowItemType);
             switch (data.flowGroup) {
                case "clientRender":
                 case "client":
                     if (data.flowItemType === 'inputForm') {
                         vm.model.inputFormPresent = true;
                     }
                     if(vm.insertIndex >-1){
                        vm.clientFlows.splice(vm.insertIndex,0,data);
                     }else{
                        vm.clientFlows.push(data);
                     }
                    break;
                case "beforeRender":
                    if(vm.insertIndex >-1){
                        vm.beforeRenderFlows.splice(vm.insertIndex,0,data);
                    }else{
                        vm.beforeRenderFlows.push(data);
                    }
                    break;
                case "postAction":
                    if(vm.insertIndex > -1){
                        vm.postActionsFlows.splice(vm.insertIndex,0,data);
                    }else{
                        vm.postActionsFlows.push(data);
                    }
                    break;
                case "clientResult":
                    if(vm.insertIndex > -1){
                        vm.clientResultFlows.splice(vm.insertIndex,0,data);
                    }else{
                        vm.clientResultFlows.push(data);
                    }
                    break;
            }
            vm.insertIndex=-1;
        }

        function editFlowAtIndex(data,index) {
            incrementFlowCounter(data.flowItemType);
            switch (data.flowGroup) {
            case "clientRender":
            case "client":
                vm.clientFlows.splice(index,1,data);
                break;
            case "beforeRender":
                    vm.beforeRenderFlows.splice(index, 1, data);
                break;
            case "postAction":
                    vm.postActionsFlows.splice(index, 1, data);
                break;
            case "clientResult":
                    vm.clientResultFlows.splice(index, 1, data);
                break;
            }
        }

        vm.getFlowsByFlowGroup = function(flowGroup) {
            switch (flowGroup) {
            case "clientRender":
            case "client":
                return vm.clientFlows;
                break;
            case "beforeRender":
                return vm.beforeRenderFlows;
                break;
            case "postAction":
                return vm.postActionsFlows;
                break;
            case "clientResult":
                return vm.clientResultFlows;
                break;
            }
        };

        vm.saveWidgetData = function (key, data) {
            if (data.isEditting) {
                console.log('vm.saveWidget is editting>>', data);
                editFlowAtIndex(data, data.editIndex);
                utils.toastInfo("Flow Modified !!");
            } else {
                addFlow(data); 
                utils.toastInfo("Flow Added !!");
            }
            $("#" + data.modalName).modal("hide");
        }

        //Open WidgetModal clicked on the side bar on in Widget Options Modal
        vm.onModalOpen = function(modalName,insertIndex) {
            $scope.$broadcast('modalOpened', modalName);
            if(insertIndex==-1){
                vm.insertIndex=-1;
            }else{
                if(vm.insertIndex > -1){
                    vm.closeWidgetModal();
                }
            }
        }

        vm.widgetOptions = function (group) {
            switch (group) {
            case "client":
            case "clientRender":
                {
                    $('.clientInput').prop('disabled', false);
                    $('.clientResult').prop('disabled', true);
                    $('.server-widgets').hide();
                    $('.client-widgets').slideDown();
                }
                break;
            case "beforeRender":
                {
                       
                    $('.server-widgets').slideDown();
                    $('.client-widgets').hide(); 
                     $('.postAction').prop('disabled', true); 
                }
                break;
            case "postAction":
                {
                   
                    $('.server-widgets').slideDown();
                    $('.client-widgets').hide();
                    $('.postAction').prop('disabled', false);
                }
                break;
            case "clientResult":
                {
                    $('.clientInput').prop('disabled', true);
                    $('.clientResult').prop('disabled', false);
                    $('.server-widgets').hide();
                    $('.client-widgets').slideDown();
                }
                break;
            }
           DataHolder.setValue('currentWidgetOption',group);
        }


        //build payload for final saving
        function buildPayload() {
            var payload =  Object.assign({}, vm.model);
            payload.beforeRenderFlows = vm.beforeRenderFlows;
            payload.clientFlows = vm.clientFlows;
            payload.postActionsFlows = vm.postActionsFlows;
            payload.clientResultFlows = vm.clientResultFlows;
            return payload;
        }


        vm.deleteFlowItem = function (flowArrayName, index) {
            if (flowArrayName === 'clientFlows') {
                var flow = vm[flowArrayName][index];
                if (flow.flowItemType === 'inputForm') {
                    vm.model.inputFormPresent = false;
                }
            }
            vm[flowArrayName].splice(index, 1);
        }

        vm.getInputFields= function (flowArrayName, index) {
            var inputFlows = utils._.filter(vm.clientFlows, function (item) { return item.flowItemType; });
            var inputFields = [];
            for (var k = 0, len = inputFlows.length; k < len; k++) {
                inputFields.push.apply(inputFields,inputFlows[k].data.formControls)
            }
            return inputFields;
        }

        vm.editFlowItem = function (flowArrayName, index) {
            var itemToEdit = vm[flowArrayName][index];
            var controller = getControllerByFlowItemType(itemToEdit.flowItemType);
            console.log('The controller', controller);
            controller.openForEditting(itemToEdit);
            var eventData = {};
            eventData.isEditting = true;
            eventData.flowItem = itemToEdit;
            eventData.editIndex = index;
            eventData.modalName = controller.modalName;
            eventData.insertIndex = vm.insertIndex;
            $scope.$broadcast('modalOpened', eventData);
        }


        vm.insertFlowItemAtIndex = function (index) {
            vm.insertIndex = index;
            console.log('insertFlowItemAtIndex Opening .. widgetSelectModal ');
            $('#widgetSelectModal').modal('show');
            $scope.$broadcast('modalOpened', "widgetSelectModal");
        }


        vm.closeWidgetModal = function(){
            $('#widgetSelectModal').modal('hide');
        }

        vm.submitSupportTask = function (formValid) {
            vm.formSubmitted = true;
            if (true) {
                vm.errorMsg = [];
                var payload = buildPayload();
                services.createAdvancedTask(payload, function (response) {
                     if (response.status === "00") {
                        if (!isEditting) {
                            vm.model = { parameters: [] };
                            vm.beforeRenderFlows = [];
                            vm.clientFlows = [];
                            vm.postActionsFlows = [];
                            vm.clientResultFlows = [];
                        }
                        utils.alertSuccess(response.message);
                        vm.formSubmitted = false;
                    } else {
                        utils.alertError(response.message);
                    }
                }); 
            }
        }

        vm.init = function (id) {
            var payload = {};
            payload.taskId = id;
            services.getSuppotTaskInfo(payload, function (response) {
                 if (response.status === "00") {
                    vm.model = Object.assign(vm.model, response.data.supportTask);
                    vm.model.id = id;
                    isEditting = true;
                    response.data.taskFlows.forEach(function(taskFlow) {
                        addInitialFlow(taskFlow);
                    }); 
                }
            });
        } 

        function loadTopMenus() {
            services.getMenuList(function(response) {
                if (response.status === "00") {
                    vm.topMenus = response.data;
                }
            });
        }
        loadTopMenus();
        DataHolder.subscribeToSaveAlerts(vm.saveWidgetData);
        vm.widgetOptions('beforeRender');
        DataHolder.setParentFunctions(broadcastFunctions);
    }
})(window.jQuery);
