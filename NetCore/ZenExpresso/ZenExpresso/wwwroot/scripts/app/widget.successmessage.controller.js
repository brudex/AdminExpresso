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
        vm.model = { };
        vm.header = {};
        var isEditting = false;
        vm.statusCodes = [];
        var modalName = 'successMessageOutputModal';
        var currentWidgetOption = '';
         

        vm.deleteStatusCodes = function (index) {
            console.log('The delete index >>', index);
            vm.statusCodes.splice(index,1);
        }

        vm.addStatusCode = function () {
            vm.statusCodes.push(Object.assign({},vm.model));
            vm.model = {};
        }

        vm.saveData = function () {
            if (vm.errorMsg.length) {
                return;
            }
            var obj = { controlName: "Success Message Result", flowItemType: 'successMessage', flowGroup: 'clientResult' };
            obj.data = { statusCodes: vm.statusCodes };
            obj.htmlbind = buildHtmlBindView();
            DataHolder.saveData('successMessage', obj);
            vm.statusCodes = [];
        }

        
        function buildHtmlBindView() {
           
            var html = ' <br/> <div> <table class="table">';
            html += '<caption>Status Codes</caption>';
            html += '<thead>';
            html += '<thead><tr>' +
                '<td>Status Code Field</td>' +
                '<td>Status Code Value</td>' +
                '<td>Status Message</td>' +
                '<td>Alert Type</td></tr></thead>';
            html += '<tbody>';
            vm.statusCodes.forEach(function (item) {
                var statusMessage = item.messageField;
                if (item.enterMessage) {
                    statusMessage = item.staticMessage;
                }
                html += '<tr><td>' + item.fieldName + '</td>';
                html += '<td>' + item.code + '</td>';
                html += '<td>' + statusMessage + '</td>';
                html += '<td>' + item.alertType + '</td></tr>';
            });
            html += '</tbody>';
            html += '</table> </div>';
            return  html;
        } 
        
       
    }
})(window.jQuery,window.hljs);
