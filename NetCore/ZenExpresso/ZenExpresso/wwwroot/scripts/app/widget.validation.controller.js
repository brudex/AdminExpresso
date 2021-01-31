﻿(function () {
    'use strict';
    angular
        .module('app')
        .controller('ValidationFormattingWidgetController', ValidationFormattingWidgetController);
    ValidationFormattingWidgetController.$inject = ['brudexutils', 'DataHolder','$scope'];
    function ValidationFormattingWidgetController(utils, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { jsScript: '', runMode:'onRender' }; //onRender, onSubmit
        var isEditting = false;
        var editIndex = 0;
        vm.modalName = 'validationFormatingModal';
        var currentWidgetOption = '';
        $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data;
            }
            var obj = { controlName: 'Javascript Validation', flowItemType: 'javascript', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }

        vm.openForEditting = function (flowItem) {
            //restApiModal, #outputTransformModal, tabularOutputModal, inputFormModal, validationFormatingModal, successMessageOutputModal
            $('#' + vm.modalName).modal('show');
        }

        vm.saveData = function () {
            console.log('Checking validations >>>');
            vm.model.error = {};
            vm.errorMsg = [];
            if (vm.model.jsScript === '') {
                vm.errorMsg.push('Enter Javascript ');

            }
            if (vm.errorMsg.length) {
                utils.toastError(vm.errorMsg.join(",\n"));
                return;
            }
            console.log('Current Widget Option ', currentWidgetOption);
            if (!(['clientRender', 'clientResult'].indexOf(currentWidgetOption) > -1)) {
                currentWidgetOption = 'clientRender';
            }
            var obj = { controlName: 'Javascript Validation', flowItemType: 'javascript', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('javascript', obj);
            vm.model = { jsScript: '' };
        }

 

        function buildHtmlBindView() {
            var html = '<pre><code class="javascript">';
            html += vm.model.jsScript;
            html += '</code></pre>';
            setTimeout(function () {
                document.querySelectorAll('pre code').forEach((block) => {
                    hljs.highlightBlock(block);
                });
            }, 2 * 1000);
            return html;
        }

        vm.init = function () {
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('javascript');
            vm.model.controlIdentifier = 'jsScript' + controlIndex;
            vm.formControls = [];
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            
                var inputForm = DataHolder.getData('inputForm'); //there can be only one input form
                if (inputForm) {
                    vm.formControls = inputForm.data.formControls;
                    console.log('Form controls populated');
                }
            
        }

        function onModalOpen(event, data) {
            console.log(typeof data);
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    vm.init();
                }
            } else {
                if (data.modalName === vm.modalName) {
                    vm.init();
                    if (data.isEditting) {
                        isEditting = true;
                        editIndex = data.editIndex;
                        vm.initDataModel(data.flowItem);
                    }
                }
            }

        }
       
    }
})();
