(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('CardWidgetController', CardWidgetController);
    CardWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function CardWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.rowAction = {};
        vm.model = { options: {}, rowActionButtons: [], description: '', cardDesignOption:'verticalWithButtons'}; 
        var isEditting = false;
        var editIndex = 0;
        vm.dataSources = [];
        vm.supportTasks=[];
        var currentWidgetOption = '';
        vm.modalName = 'cardOutputModal';
         $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            console.log('vm.initDataModel', data); 
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data; 
            }  
            var obj = { controlName: "Card Output", flowItemType: 'cardResult', flowGroup: currentWidgetOption, description: vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.openForEditting = function(flowItem) {
           $('#' + vm.modalName).modal('show');
        } 

        vm.init = function () {
            vm.model = { options: {}, rowActionButtons: [], description: '', cardDesignOption:'verticalWithButtons'};
            var parentActions = DataHolder.getParentFunctions();
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
            var dataSources = [];
            vm.dataSources = []; 
            if(vm.supportTasks.length===0){
                console.log("Getting all support tasks >>");
                parentActions.getAllSupportTasks(function(tasks){
                    vm.supportTasks=tasks;
                })
            }
            if (currentWidgetOption === 'client') {
                dataSources = parentActions.getBeforeRenderDataSources();
                console.log('Card Datasource>>', dataSources);
            } else {
                console.log('Card widget option >>' + currentWidgetOption, dataSources);
                dataSources = parentActions.getPostActionDataSources();
            }
            if (dataSources.length) {
                dataSources.forEach(function (dt) {
                    vm.dataSources.push(dt);
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
            var obj = { controlName: "Card Output", flowItemType: 'cardResult', flowGroup: currentWidgetOption, description:vm.model.description };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData('cardResult', obj);  
            vm.model = { options: {}, rowActionButtons: [], description: '' };
        }

        vm.addRowAction = function () {
            console.log('Called add row action')
            vm.model.rowActionButtons.push(vm.rowAction);
            vm.rowAction = {}; 
        }

        vm.deleteRowAction = function (index) {
            vm.model.rowActionButtons.splice(index,1);
        }


        function buildHtmlBindView() {
            var cardImageFieldName = '';
            var cardTitleFieldName = '';
            var cardBodyFieldName = '';
            var cardFooterFieldName = '';
            var cardImageCheck = null;
            var cardTitleCheck = null;
            var cardBodyCheck = null;
            var cardFooterCheck = null;
            if (vm.model.cardImageCheck) {
                cardImageCheck = 'checked="checked"';
                cardImageFieldName = '(' + vm.model.cardImageFieldName + ')';
            }
            if (vm.model.cardTitleCheck) {
                cardTitleCheck = 'checked="checked"';
                cardTitleFieldName = '(' + vm.model.cardTitleFieldName + ')';
            }
            if (vm.model.cardBodyCheck) {
                cardBodyCheck = 'checked="checked"';
                cardBodyFieldName = '(' + vm.model.cardBodyFieldName + ')'; 
            }
            if (vm.model.cardFooterCheck) {
                cardFooterCheck = 'checked="checked"';
                cardFooterFieldName = '(' + vm.model.cardFooterFieldName + ')';
            }
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label><input type="checkbox" disabled="disabled"' + cardImageCheck + '/> Card Image  ' + cardImageFieldName+' </label><br/>';
            html += '<label><input type="checkbox" disabled="disabled"' + cardTitleCheck + '/> Card Title  ' + cardTitleFieldName+' </label><br/>';
            html += '<label><input type="checkbox" disabled="disabled"' + cardBodyCheck + '/> Card Body ' + cardBodyFieldName+' </label><br/>';
            html += '<label><input type="checkbox" disabled="disabled"' + cardFooterCheck + ' /> Card Footer ' + cardFooterFieldName +' </label>'; 
            html += '</div>';
            html += '</div>';
            if (vm.model.rowActionButtons.length) {
                html += '<br/>';
                html += '<table class="table">';
                html += '<caption>Row Actions</caption>';
                html += '<thead>';
                html += '<thead><tr><th>Executed when..</th><th>Button Label</th><th>Payload Selection</th><th>Executing Task</th></tr></thead>';
                html += '<tbody>';
                vm.model.rowActionButtons.forEach(function(item) {
                    html += '<tr><td>' + item.actionMode + '</td>';
                    html += '<td>'+item.buttonLabel + '</td>';
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
