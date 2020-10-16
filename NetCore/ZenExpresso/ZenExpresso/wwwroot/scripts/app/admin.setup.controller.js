(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('AdminSetupController', AdminSetupController);
    AdminSetupController.$inject = ['brudexservices', 'brudexutils', '$scope'];
    function AdminSetupController(services, utils, $scope) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.model = {  };
        vm.list = [];
        vm.init = function() {
            listAdmins();
        }

        function listAdmins() {
            services.getAdminList(function (response) {
                if (response.status === "00") {
                    vm.list = response.data;
                }
            });
        }

        vm.deleteAdmin = function (admin) {
            utils.alertConfirm("Delete", "Confirm Delete", function() {
                
                var payload = admin;
                services.deleteMenu(payload, function(response) {
                    if (response.status === "00") {
                        vm.searchResults = response.data;
                        utils.alertSuccess("", response.message);
                        vm.init();
                    }
                });
            });
        }

        vm.addAdmin = function (formValid) {
            if (formValid) {
                var payload = vm.model;
                services.addAdmin(payload, function (response) {
                    if (response.status === "00") {
                        vm.searchResults = response.data;
                        utils.alertSuccess("", response.message);
                        vm.init();
                    }
                });
            }
        }

        
        
    }
})(window.jQuery);
