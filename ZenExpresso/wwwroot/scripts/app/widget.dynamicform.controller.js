(function () {
    'use strict';
    angular
        .module('app')
        .controller('DynamicFormWidgetController', DynamicFormWidgetController);
    DynamicFormWidgetController.$inject = ['brudexutils', 'DataHolder','$scope'];
    function DynamicFormWidgetController( utils, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.dataSource = {};
        vm.initialFormDataSources = [];
        vm.dataSources = [];
        vm.validationScripts = [];
        vm.description ='';
        vm.controlDataSource = "_none_";
        vm.dataSourceEditIndex = -1;
        vm.parameter = {};
        vm.model = {};
        vm.script = {}
        vm.modalName = 'dynamicFormModal';
        vm.isEdittingDataSource = false;
        var isEditting = false;
        var editIndex = 0;
        vm.formControls = [];
        $scope.$on('modalOpened', onModalOpen); 

        vm.initDataModel = function (data) {
            console.log("vm.initDataModel>>>", data);
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
                 vm.dataSources = [];
            } else {
                vm.model = data.data; 
            }
            var obj = { controlName: "Dynamic Input Form", flowItemType: 'dynamicForm', flowGroup: 'client' };
            obj.data = vm.model;
            obj.isEditting = isEditting;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }

        vm.openForEditting = function (flowItem) {
            $('#' + vm.modalName).modal('show');
        }

        function onModalOpen(event, data) {
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    vm.init();
                }
            } else {
                 if (data.modalName === vm.modalName) {
                    vm.init();
                    console.log('initialized');
                    if (data.isEditting) {
                        isEditting = true;
                        editIndex = data.editIndex;
                        console.log('Editting data>>', data.flowItem);
                        vm.initDataModel(data.flowItem);
                    }
                }
            }
        }

        vm.init = function() {
            var parentActions = DataHolder.getParentFunctions();
            vm.initialFormDataSources = parentActions.getBeforeRenderDataSources();
            console.log('vm.initialFormDataSources>>>', vm.initialFormDataSources);
            vm.dataSources = [];
            if (vm.initialFormDataSources.length) {
                vm.initialFormDataSources.forEach(function(dt) {
                    vm.dataSources.push(dt.key);
                });
                console.log('The datasources>>', vm.dataSources);
            }
            vm.model = { controlName: "Dynamic Input Form", flowItemType: 'dynamicForm', flowGroup: 'client' };
         }


        vm.saveFormInputControls = function () {
            vm.errorMsg = [];
            if(!isEditting) {
                var parentActions = DataHolder.getParentFunctions();
                if (parentActions.inputFormAdded()) {
                    vm.errorMsg.push('Input form already present. There can be only one input form');
                }
            }
            if (vm.errorMsg.length) {
                return;
            }
            var obj = { controlName: "Dynamic Input Form", flowItemType: 'dynamicForm', flowGroup: 'client' };
            obj.data = vm.model;
            if (vm.onSucessResult === 'removeForm') {
                obj.data.removeOnResult = true;
            }
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('dynamicForm', obj);
            vm.formControls = [];
        } 
        

        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label> Description : ' + vm.model.description + ' </label><br/>';
            html += '<label> DataSource  : ' + vm.model.controlDataSource + ' </label><br/>';
            html += '<label> On Form Submit  : ' + vm.model.onSuccessResult + ' </label><br/>';
            html += '<label> DataSource Format  : ' + vm.model.dataSourceFormat + ' </label><br/>';
            html += '</div>';
            html += '</div>';
            return html;
        }

    }
})();
