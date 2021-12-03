(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('SuccessMessageWidgetController', SuccessMessageWidgetController);
    SuccessMessageWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function SuccessMessageWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { statusCodes: [] };
        vm.statusAction = {}; 
        var isEditting = false;
        var editIndex = 0;
        vm.modalName = 'successMessageOutputModal';
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
            var obj = { controlName: "Success Message Result", flowItemType: 'successMessage', flowGroup: 'clientResult' };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.init = function () {
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            vm.model = { statusCodes: [] };
        }

        vm.deleteStatusCodes = function (index) {
            console.log('The delete index >>', index);
            vm.model.statusCodes.splice(index,1);
        }

        vm.addStatusCode = function () {
            vm.model.statusCodes.push(Object.assign({}, vm.statusAction));
            vm.statusAction = {};
        }


        vm.openForEditting = function (flowItem) {
             $('#' + vm.modalName).modal('show');
        }

        vm.saveData = function () {
            if (vm.errorMsg.length) {
                return;
            }
            var obj = { controlName: "Success Message Result", flowItemType: 'successMessage', flowGroup: 'clientResult' };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.modalName = vm.modalName;
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            DataHolder.saveData('successMessage', obj);
            vm.statusCodes = [];
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
        function buildHtmlBindView() {

            var html = '<h5>Status Codes</h5>';
            html += '<br/> <div> <table class="table">';
            html += '<thead><tr>' +
                '<th>Status Code Field</th>' +
                '<th>Status Code Value</th>' +
                '<th>Status Message</th>' +
                '<th>Alert Type</th></tr></thead>';
            html += '<tbody>';
            vm.model.statusCodes.forEach(function (item) {
                var statusMessage = item.messageField;
                if (item.enterMessage) {
                    statusMessage = item.staticMessage;
                }
                html += '<tr><td>' + item.fieldName + '</td>';
                html += '<td>' + item.code + '</td>';
                html += '<td>' + statusMessage + '</td>';
                html += '<td>' + item.alertType + '</td></tr>';
            })
            html += '</tbody>';
            html += '</table> </div>';
            return  html;
        } 
        
       
    }
})(window.jQuery,window.hljs);
