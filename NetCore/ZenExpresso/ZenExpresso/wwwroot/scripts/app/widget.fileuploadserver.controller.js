(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('FileUploadServerWidgetController', FileUploadServerWidgetController);
    FileUploadServerWidgetController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function FileUploadServerWidgetController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.errorMsg = [];
        vm.model = { fileNameLogic: 'sameName', fieldSelect:"all"}; 
        var isEditting = false;
        var editIndex = 0;
        var currentWidgetOption = '';
        vm.modalName = 'fileUploadServerModal';
        $scope.$on('modalOpened', onModalOpen);

        vm.initDataModel = function (data) {
            currentWidgetOption = data.flowGroup;
            console.log('vm.initDataModel server upload', data); 
            if (data.flowData && typeof data.flowData === 'string') {
                var initData = JSON.parse(data.flowData);
                vm.model = initData;
            } else {
                vm.model = data.data; 
            }
            var obj = { controlName: "File Upload Server", flowItemType: 'fileUploadServer', flowGroup: currentWidgetOption  };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            return obj;
        }

        vm.openForEditting = function (flowItem) {
           $('#' + vm.modalName).modal('show');
        } 

        vm.init = function () {
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

        vm.saveData = function() {
            vm.model.error = {};
            vm.errorMsg = [];
            var obj = { controlName: "File Upload Server", flowItemType: 'fileUploadServer', flowGroup: currentWidgetOption };
            obj.data = vm.model;
            obj.htmlbind = buildHtmlBindView();
            obj.isEditting = isEditting;
            obj.editIndex = editIndex;
            obj.modalName = vm.modalName;
            DataHolder.saveData(obj.flowItemType, obj);  
            vm.model = { viewOption: 'dropView' ,allowMultiple: false}; 
        }

        
         
      

        function buildHtmlBindView() {

            var handlerFields = '';
            if (vm.model.fieldSelect === 'specify') {
                handlerFields = ' : ' +  vm.model.handlerFields;
            }
            var html = '<div class="row">';
            html += '<div class="col-md-10">';
            html += '<label> Handler Fields : ' + vm.model.fieldSelect + handlerFields +' </label><br/>';
            html += '<label> Destination Folder  : ' + vm.model.destFolder + ' </label><br/>';
            html += '<label> File Naming Logic  : ' + vm.model.fileNameLogic + ' </label><br/>';
            html += '</div>';
            html += '</div>';
            return html;
        }

    }
    })(window.jQuery,window.hljs);
