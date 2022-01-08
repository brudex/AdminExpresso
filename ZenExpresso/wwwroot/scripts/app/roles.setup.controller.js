(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('RoleSetupController', RoleSetupController);
    RoleSetupController.$inject = ['brudexservices', 'brudexutils', '$scope'];
    function RoleSetupController(services, utils, $scope) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.taskId = 0;
        vm.tasks = [];
        vm.list = [];
        vm.userName='';
        vm.init = function(userName) {
            vm.userName= userName;
            listRoles();
            getAllTasks();
        }

        function listRoles() {
            var payload = {
                userName: vm.userName
            }
            services.userAssignedTasks(payload,function (response) {
                console.log('User Roles responses>>', response);
                if (response.status === "00") {
                    vm.list = response.data;
                }
            });
        }

        function getAllTasks() {
            services.getAllSupportTasksLite(function (response) {
                 if (response.status === "00") {
                    vm.tasks = response.data;
                }
            });
        }

        vm.deleteRole = function (task) {
            utils.alertConfirm("Delete", "Confirm Delete", function() {
                 
                var payload = {userName :vm.userName,taskId:task.id};
                 services.deleteUserRole(payload, function(response) {
                    if (response.status === "00") {
                        vm.searchResults = response.data;
                        utils.alertSuccess("", response.message);
                        listRoles()
                    }
                });
            });
        }

        vm.addRole = function (task) {
            var payload = {userName :vm.userName,taskId:vm.taskId};
            console.log('The payload >>>',payload);
            services.assignTaskToUser(payload, function (response) {
                if (response.status === "00") {
                    utils.alertSuccess("", response.message);
                    listRoles();
                }
            });
        }

         
        
        
    }
})(window.jQuery);
