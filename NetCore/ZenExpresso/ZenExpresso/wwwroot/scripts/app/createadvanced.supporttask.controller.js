(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('CreateAdvancedTaskController', CreateAdvancedTaskController);
    CreateAdvancedTaskController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder', '$sce', '$scope','$controller'];
    function CreateAdvancedTaskController(services, utils, $window, DataHolder, $sce, $scope, $controller) {
        var vm = this;
        vm.errorMsg = [];
        vm.errorParameter = []; 
        vm.beforeRenderFlows = [];
        vm.clientFlows = [];
        vm.postActionsFlows = [];
        vm.clientResultFlows = [];
        vm.successMsg = [];
        vm.topMenus = [];
        vm.model = {parameters:[]};
        vm.formSubmitted = false;
        vm.parameter = {};
        var isEditting = false;
        var flowsIncrementer = {}

        var broadcastFunctions = {
            getFlowCounterIndex: getFlowCounterIndex,
            getBeforeRenderDataSources: getBeforeRenderDataSources
        };


        vm.trustAsHtml = function (html) {
            return $sce.trustAsHtml(html);
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
            vm.beforeRenderFlows.forEach(function(item) {
                array.push({ key: item.controlIdentifier, dataSourceName: item.controlIdentifier, inputFormat: item.flowItemType,isFlowItem:true });
            });
            return array;
        }

        function getControllerByFlowItemType(flowItemType) {
            var dict = {
                'inputForm': 'ClientInputWidgetController',
                'sqlQuery': 'SqlQueryWidgetController',
                'successMessage': 'SuccessMessageWidgetController',
                'tableResult': 'TableResultWidgetController',
                'rest': 'RestApiWidgetController'
            }
            return $controller(dict[flowItemType], { $scope: $scope });
        }

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
                    vm.clientFlows.push(data);
                    break;
                case "beforeRender":
                    vm.beforeRenderFlows.push(data);
                    break;
                case "postAction":
                    vm.postActionsFlows.push(data);
                    break;
                case "clientResult":
                    vm.clientResultFlows.push(data);
                    break;
            }
        }

        vm.saveWidgetData = function (key, data) {
            addFlow(data); 
        }

        vm.onModalOpen = function(modalName) {
            $scope.$broadcast('modalOpened', modalName);
        }
         
        vm.widgetOptions = function (group) {
            switch (group) {
            case "client":
            case "clientRender":
                {
                    $('.clientInput').removeClass('disabled');
                    $('.clientResult').addClass('disabled');
                    $('.server-widgets').hide();
                    $('.client-widgets').slideDown();
                }
                break;
            case "beforeRender":
                {
                    $('.server-widgets').slideDown();
                    $('.client-widgets').hide(); 
                }
                break;
            case "postAction":
                {
                    $('.server-widgets').slideDown();
                    $('.client-widgets').hide();
                }
                break;
            case "clientResult":
                {
                    $('.clientInput').addClass('disabled');
                    $('.clientResult').removeClass('disabled');
                    $('.server-widgets').hide();
                    $('.client-widgets').slideDown();
                }
                break;
            }
           DataHolder.setValue('currentWidgetOption',group);
        }

        function buildPayload() {             
            var payload =  Object.assign({}, vm.model);
            payload.beforeRenderFlows = vm.beforeRenderFlows;
            payload.clientFlows = vm.clientFlows;
            payload.postActionsFlows = vm.postActionsFlows;
            payload.clientResultFlows = vm.clientResultFlows;
            return payload;
        }


        vm.deleteFlowItem = function(flowArrayName,index) {
            vm[flowArrayName].splice(index, 1);
        }

        vm.editFlowItem = function (flowArrayName, index) {
            var itemToEdit = vm[flowArrayName][index];
            var controller = getControllerByFlowItemType(itemToEdit.flowItemType);
            console.log('The controller', controller);
            controller.openForEditting(itemToEdit);
            var eventData = {};
            eventData.isEditting = true;
            eventData.flowItem = itemToEdit;
            eventData.modalName = controller.modalName;
            $scope.$broadcast('modalOpened', eventData);
        }

        vm.submitSupportTask = function (formValid) {
            vm.formSubmitted = true;
            if (true) {
                vm.errorMsg = [];
                var payload = buildPayload();
                console.log('The payload is >>', payload);
                services.createAdvancedTask(payload, function (response) {
                    console.log(response);
                    if (response.status === "00") {
                        if (!isEditting) {
                            vm.model = { parameters: [] };
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
