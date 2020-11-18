(function($) {
    "use strict";
    angular
        .module("app")
        .controller("ExecuteScriptViewController", ExecuteScriptViewController);
    ExecuteScriptViewController.$inject = [ "brudexutils", "DataHolder"];
    function ExecuteScriptViewController( utils, DataHolder) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Execute Script Form" };
        vm.taskInfo = null;
         
        var parentActions = null;

        vm.init = function(taskInfo,formInput) {
            vm.taskInfo = data;
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            console.log("The task info>>", vm.taskInfo);
            executeResult(vm.taskResults,formInput);
        };

        function executeResult(result,formInput) {
            executeJavascriptResult(result,formInput, utils, nextFunction);
        }

        function nextFunction(taskResult) {
            var taskInfo = {};
            taskInfo.id = vm.taskInfo.id;
            taskInfo.controlName = vm.taskInfo.controlName;
            taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
            taskInfo.flowItemType = vm.taskInfo.flowItemType;
            taskInfo.flowGroup = vm.taskInfo.flowGroup;
            taskInfo.taskResult = taskResult;
            parentActions.submitTaskResult(taskInfo);
        }

        function executeJavascriptResult(result, formInput, utils, next) {
            var instructions = vm.taskInfo.flowData;
            var f = new Function('result','formInput', 'utils', 'renderDataTable', instructions);
            try {
                f(result, formInput, utils, next);
            } catch (e) {
                utils.alertError("There was and error >>" + JSON.stringify(e));
                console.log("There was and error >>",e);
            }
        } 


    }


})(window.jQuery);