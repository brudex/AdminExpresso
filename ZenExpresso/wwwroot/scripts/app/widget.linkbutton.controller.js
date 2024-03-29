﻿(function ($,hljs) {
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
        vm.supportTasks = [];
        vm.clickAction = {};
        vm.modalName = 'linkButtonModal';
        vm.model = { linkButtons: [], clickActions :[],alignment:'left'};
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
            vm.model = { linkButtons: [], clickActions :[],alignment:'left'};
            var parentActions = DataHolder.getParentFunctions();
            if(!vm.supportTasks.length) {
                parentActions.getAllSupportTasks(function(tasks) {
                    vm.supportTasks = tasks;
                });
            }
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
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


        vm.addButton = function () {
            vm.model.linkButtons.push(vm.linkButton);
            vm.linkButton = {};
        }

        vm.deleteButton = function (index) {
            vm.model.linkButtons.splice(index, 1);
        }       

        vm.editButton = function (index) {
            vm.linkButton = vm.model.linkButtons[index];
            vm.isEdittingButton = true;
            vm.buttonEditIndex = index;
        }

        vm.saveButton = function () {
            vm.model.linkButtons[vm.buttonEditIndex] = Object.assign({}, vm.linkButton);
            vm.linkButton = {};
            vm.buttonEditIndex = -1;
            vm.isEdittingButton = false;
        } 


        vm.addAction = function () {
            console.log('the action ',vm.clickAction)
            vm.model.clickActions.push(vm.clickAction);
            vm.clickAction = {};
        }

        vm.deleteAction = function (index) {
            vm.model.clickActions.splice(index, 1);
        }

        vm.editAction = function (index) {
            vm.clickAction = vm.model.clickActions[index];
            vm.isEdittingAction = true;
            vm.actionEditIndex = index;
        }

        vm.saveAction = function () {
            vm.model.clickActions[vm.actionEditIndex] = Object.assign({}, vm.clickAction);
            vm.clickAction = {};
            vm.actionEditIndex = -1;
            vm.isEdittingAction = false;
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
            html += '<label>Align Button : ' + vm.model.alignment +' </label><br/>';
            html += '<table class="table"><thead><tr><th>Button Label</th><th>Button Action</th>'+
             '<th>Button Size</th><th>Css Class</th></tr></thead><tbody>';
             vm.model.linkButtons.forEach(function(button){
                html+= '<tr><td>'+ button.buttonLabel +'</td><td>'+
                      button.onClickAction +
                '</td><td>' +
                button.buttonSize +
                '</td><td>' +
                button.css +
                '</td></tr>'
             });
            html+='</tbody></table>'
            html += '</div>';
            html += '</div><br/>';
            return html;
        }

    }
    })(window.jQuery,window.hljs);
