(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('TableResultWidgetController', TableResultWidgetController);
    TableResultWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function TableResultWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.rowAction = {};
        vm.model = { options: {}, rowActionButtons: [], description: '' }; 
        var isEditting = false;
        var modalName = 'tabularOutputModal';
        //$scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            console.log('vm.initDataModel', data);
            var initData = JSON.parse(data.flowData);
            vm.model = initData;
            var obj = { controlName: "Table Output", flowItemType: 'tableResult', flowGroup: "clientResult", description: vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            return obj;
        }

        vm.openForEditting = function(flowItem) {
           // #outputTransformModal, tabularOutputModal, inputFormModal, validationFormatingModal, successMessageOutputModal
            $('#tabularOutputModal').modal('show');
            vm.model = flowItem.data;
            isEditting = true;
        }

        vm.saveData = function() {
            vm.model.error = {};
            vm.errorMsg = [];
            var obj = { controlName: "Table Output", flowItemType: 'tableResult', flowGroup: "clientResult", description:vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            DataHolder.saveData('tableResult', obj);  
            vm.model = { options: {}, rowActionButtons: [], description: '' };
        }

        vm.addRowAction = function() {
            vm.model.rowActionButtons.push(vm.rowAction);
            vm.rowAction = {}; 
        }

        function buildHtmlBindView() {
            var searchableChecked = '';
            var exportChecked = '';
            if (vm.model.options.searchable) {
                searchableChecked = 'checked="checked"';
            }
            if (vm.model.options.exportbuttons) {
                exportChecked = 'checked="checked"';
            }
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label><input type="checkbox" disabled="disabled"' + searchableChecked+'/> Searchable </label><br/>';
            html += '<label> <input type="checkbox" disabled="disabled"' + exportChecked +' /> Export Buttons </label>'; 
            html += '</div>';
            html += '</div>';
            if (vm.model.rowActionButtons.length) {
                html += '<br/>';
                html += '<table class="table">';
                html += '<caption>Row Actions</caption>';
                html += '<thead>';
                html += '<thead><tr><th>Button Label</th><th>Payload Selection</th><th>Executing Task</th></tr></thead>';
                html += '<tbody>';
                vm.model.rowActionButtons.forEach(function(item) {
                    html += '<tr><td>'+item.buttonLabel + '</td>';
                    html += '<td>' + item.payloadSelection + '</td>';
                    html += '<td>'+ item.executingTask + '</td></tr>'; 
                });
                html += '</tbody>';
                html += '</table >';  
            } 
            return html;
        }

    }
    })(window.jQuery,window.hljs);
