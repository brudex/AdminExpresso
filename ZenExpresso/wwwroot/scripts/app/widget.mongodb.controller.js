(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('MongoDbWidgetController', MongoDbWidgetController);
    MongoDbWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function MongoDbWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.validationScript = '';
        vm.model = { queryScript1: '', queryScript2:''};
        var isEditting = false;
        var editIndex = 0;
        vm.modalName = 'mongoDbModal';
        vm.formControls = [];
        var currentWidgetOption = '';
        $scope.$on('modalOpened', onModalOpen);
         
        vm.initDataModel = function (data) {
            vm.errorMsg = [];
            console.log('initDataModel >>The data>>', data);
            currentWidgetOption = data.flowGroup;
            if (data.flowData && typeof data.flowData==='string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
             } else {
                vm.model = data.data;
             } 
            var obj = { controlName: 'Mongodb Query', flowItemType: 'mongodb', flowGroup: currentWidgetOption, controlIdentifier: vm.model.controlIdentifier };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }

        vm.openForEditting = function (flowItem) {
             $('#'+vm.modalName).modal('show'); 
        }

        vm.saveData = function() {
            console.log('Checking validations >>>');
          
            vm.errorMsg = [];
            if (vm.model.operationType !== 'command') {
                if (vm.model.collection == null || vm.model.collection == '') {
                    vm.errorMsg.push('Enter name of collection');
                }
            }
            
            if (vm.model.operationType == null || vm.model.operationType == '') {
                vm.errorMsg.push('Select Operation Type');
            }
            if (vm.model.queryScript1 == '') {
                vm.errorMsg.push('Enter MongoDb Query');
            }
            if (vm.model.operationType === 'update') {
                if (vm.model.queryScript2 == '') {
                    vm.errorMsg.push('Enter Update Query');
                }
            }
            if (vm.model.dataSource == null || vm.model.dataSource == '' ) {
                vm.errorMsg.push('Select DataSource');
            }
            if (vm.errorMsg.length) {
                return;
            }
            console.log('Current Widget Option ', currentWidgetOption);
            if (!(['beforeRender','postAction'].indexOf(currentWidgetOption) > -1)) {
                currentWidgetOption = 'postAction';
            }
            var obj = { controlName: 'Mongodb Query', flowItemType: 'mongodb', flowGroup: currentWidgetOption, controlIdentifier:vm.model.controlIdentifier};
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            console.log('Saving Mongod data >>', obj);
            DataHolder.saveData('mongodb', obj);
            vm.model = { queryScript1: '', queryScript2: '' };
        } 


        vm.testConnection = function () {
            var payload = {};
            payload.dbusername = vm.model.dbusername;
            payload.dbPass = vm.model.dbPass;
            payload.taskType = vm.model.dataSource;
            payload.database = vm.model.database;
            console.log('The testMongodb connection', payload);
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
            var html = '<pre><code class="javascript">';
            html += vm.model.queryScript1 ;
            html += '</code></pre>';
            setTimeout(function() {
                    document.querySelectorAll('pre code').forEach((block) => {
                        hljs.highlightBlock(block);
                    });
                }, 2*1000);
            return html;
        }

        vm.init = function () {
            vm.errorMsg = [];
            var parentActions = DataHolder.getParentFunctions();
            var controlIndex = parentActions.getFlowCounterIndex('mongodb');
            vm.model.controlIdentifier = 'mongodb'+controlIndex;
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
                    console.log('Calling mongodb init>>>');
                    vm.init();
                }
            } else {
                if(data.modalName === vm.modalName) {
                    vm.init();
                    console.log('Called init >>', vm.modalName);
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
