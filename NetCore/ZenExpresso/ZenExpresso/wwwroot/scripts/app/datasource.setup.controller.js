(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('DataSourceSetupController', DataSourceSetupController);
    DataSourceSetupController.$inject = ['brudexservices', 'brudexutils', '$scope'];
    function DataSourceSetupController(services, utils, $scope) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.model = {};
        vm.list = [];
        vm.editMode = false;
        vm.init = function() {
            listDataSources();
        }

        function listDataSources() {
            services.getDataSources(function (response) {
                if (response.status === "00") {
                    vm.list = response.data;
                }
            });
        }

        vm.deleteDataSource = function (datasource) {
            utils.alertConfirm("Delete", "Confirm Delete :"+datasource.dataSourceName, function() {
                console.log('Search model', vm.model);
                var payload = datasource;
                services.deleteDataSource(payload, function (response) {
                    if (response.status === "00") {
                        utils.alertSuccess("", response.message);
                        vm.init();
                    }
                });
            });
        }

        vm.editDataSource = function (datasource) {
            vm.editMode = true;
            vm.model = datasource; 
        }

        vm.cancelEdit = function() {
            vm.editMode = false;
            vm.model = {};
        }

        vm.saveDataSource = function (formValid) {
            if (formValid) {
                var payload = vm.model;
                vm.editMode = false;
                services.saveDataSource(payload, function (response) {
                    if (response.status === "00") {
                        utils.alertSuccess("", response.message);
                        vm.init();
                        vm.model = {};
                    }
                });
            }
        }

        
        
    }
})(window.jQuery);
