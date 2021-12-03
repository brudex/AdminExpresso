(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('FileUploadClientWidgetController', FileUploadClientWidgetController);
    FileUploadClientWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function FileUploadClientWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { viewOption: 'dropView', allowMultiple:false }; 
        var isEditting = false;
        var editIndex = 0;
        var currentWidgetOption = '';
        vm.modalName = 'fileUploadClientModal';
        $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data;  
            }
            if (typeof vm.model.fileTypes === 'object') {
                vm.model.fileTypes = vm.model.fileTypes.join(","); //todo check if it works
            }
            var obj = { controlName: "File Upload", flowItemType: 'fileUploadClient', flowGroup: currentWidgetOption  };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.openForEditting = function (flowItem) {
           $('#' + vm.modalName).modal('show');
        } 

        vm.init = function () {
            vm.model = { viewOption: 'dropView', allowMultiple: false, fileTypes:""}; 
            currentWidgetOption = DataHolder.getValue('currentWidgetOption');
        }

        function onModalOpen(event, data) {
            if (typeof data === 'string') {
                if (data === vm.modalName) {
                    console.log('Same modal name >>', data);
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
            var obj = { controlName: "File Upload", flowItemType: 'fileUploadClient', flowGroup: currentWidgetOption };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData(obj.flowItemType, obj);  
            vm.model = { viewOption: 'dropView' ,allowMultiple: false}; 
        }

        
         
      

        function buildHtmlBindView() {
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label> Field Label : ' + vm.model.fieldLabel + ' </label><br/>';
            html += '<label> Field Name  : ' + vm.model.fieldName + ' </label><br/>';
            html += '<label> File Extensions  : ' + vm.model.fileTypes + ' </label><br/>';
            html += '<label> Allow Multiple : ' + vm.model.allowMultiple + ' </label><br/>';
            html += '<label> View Option  : ' + vm.model.viewOption + ' </label><br/>';
            html += '</div>';
            html += '</div>';
            return html;
        }

    }
    })(window.jQuery,window.hljs);
