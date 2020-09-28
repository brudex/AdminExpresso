(function () {
    'use strict';
    angular
        .module('app')
        .controller('RestApiWidgetController', RestApiWidgetController);
    RestApiWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder'];
    function RestApiWidgetController(services, utils, $window, DataHolder) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { headers: [], basicAuth: {} };
        vm.header = {};
        var isEditting = false;
        vm.formControls = [];
        vm.addHeader = function () {
            vm.model.headers.push({});
        }
        vm.removeHeader = function (index) {
            vm.model.headers.splice(index, 1);
        } 

        vm.saveData = function () {
            console.log('Checking validations >>>');
            vm.model.headers.forEach(function (item) {
                vm.errorMsg = [];
                item.error = {};
                if (_.isEmpty(item.headerKey)) {
                    item.error.headerKey = true;
                    vm.errorMsg.push('Header Keys must be filled');
                }
                if (_.isEmpty(item.headerValue)) {
                    item.error.headerValue = true;
                    vm.errorMsg.push('Header Values must be filled');
                } 
            });
            if (vm.errorMsg.length) {
                return;
            }
            var obj = { controlName: "Input Form", flowItemType: 'inputForm', flowGroup: 'client' };
            obj.data = { formControls: vm.formControls, dataSources: vm.dataSources };
            DataHolder.saveData('server', obj);
            vm.model = { headers: [], basicAuth: {} };
        }
         
       
    }
})();
