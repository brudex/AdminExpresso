(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('LinkButtonViewController', LinkButtonViewController);
    LinkButtonViewController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope','$sce'];
    function LinkButtonViewController(services, utils, $window, DataHolder, $scope,$sce) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Link Button",buttons:[] }
        vm.taskInfo = null;
        vm.taskResults = null;
        vm.downloadDone = false;
        vm.init = function (data) {
            vm.taskInfo = data;
            var parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            executeResult(vm.taskResults);
        }

        function isJsonString(str) {
            try {
                JSON.parse(str);
            } catch (e) {
                return false;
            }
            return true;
        }

        function buildActionLink(button,action) {
            var taskData = action.taskData;
            var data = '';
            if (isJsonString(taskData)) {
                data = encodeURIComponent(taskData);
            }
            var actionLink;
            if (data === '') {
                  actionLink = "/SupportTask/ExecuteTask/" + action.taskId ;
            } else {
                  actionLink = "/SupportTask/ExecuteTask/" + action.taskId + '?data=' + data;
            }
            return actionLink;
        }

        function buildJsActionFunction(button,action) {
            var f = new Function('utils', 'taskResults', action.javascript);
            function retFunc(){
                f(utils,vm.taskResults)
            }
            return retFunc;
        }

        function executeResult(result) {
            vm.taskInfo.flowData.linkButtons.forEach(function(button){
                var action = _.filter(vm.taskInfo.flowData.clickActions,function(a){return a.actionName==button.onClickAction })[0];
                button.css = 'btn ' +button.buttonSize+' '+button.css;
                button.onClickMode =action.onClickMode;
                if (action.onClickMode === 'static') {
                    button.link = action.staticLink;
                    vm.model.buttons.push(button);
                }
                else if (action.onClickMode === 'supportTask') {
                    var link=buildActionLink(button,action);
                    button.link = link
                    vm.model.buttons.push(button);
                } else if (action.onClickMode === 'javascript') {
                    var actionFunc=buildJsActionFunction(button,action);
                    button.onClick =actionFunc;
                    vm.model.buttons.push(button);
                }
            })
            console.log("the buttons are >>",vm.model.buttons);
        }


    }
    })(window.jQuery);
