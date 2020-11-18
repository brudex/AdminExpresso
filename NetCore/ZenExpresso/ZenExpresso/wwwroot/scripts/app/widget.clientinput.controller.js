(function () {
    'use strict';
    angular
        .module('app')
        .controller('ClientInputWidgetController', ClientInputWidgetController);
    ClientInputWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function ClientInputWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.dataSource = {};
        vm.dataSources = [];
        vm.dataSourceEditIndex = -1;
        vm.parameter = {};
        var modalName = 'inputFormModal';
        vm.isEdittingDataSource = false;
        var isEditting = false;
        vm.formControls = [];

        $scope.$on('modalOpened', onModalOpen);

        function onModalOpen(event, data) {
            console.log('The modal ame is >>>', modalName);
            if (data === modalName) {
                vm.init();
            }
        }

        vm.init = function() {
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var dataSources = parentActions.getBeforeRenderDataSources();
            if (dataSources.length) {
                dataSources.forEach(function(dt) {
                    vm.dataSources.push(dt);
                });
            }
        }

        vm.addFormControl = function () {
            vm.formControls.push({error: {} });
        }
        vm.removeFormControl = function (index) {
            vm.formControls.splice(index, 1);
        }
       
        vm.addDataSource = function () {
            vm.dataSource.key = _.uniqueId();
            vm.isFlowItem = false;
            vm.dataSources.push(vm.dataSource);
            vm.dataSource = {};
        }

        vm.removeDataSource = function (index) {
            vm.dataSources.splice(index, 1);
        }

        vm.editDataSource = function (index) {
            vm.dataSource = vm.dataSources[index];
            vm.isEdittingDataSource = true;
            vm.dataSourceEditIndex = index;
        }

        vm.saveDataSource = function () {
            vm.dataSources[vm.dataSourceEditIndex] = Object.assign({}, vm.dataSource);
            vm.dataSource = {};
            vm.dataSourceEditIndex = -1;
            vm.isEdittingDataSource = false;
        }

        vm.saveFormInputControls = function () {
            console.log('Checking validations >>>');
            vm.formControls.forEach(function (item) {
                vm.errorMsg = [];
                if (_.isEmpty(item.fieldName)) {
                    item.error.fieldName = true;
                    vm.errorMsg.push('fieldName');
                }
                if (_.isEmpty(item.fieldLabel)) {
                    item.error.fieldLabel = true;
                    vm.errorMsg.push('fieldLabel');
                }
                if (_.isEmpty(item.fieldType)) {
                    item.error.fieldType = true;
                    vm.errorMsg.push('fieldType');
                }
                if (_.isEmpty(item.validation)) {
                    item.error.validation = true;
                    vm.errorMsg.push('validation');
                } 
            });
            if (vm.errorMsg.length) {
                return;
            }
            console.log('Saving form inputs>>>');
            var obj = { controlName: "Input Form", flowItemType: 'inputForm', flowGroup: 'client' };
            obj.data = { formControls: vm.formControls, dataSources: vm.dataSources };
            obj.htmlbind = buildHtmlBindView();
            DataHolder.saveData('inputForm', obj);
            vm.formControls = [];
        }

        function buildHtmlBindView() {
            var html = '';
            html += '<table class="table">';
            html += '<tr>';
            html += '<th>FieldLabel </th>';
            html += '<th>FieldName</th>';
            html += '<th>FieldType</th>';
            html += '<th>Validation</th>';
            html += '<tr>';
            vm.formControls.forEach(function(item) {
                html += '<tr>';
                html += '<td>'+item.fieldLabel+'</td>';
                html += '<td>' + item.fieldName +'</td>';
                html += '<td>' + item.fieldType +'</td>';
                html += '<td>' + item.validation +'</td>';
                html += '<tr>'; 
            });
            html += '<table>';
            return html;
        }
       
    }
})();
