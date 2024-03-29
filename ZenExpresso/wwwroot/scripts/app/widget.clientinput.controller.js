﻿(function () {
    'use strict';
    angular
        .module('app')
        .controller('ClientInputWidgetController', ClientInputWidgetController);
    ClientInputWidgetController.$inject = ['brudexutils', 'DataHolder','$scope'];
    function ClientInputWidgetController( utils, DataHolder, $scope) {
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
        vm.script = {}
        vm.modalName = 'inputFormModal';
        vm.isEdittingDataSource = false;
        var isEditting = false;
        var editIndex = 0;
        vm.formControls = [];
        $scope.$on('modalOpened', onModalOpen); 

        vm.initDataModel = function (data) {
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.formControls = initData.formControls;
                vm.description=initData.description;
                vm.dataSources = initData.dataSources;
                vm.controlDataSource = initData.controlDataSource;
                vm.onSuccessResult = initData.onSuccessResult;
                vm.validationScripts = initData.validationScripts;
            } else {
                vm.formControls = data.data.formControls;
                vm.dataSources = data.data.dataSources;
                vm.description=data.data.description;
                vm.controlDataSource = data.data.controlDataSource;
                vm.onSuccessResult = data.data.onSuccessResult;
                vm.validationScripts = data.data.validationScripts;
            }
            var obj = { controlName: "Input Form", flowItemType: 'inputForm', flowGroup: 'client' };
            obj.data = { formControls: vm.formControls, dataSources: vm.dataSources,onSuccessResult:vm.onSuccessResult,validationScripts:vm.validationScripts,controlDataSource: vm.controlDataSource };
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
                        vm.initDataModel(data.flowItem);
                    }
                }
            }
        }

        vm.init = function() {
            var parentActions = DataHolder.getParentFunctions();
            vm.initialFormDataSources = parentActions.getBeforeRenderDataSources();
            if (vm.initialFormDataSources.length) {
                vm.initialFormDataSources.forEach(function(dt) {
                    var existing = vm.dataSources.filter(d => d.key==dt.key);
                    if(existing.length==0){
                        vm.dataSources.push(dt);
                    }
                });
            }
        }

        vm.addFormControl = function (index) {
            if(index==null){
                vm.formControls.push({validation:"_none_",error: {}, required:true });
                return;
            }
            vm.formControls.splice(index,0,{validation:"_none_",error: {}, required:true });
        }

        vm.removeFormControl = function (index) {
            vm.formControls.splice(index, 1);
        }

        vm.addDataSource = function () {
            vm.dataSource.key = _.uniqueId();
            vm.isFlowItem = false;
            vm.dataSources.push(Object.assign({},vm.dataSource));
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


        vm.addFormScript = function () {
            vm.script.key = _.uniqueId();
            vm.validationScripts.push(Object.assign({}, vm.script));
            vm.script = {};
        }
        vm.editFormScript = function (index) {
            vm.script = vm.validationScripts[index];
            vm.isEdittingScript = true;
            vm.scriptEditIndex = index;
        }

        vm.saveFormScript = function () {
            vm.validationScripts[vm.scriptEditIndex] = Object.assign({}, vm.script);
            vm.script = {};
            vm.scriptEditIndex = -1;
            vm.isEdittingScript = false;
        } 

        vm.removeFormScript = function (index) {
            vm.validationScripts.splice(index, 1);
        }



        vm.saveFormInputControls = function () {
            vm.errorMsg = [];
            vm.formControls.forEach(function (item) {
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

            if (!isEditting) {
                var parentActions = DataHolder.getParentFunctions();
                if (parentActions.inputFormAdded()) {
                    vm.errorMsg.push('Input form already present. There can be only one input form');
                }
            }
            if (vm.errorMsg.length) {
                return;
            }
            var obj = { controlName: "Input Form", flowItemType: 'inputForm', flowGroup: 'client' };
            obj.data = { formControls: vm.formControls, dataSources: vm.dataSources, controlDataSource: vm.controlDataSource, description: vm.description, onSuccessResult: vm.onSuccessResult, validationScripts: vm.validationScripts};
            if (vm.onSucessResult === 'removeForm') {
                obj.data.removeOnResult = true;
            }
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;

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
