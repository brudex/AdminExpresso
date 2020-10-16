(function () {
    'use strict';
    angular
        .module('app')
        .controller('AssignGroupsController', AssignGroupsController);
    AssignGroupsController.$inject = ['brudexservices', 'brudexutils','$window'];
    function AssignGroupsController(services,utils,$window) {
        var vm = this;
        vm.errorMsg = [];
        vm.errorParameter = [];
        vm.successMsg = [];
        vm.supportGroups = [];
        vm.group = {};
        vm.singleUser = {};
        vm.model = { groups:[]};
        vm.formSubmitted = false;  

        vm.init = function (id) {
            console.log('the task id is >>', id);
            vm.model.id = id;
            loadActiveDirectoryGroups();
            loadTaskGroups(id);
        }
        
         
        vm.addGroup = function () {
            vm.group.groupType = 'Groups';
            console.log('pushing result >>', vm.group);
            if (vm.group.groupName != null && vm.group.groupName.trim() !== '') {
                vm.model.groups.push(vm.group);
                vm.group = {};
            }
            
        }

        vm.addSingleUser = function () {
            vm.singleUser.groupType = 'SingleUser';
            if (vm.singleUser.groupName != null && vm.singleUser.groupName.trim() !== '') {
                vm.model.groups.push(vm.singleUser);
                vm.singleUser = {};
            }
            
        }

        vm.removeGroup = function ($index) {
            vm.model.groups.splice($index, 1);
        }

        vm.submitGroups = function () {
            vm.formSubmitted = true;
            if (vm.model.groups.length) {
                services.saveSupportTaskGroup(vm.model, function(response) {
                    console.log(response);
                    if (response.status === "00") {
                        utils.alertSuccess(response.message);
                        vm.formSubmitted = false;
                    } else {
                        utils.alertError(response.message);
                    }
                });
            } else {
                utils.alertError("Add one or more groups");
            }
           
        }

        
        function loadActiveDirectoryGroups() {
            services.listActiveDirectoryGroups(function (response) {
               if (response.status === "00") {
                    console.log(response.data);
                    vm.supportGroups = response.data;
                }
            });
        }
       

        function loadTaskGroups(taskId) {
            services.getSupportTaskGroups(taskId,function (response) {
                console.log('loadTaskGroups >>', response);
                if (response.status === "00") {
                  vm.model.groups = response.data;
                }
            });
        }
        
    }
})();
