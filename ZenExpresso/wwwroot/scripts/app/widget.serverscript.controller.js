(function () {
    'use strict';
    angular
        .module('app')
        .controller('ServerScriptWidgetController', ServerScriptWidgetController);
    ServerScriptWidgetController.$inject = ['brudexutils', 'DataHolder','$scope','AceEditor'];
    function ServerScriptWidgetController(utils, DataHolder, $scope,AceEditor) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { code: '',language:'javascript'}; 
        var isEditting = false;
        var editIndex = 0;
        var editorElement = "serverCodeEditor1"
        vm.modalName = 'serverSideJavascriptModal';
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
            var obj = { controlName: 'Server Script', flowItemType: 'serverScript', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
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
            if (vm.model.code == null || vm.model.code ==='') {
                var errMsg='Enter '+vm.model.language+ ' Code'
                utils.toastError(errMsg);
                return;
            }
            console.log('Current Widget Option ', currentWidgetOption);
            var obj = { controlName: 'Server Script', flowItemType: 'serverScript', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('serverScript', obj);
            vm.model = { code: '',language:'javascript'};
        }

        function buildHtmlBindView() {
            var html = '<pre><code class="javascript">';
            html += vm.model.code;
            html += '</code></pre>';
            setTimeout(function () {
                document.querySelectorAll('pre code').forEach((block) => {
                    hljs.highlightBlock(block);
                });
            }, 2 * 1000);
            return html;
        }

        vm.init = function () {
            vm.model = { javascript: '',python:'',csharp:'',language:'javascript'};
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('serverScript');
            vm.model.controlIdentifier = 'serverScript' + controlIndex;
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            var flowsLength = parentActions.getParentModel().getFlowsByFlowGroup(currentWidgetOption).length;
            var code='//Your code will be embedded in a function with the following arguments\n' +
                '//Params : flowArray\n' +
                '//flowArray=Array of results from previous flows\n' +
                '//e.g. function generatedFunction(flowArray) {\n' +
                ' return x;//Always return a result to be passed to then next flow';
            AceEditor.initialize('javascript',editorElement,code,onEditorTextChange);
        }

        function onModalOpen(event, data) {
            console.log(typeof data);
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    console.log('Modal Opened >>>',vm.modalName);
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
        vm.changeMode = function () {
            var mode = vm.model.language;
            var code = '';
            if(mode ==='javascript'){
                code='//Your code will be embedded in a function with the following arguments\n' +
                '//Params : flowArray\n' +
                '//flowArray=Array of results from previous flows\n' +
                '//e.g. function generatedFunction(flowArray) {\n' +
                ' return x;//Always return a result to be passed to then next flow';
                
            }else if (mode==='csharp'){
                code='//Your code will be embedded in a function with the following arguments\n' +
                    '//Params : flowArray\n' +
                    '//flowArray=Array of results from previous flows\n' +
                    '//e.g. public dynamic generatedFunction(List<<TaskFlowItems> flowArray) {\n' +
                    ' return x;//Always return a result to be passed to then next flow';
            }else if (mode==='python'){
                code='#Your code will be embedded in a function with the following arguments\n' +
                    '#Params : flowArray\n' +
                    '#flowArray=Array of results from previous flows\n' +
                    '#e.g. def generatedFunction( flowArray) {\n' +
                    'return x;//Always return a result to be passed to then next flow';
            }
           AceEditor.setMode(mode,editorElement,code)
        }
        
        function onEditorTextChange(editorContent){
            vm.model.code=editorContent;
        }
       
    }
})();
