(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('LinkButtonViewController', LinkButtonViewController);
    LinkButtonViewController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope','$sce'];
    function LinkButtonViewController(services, utils, $window, DataHolder, $scope,$sce) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Link Button",linkHtml:"" }
        vm.taskInfo = null;
        vm.taskResults = null;
        vm.downloadDone = false;
        vm.init = function (data) {
            vm.taskInfo = data;
            var parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            executeResult(vm.taskResults);
        }
          
        function buildStaticLinkHtml(btnLink) {
            return buildButton(vm.taskInfo.flowData.buttonLabel,
                btnLink,
                vm.taskInfo.flowData.css,
                vm.taskInfo.flowData.buttonSize);
        }

        function buildButton(label, link, css, size) {
            return '<a class="btn '+size+' '+css+' ml-2" href="' + link + '">' + label + '</a>';
        }


        function buildJsActionButton() {
           return '<button class="btn btn-sm btn-primary ml-2">' + vm.taskInfo.flowData.buttonLabel + '</button>';
        }


        vm.trustAsHtml = function (html) {
            return $sce.trustAsHtml(html);
        }

        function isJsonString(str) {
            try {
                JSON.parse(str);
            } catch (e) {
                return false;
            }
            return true;
        }

        function buildActionLink() {
            var taskData = vm.taskInfo.flowData.taskData;
            var data = '';
            if (isJsonString(taskData)) {
                data = encodeURIComponent(taskData);
            }
            var actionLink;
            if (data === '') {
                  actionLink = "/SupportTask/ExecuteTask/" + vm.taskInfo.flowData.taskId ;
              
            } else {
                  actionLink = "/SupportTask/ExecuteTask/" + vm.taskInfo.flowData.taskId + '?data=' + data;
            }
            return buildStaticLinkHtml(actionLink); 
        }

        function buildJsActionFunction() {
            var instructions = vm.taskInfo.flowData.javascript;
            console.log('The instructions are' + instructions);
            var f = new Function('utils', 'taskResults', instructions);
            return f;
//            try {
//                f(utils,vm.taskResults);
//            } catch (e) {
//                utils.alertError("There was and error >>" + JSON.stringify(e));
//                console.log("There was and error >>", e);
//            } 
        }

        function executeResult(result) { 
            if (vm.taskInfo.flowData.onClickMode === 'static') {
                vm.model.linkHtml = buildStaticLinkHtml(vm.taskInfo.flowData.staticLink);
            }
            else if (vm.taskInfo.flowData.onClickMode === 'supportTask') {
                vm.model.linkHtml = buildActionLink();
            } else if (vm.taskInfo.flowData.onClickMode === 'javascript') {
                vm.model.linkHtml = buildJsActionButton();
                vm.model.jsFunction = buildJsActionFunction(vm.taskInfo.flowData);
            }  
        }

         

        function bindPrintButton() {
            $(document).ready(function() {
                if (vm.model.jsFunction) {
                    if (typeof vm.model.jsFunction === 'function') {
                        vm.model.jsFunction(utils, vm.taskResults);
                    }
                }
            });
        }

        

    }
    })(window.jQuery);
