(function () {
    'use strict';
    angular
        .module('app')
        .controller('SqlQueryWidgetController', SqlQueryWidgetController);
    SqlQueryWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder'];
    function SqlQueryWidgetController(services, utils, $window, DataHolder) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.validationScript = '';
        vm.model = { sqlQuery: '' };
        var isEditting = false;
        vm.formControls = []; 

        vm.saveData = function() {
            console.log('Checking validations >>>');
            vm.model.error = {};
            if(vm.model.sqlQuery)
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
