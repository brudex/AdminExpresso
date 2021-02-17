(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('SqlQueryWidgetController', SqlQueryWidgetController);
    SqlQueryWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function SqlQueryWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.validationScript = '';
        vm.model = { sqlQuery: ''};
        var isEditting = false;
        var editIndex = 0;
        vm.modalName = 'sqlModal';
        vm.formControls = [];
        var currentWidgetOption = '';
        $scope.$on('modalOpened', onModalOpen);


        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            if (data.flowData && typeof data.flowData==='string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
             } else {
                vm.model = data.data;
             } 
            var obj = { controlName: 'Sql Query', flowItemType: 'sqlQuery', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }

        vm.openForEditting = function (flowItem) {
             $('#'+vm.modalName).modal('show'); 
        }

        vm.saveData = function() {
            console.log('Checking validations >>>');
            vm.model.error = {};
            vm.errorMsg = [];
            if (vm.model.sqlQuery === '') {
                vm.errorMsg.push('Enter Sql Query');
            }
            if (vm.errorMsg.length) {
                return;
            }
            console.log('Current Widget Option ', currentWidgetOption);
            if (!(['beforeRender','postAction'].indexOf(currentWidgetOption) > -1)) {
                currentWidgetOption = 'postAction';
            }
            var obj = { controlName: 'Sql Query', flowItemType: 'sqlQuery', flowGroup: currentWidgetOption, controlIdentifier:vm.model.controlIdentifier};
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('sqlQuery', obj);
            vm.model = { sqlQuery: '' };
        } 


        vm.testConnection = function () {
            var payload = {};
            payload.dbusername = vm.model.dbusername;
            payload.dbPass = vm.model.dbPass;
            payload.taskType = vm.model.dataSource;
            services.testDbConnection(payload, function (response) {
                console.log("Connection Test Response >>", response);
                if (response.status === "00") {
                    utils.toastSuccess("Connection Successful");
                } else {
                    utils.toastError("Connection Failed");
                }
            });
        }

        function buildHtmlBindView() {
            var html = '<pre><code class="sql">';
            html +=  vm.model.sqlQuery ;
            html += '</code></pre>';
            setTimeout(function() {
                    document.querySelectorAll('pre code').forEach((block) => {
                        hljs.highlightBlock(block);
                    });
                }, 2*1000);
            return html;
        }

        vm.init = function () {
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var controlIndex = parentActions.getFlowCounterIndex('sqlQuery');
            vm.model.controlIdentifier = 'sqlQuery'+controlIndex;
            vm.formControls = [];
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            if (currentWidgetOption === 'postAction') {
                vm.formControls = parentActions.getParentModel().getInputFields();
            }
        }

        function onModalOpen(event, data) {
            console.log(typeof data);
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    vm.init();
                }
            } else {
                if(data.modalName === vm.modalName) {
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
})(window.jQuery,window.hljs);
