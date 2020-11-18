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
        var isEditting = false;
        vm.formControls = [];
        var modalName = 'restApiModal';
        var currentWidgetOption = '';
        $scope.$on('modalOpened', onModalOpen);

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
            var obj = { controlName: "Rest Api", flowItemType: 'rest', flowGroup: currentWidgetOption };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            DataHolder.saveData('rest', obj);
            vm.model = { headers: [], basicAuth: {} };
        }

        vm.init = function () {
            vm.formControls = [];
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            console.log('currentWidgetOption is >>' + currentWidgetOption);
            if (currentWidgetOption === 'postAction') {
                var inputForm = DataHolder.getData('inputForm'); //there can be only one input form
                if (inputForm) {
                    vm.formControls = inputForm.data.formControls;
                    console.log('Form controls populated');
                }
            }
        }

        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label>Method : ' + vm.model.method + ' </label><br/>';
            html += '<label>Content Type : ' + vm.model.contentType + ' </label><br/>';
            html += '</div>';
            html += '</div><br/>'; 
            html += '<pre><code class="json">';
            html += vm.model.body;
            html += '</code></pre>';
            setTimeout(function () {
                document.querySelectorAll('pre code').forEach((block) => {
                    hljs.highlightBlock(block);
                });
            }, 2 * 1000); 
            return html;
        }

        function onModalOpen(event, data) {
            console.log('The modal ame is >>>', modalName);
            if (data === modalName) {
                vm.init();
            }
        }
       
    }
})(window.jQuery,window.hljs);
