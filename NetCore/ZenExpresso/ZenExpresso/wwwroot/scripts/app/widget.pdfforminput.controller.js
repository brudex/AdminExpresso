(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('PdfFormInputWidgetController', PdfFormInputWidgetController);
    PdfFormInputWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function PdfFormInputWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = {};
        vm.header = {};
        vm.formControls = [];
        vm.modalName = 'pdfFormInputModal';
        var currentWidgetOption = '';
        var isEditting = false;
        var editIndex = 0;
        $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            console.log('The initial data model for rest >>', data);
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data; 
            }
            console.log('The data model for rest >>', vm.model);
            var obj = { controlName: "Pdf Form Input", flowItemType: 'pdfform', flowGroup: data.flowGroup, controlIdentifier: vm.model.controlIdentifier};
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }


        vm.openForEditting = function (flowItem) {
            $('#' + vm.modalName).modal('show');
        }
         
        vm.addHeader = function () {
            vm.model.headers.push({});
        }
        vm.removeHeader = function (index) {
            vm.model.headers.splice(index, 1);
        } 

        vm.saveData = function () {
            if (!(['beforeRender', 'postAction'].indexOf(currentWidgetOption) > -1)) {
                currentWidgetOption = 'postAction';
            }
            var obj = {
                controlName: "Pdf Form Input", flowItemType: 'pdfform', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier};
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            DataHolder.saveData('pdfform', obj);
            vm.model = { headers: [], basicAuth: {} };
        }

        vm.init = function () { 
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('pdfform');
            vm.model.controlIdentifier = 'pdfForm' + controlIndex;
            vm.formControls = [];
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            if (currentWidgetOption === 'postAction') {
                 
                vm.formControls = parentActions.getParentModel().getInputFields();  
                 
            }
        }

        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label>Template File : ' + vm.model.templateFile + ' </label><br/>';
            html += '<label>File Name Prefix : ' + vm.model.filePrefix + ' </label><br/>';
            html += '<label>File Date Format : ' + vm.model.fileDateFormat + ' </label><br/>';
            html += '</div>';
            html += '</div><br/>'; 
            if (vm.model.method !== 'GET') {
                html += '<pre><code class="json">';
                html += vm.model.inputMap;
                html += '</code></pre>';
                setTimeout(function () {
                    document.querySelectorAll('pre code').forEach((block) => {
                        hljs.highlightBlock(block);
                    });
                }, 2 * 1000); 
            }
            console.log('Returning html >>>' + html);
            return html;
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
                    console.log('initialized');
                    if (data.isEditting) {
                        isEditting = true;
                        editIndex = data.editIndex;
                        vm.initDataModel(data.flowItem);
                    }
                }
            }
        }
       
    }
})(window.jQuery,window.hljs);
