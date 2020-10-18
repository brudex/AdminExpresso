(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('AdvancedTaskFlowController', AdvancedTaskFlowController);
    AdvancedTaskFlowController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$sce'];
    function AdvancedTaskFlowController(services, utils, $window, DataHolder, $sce) {
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

        vm.trustAsHtml = function (html) {
            return $sce.trustAsHtml(html);
        }

        function addFlow(data) {
            console.log(JSON.stringify(data));
            switch (data.flowGroup) {
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
            console.log('Saving widget data >>>', data);
            addFlow(data); 
        }

        vm.onModalOpen = function(modalName) {
            console.log('Tracked model opened >>' + Date.now());
        }

        vm.saveInputValidation = function () {
            console.log('Validation and formatting');
            var obj = { controlName: "Validation and formatting", flowItemType: 'validationFormatting', flowGroup: 'client' };
            obj.data = vm.validationScript;
            addFlow(obj);
            vm.validationScript = '';
        }

        vm.saveSqlScript = function () {
            var obj = { controlName: "Sql Query", flowItemType: 'sqlSquery', flowGroup: 'postAction' };
            obj.data = vm.sqlQuery;
            addFlow(obj);
            vm.sqlQuery = '';
        }

        vm.widgetOptions = function (group) {
            switch (group) {
            case "client":
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

        vm.submitSupportTask = function (formValid) {
            vm.formSubmitted = true;
            if (true) {
                vm.errorMsg = [];
                //var result = $window.validate(vm.model, modelValidateConstraints, { format: "flat" });
                var payload = buildPayload();
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
            console.log('the task id is >>', id);
            var payload = {};
            payload.taskId = id;
            services.getSuppotTaskInfo(payload, function (response) {
                console.log('Support task result >>', response);
                if (response.status === "00") {
                    vm.model = Object.assign(vm.model, response.data);
                    vm.model.id = id;
                    isEditting = true;
                    services.getScriptParameters(payload, function (response) {
                        console.log('response from getscript params >>', response);
                        if (response.status === "00") {
                            vm.model.parameters = response.data;
                        }
                    });
                }
            });
        }

        var parameterValidateConstraints = {
            parameterLabel: {
                presence: true
            },
            parameterName: {
                presence: true
            },
            parameterType: {
                presence: true
            },
            parameterRegex: function (value, attributes, attributeName, options, constraints) {
                if (attributes.parameterType === 'regex') {
                    return {
                        presence: true
                    };
                }
                return false;
            }
        }

        var modelValidateConstraints = {
            taskName: {
                presence: true
            },
            description: {
                presence: true
            }, 
            taskType: {
                presence: true
            },
            taskResultType: {
                presence: true
            }, 
            dbusername: {
                presence: true
            },
            topLevelMenu: {
                presence: true
            }, 
            dbPass: {
                presence: true
            },
            sqlScript: {
                presence: true
            },
            jsScript: function (value, attributes, attributeName, options, constraints) {
                if (attributes.taskType === 'execJsResult') {
                    return {
                        presence: true
                    };
                }
                return false;
            }
        }
         
        vm.addSqlParameter = function () {
            vm.errorParameter = [];
            var result = $window.validate(vm.parameter,parameterValidateConstraints , { format: "flat" });
            if (result) {
                vm.errorParameter = result;
            } else {
                console.log('pushing result >>', vm.parameter);
                vm.model.parameters.push(vm.parameter);
                vm.parameter = {};
            }
        }

        vm.removeSqlParameter = function ($index) {
            vm.model.parameters.splice($index, 1);
        }
         

        vm.testConnection = function () {
            var payload = {};
            payload.dbusername = vm.model.dbusername;
            payload.dbPass = vm.model.dbPass;
            payload.taskType = vm.model.taskType;
            services.testDbConnection(payload,function (response) {
                if (response.status === "00") {
                    utils.alertSuccess("Connection Successful");
                } else {
                    utils.alertError("Connection Failed");
                } 
            });
        }

        function loadTopMenus() {
            services.getMenuList(function(response) {
                if (response.status === "00") {
                    console.log(response.data);
                    vm.topMenus = response.data;
                }
            });
        }
       
        loadTopMenus();
        DataHolder.subscribeToSaveAlerts(vm.saveWidgetData);
    }
})(window.jQuery);
