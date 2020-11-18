(function () {
    'use strict';
    angular
        .module('app')
        .controller('CreateSupportTaskController', CreateSupportTaskController);
    CreateSupportTaskController.$inject = ['brudexservices', 'brudexutils','$window'];
    function CreateSupportTaskController(services,utils,$window) {
        var vm = this;
        vm.errorMsg = [];
        vm.errorParameter = [];
        vm.successMsg = [];
        vm.topMenus = [];
        vm.model = {parameters:[]};
        vm.formSubmitted = false;
        vm.parameter = {};
        var isEditting = false;

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

        vm.submitSupportTask = function (formValid) {
            vm.formSubmitted = true;
            if (formValid) {
                vm.errorMsg = [];
                var result = $window.validate(vm.model, modelValidateConstraints, { format: "flat" });
                console.log('pushing result >>', result);
                if (result) {
                    vm.errorMsg = result;
                } else {
                    console.log('The model is >>', vm.model);
                    services.createSupportTask(vm.model, function (response) {
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
       
    }
})();
