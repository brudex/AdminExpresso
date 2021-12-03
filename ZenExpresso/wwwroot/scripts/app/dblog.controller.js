(function () {
    'use strict';
    angular
        .module('app')
        .controller('DbLogController', DbLogController);
    DbLogController.$inject = ['brudexservices', 'brudexutils'];
    function DbLogController(services,utils) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.model = {searchFields:[]};
        vm.databases = [];
        vm.tables = [];
        vm.columns = [];
        vm.listDatabases = function () {
            var payload = vm.model;
            services.listDatabases(payload, function (response) {
                console.log("Response from connect db >>", response);
                vm.databases = response; 
            });
        }

        vm.listTables = function () {
            var payload = vm.model;
            services.listTables(payload, function (response) {
                console.log("Response from tables db >>", response);
                vm.tables = response;
            });
        }
        vm.listTableColumns = function () {
            var payload = vm.model;
            services.listTableColumns(payload, function (response) {
                console.log("Response from columns db >>", response);
                vm.columns = response;
            });
        }

        vm.toggleSelection = function toggleSelection(searchField) {
            var idx = vm.model.searchFields.indexOf(searchField);
             
            if (idx > -1) {
                vm.model.searchFields.splice(idx, 1);
            } 
            else {
                vm.model.searchFields.push(searchField);
            }
        };

        vm.submitLogToManage = function (formValid) {
            console.log('The form is valid is >>>', formValid);
            if (formValid) {
                services.submitLogToManage(vm.model,function (response) {
                  console.log(response);
                    if (response.status === "00") {
                        utils.alertSuccess(response.message);
                    } else {
                        utils.alertError(response.message);
                    }
                });
            }
        }
    }
})();
