(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('LinkButtonWidgetController', LinkButtonWidgetController);
    LinkButtonWidgetController.$inject = ['brudexutils', '$window', 'DataHolder','$scope'];
    function LinkButtonWidgetController(utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.rowAction = {};
        vm.model = { description: '' }; 
        var isEditting = false;
        var editIndex = 0;
        vm.dataSources = [];
        var currentWidgetOption = '';
        vm.supportTasks =[];
        vm.modalName = 'linkButtonModal';
        vm.model = {};
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
            var obj = { controlName: "Button ", flowItemType: 'linkButton', flowGroup: currentWidgetOption, description: vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.openForEditting = function(flowItem) {
           $('#' + vm.modalName).modal('show');
        }

        vm.init = function () {
            vm.model = {};
            var parentActions = DataHolder.getParentFunctions();
            if(!vm.supportTasks.length) {
                parentActions.getAllSupportTasks(function(tasks) {
                    vm.supportTasks = tasks;
                });
            }
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            var dataSources = [];
            vm.dataSources = [];
            if (currentWidgetOption === 'client') {
                dataSources = parentActions.getBeforeRenderDataSources();
            } else {
                dataSources = parentActions.getPostActionDataSources();
            }
            vm.dataSources.push({key:"static",dataSourceName:"Static file link"});
            if (dataSources.length) { 
                dataSources.forEach(function (dt) {
                    vm.dataSources.push({key:dt.key,dataSourceName:"TaskFlow Output - "+dt.dataSourceName});
                });
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

        vm.saveData = function() {
            vm.model.error = {};
            vm.errorMsg = [];
            var obj = { controlName: "Button ", flowItemType: 'linkButton', flowGroup: currentWidgetOption, description:vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('fileDownload', obj);
            vm.model = { description: '' };
        }


        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label>Download Link From : ' + vm.model.controlDataSource + ' </label><br/>';
            if (vm.model.controlDataSource === 'static') {
                html += '<label>File Link  : ' + vm.model.fileLink + ' </label><br/>';
            }
            html += '<label>Download Start Option : ' + vm.model.downloadStart + ' </label><br/>';
            html += '<label>Open Print Preview : ' + vm.model.printPreview + ' </label><br/>';
            html += '</div>';
            html += '</div><br/>';
            return html;
        }

    }
    })(window.jQuery,window.hljs);
