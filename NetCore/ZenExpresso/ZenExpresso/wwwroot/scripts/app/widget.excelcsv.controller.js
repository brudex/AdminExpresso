(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('ExcelCsvWidgetController', ExcelCsvWidgetController);
    ExcelCsvWidgetController.$inject = ['brudexutils', '$window', 'DataHolder','$scope'];
    function ExcelCsvWidgetController(utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.rowAction = {};
        vm.model = { description: '' }; 
        var isEditting = false;
        var editIndex = 0;
        vm.dataSources = [];
        var currentWidgetOption = '';
        vm.fileSources = [];
        vm.column = {};
        vm.dataProcessing = {};
        vm.modalName = 'excelCsvModal';
        vm.model = { columns: [], dataProcessing: [],fileType:'excel'};
        $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            console.log('vm.initDataModel >> ', data); 
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data;
            }
            var obj = { controlName: "Process Excel or Csv", flowItemType: 'excelCsvProcessing', flowGroup: currentWidgetOption, description: vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.openForEditting = function(flowItem) {
           $('#' + vm.modalName).modal('show');
        }

        vm.init = function () {
            vm.model = { columns: [], dataProcessing: [] };
            var parentActions = DataHolder.getParentFunctions();
            currentWidgetOption = DataHolder.getValue('currentWidgetOption'); 
            var controlIndex = parentActions.getFlowCounterIndex('excelCsvProcessing');
            vm.model.controlIdentifier = 'excelCsv' + controlIndex;
            vm.dataSources  = parentActions.getPostActionDataSources(); 
            vm.fileSources = parentActions.getPostActionDataSources('fileUploadServer');
            if (vm.fileSources.length) {
                vm.model.fileSource = vm.fileSources[0].key;
            }
        }

        function onModalOpen(event, data) {
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    isEditting = false;
                    vm.init();
                }
            } else {
                if (data.modalName === vm.modalName) {
                    vm.init();
                    if (data.isEditting) {
                        isEditting = true;
                        editIndex = data.editIndex;
                        vm.initDataModel(data.flowItem);
                    } else {
                        isEditting = false;
                    }
                }
            }
        }


        vm.addColumn = function () {
            vm.model.columns.push(vm.column);
            vm.column = {};
        }

        vm.deleteColumn = function (index) {
            vm.model.columns.splice(index, 1);
        }       

        vm.addRowProcessing = function () {
            for (var k = 0; k < vm.model.dataProcessing.length;k++) {
                if (vm.model.dataProcessing[k].flowName === vm.dataProcessing.flowName) {
                    utils.toastInfo("Item already added");
                    return;
                }
            }
            vm.model.dataProcessing.push(vm.dataProcessing);
            vm.dataProcessing = {};
        }

        vm.deleteRowProcessing = function (index) {
            vm.model.dataProcessing.splice(index, 1);
        }

       

        vm.saveData = function() {
            vm.model.error = {};
            vm.errorMsg = [];
            var obj = { controlName: "Process Excel or Csv", flowItemType: 'excelCsvProcessing', flowGroup: currentWidgetOption, description: vm.model.description, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('excelCsv', obj);
            vm.model = { description: '' };
        }


        function buildHtmlBindView() {
 
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<table class="table"><thead><tr><th>Column Name</th><th>Parameter Map</th>'+
             '</tr></thead><tbody>';
             vm.model.columns.forEach(function(button) {
                 html += '<tr><td>' +
                     button.title +
                     '</td><td>' +
                     button.parameter +
                     '</td></tr>';
             });
             html += '</tbody></table>';
            html += '</div>';
            html += '</div><br/>';
            return html;
        }

    }
    })(window.jQuery,window.hljs);
