(function () {
    'use strict';
    angular
        .module('app')
        .controller('JavascriptWidgetController', JavascriptWidgetController);
    JavascriptWidgetController.$inject = ['brudexutils', 'DataHolder','$scope','AceEditor'];
    function JavascriptWidgetController(utils, DataHolder, $scope,AceEditor) {
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
            vm.model = { jsScript: '', runMode: 'onRender' };
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
            vm.model = { jsScript: '', runMode: 'onRender' };
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('javascript');
            vm.model.controlIdentifier = 'jsScript' + controlIndex;
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            var flowsLength = parentActions.getParentModel().getFlowsByFlowGroup(currentWidgetOption).length;
            if (parentActions.inputFormAdded()) {
                vm.model.runMode = 'onSubmit';
            } else if (flowsLength === 0) {
                vm.model.runMode = 'onRender';
            } else {
                vm.model.runMode = 'followFlow';
            }
            var code ='/**Your code will be embedded in a function with the following arguments **/\n' +
                '    //flowArray=Array of outputs results from previously executed flows\n' +
                '    //formInput=Form input field values in json e.g. formInput.age,formInput.firstname\n' +
                '    //utils=utils.alertSuccess, utils.alertError,utils.alertConfirm, utils.sweetAlert, utils.toastr, utils._ (lodash)\n' +
                '    //next=next(null,[result of script execution]) if no error OR next("Error message") \n' +
                '    //if error (prevents form submission with error message shown to user)\n' +
                '    function(flowArray, formInput, utils, next)\n' +
                '    {  \n' +
                '      //put your code in the box below\n\n' +
                '    }'
            AceEditor.initialize('javascript',"jsCodeEditor",code,onEditorTextChange);
        }

        function onEditorTextChange(editorContent){
            vm.model.jsScript=editorContent;
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
                    } else {
                        isEditting = false;
                    }
                }  
            }
        }
        
        
       
    }
})();
