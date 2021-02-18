(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('MenuSetupController', MenuSetupController);
    MenuSetupController.$inject = ['brudexservices', 'brudexutils', '$scope'];
    function MenuSetupController(services, utils, $scope) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.model = {  };
        vm.list = [];
        vm.init = function() {
            listMenus();
        }

        function listMenus() {
            services.getMenuList(function (response) {
                if (response.status === "00") {
                    vm.list = response.data;
                }
            });
        }

        vm.deleteMenu = function (Menu) {
            utils.alertConfirm("Delete", "Confirm Delete", function() {
                console.log('Search model', vm.model);
                var payload = Menu;
                services.deleteMenu(payload, function(response) {
                    if (response.status === "00") {
                        vm.searchResults = response.data;
                        utils.alertSuccess("", response.message);
                        vm.init();
                    }
                });
            });
        }

        vm.addMenu = function (formValid) {
            if (formValid) {
                var payload = vm.model;
                payload.menuOrder = ((vm.list.length) +1)
                services.addMenu(payload, function (response) {
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
