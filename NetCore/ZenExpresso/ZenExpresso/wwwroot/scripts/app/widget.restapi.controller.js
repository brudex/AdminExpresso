(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('RestApiWidgetController', RestApiWidgetController);
    RestApiWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function RestApiWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { headers: [], basicAuth: {} };
        vm.header = {};
        vm.formControls = [];
        vm.modalName = 'restApiModal';
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
            var obj = { controlName: "Rest Api", flowItemType: 'rest', flowGroup: data.flowGroup };
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
            if (!(['beforeRender', 'postAction'].indexOf(currentWidgetOption) > -1)) {
                currentWidgetOption = 'postAction';
            }
            var obj = { controlName: "Rest Api", flowItemType: 'rest', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier};
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            DataHolder.saveData('rest', obj);
            vm.model = { headers: [], basicAuth: {} };
        }

        vm.init = function () { 
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('rest');
            vm.model.controlIdentifier = 'restApi' + controlIndex;
            vm.formControls = [];
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            if (currentWidgetOption === 'postAction') {
                var inputForm = DataHolder.getData('inputForm'); //there can be only one input form
                if (inputForm) {
                    vm.formControls = inputForm.data.formControls;
                }
            }
        }

        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label>Url : ' + vm.model.resturl + ' </label><br/>';
            html += '<label>Method : ' + vm.model.method + ' </label><br/>';
            html += '<label>Content Type : ' + vm.model.contentType + ' </label><br/>';
            html += '</div>';
            html += '</div><br/>'; 
            if (vm.model.method !== 'GET') {
                html += '<pre><code class="json">';
                html += vm.model.body;
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
            console.log('The event data received is >>>', data);
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
       
    }
})(window.jQuery,window.hljs);
