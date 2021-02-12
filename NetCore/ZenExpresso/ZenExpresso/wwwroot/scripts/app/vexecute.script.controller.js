(function($) {
    "use strict";
    angular
        .module("app")
        .controller("ExecuteScriptViewController", ExecuteScriptViewController);
    ExecuteScriptViewController.$inject = [ "brudexutils", "DataHolder"];
    function ExecuteScriptViewController(utils, DataHolder) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Execute Script Form" };
        vm.taskInfo = null;
        vm.formInput = null;
        var callbackFunc = null;
         
        var parentActions = null;
        vm.init = function(taskInfo,formInput,cb) {
            vm.taskInfo = taskInfo;
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            console.log("The task info>>", vm.taskInfo);
            callbackFunc = cb;
            executeResult(vm.taskResults,formInput,utils,nextFunction);
        };

        function executeResult(result,formInput) {
            var instructions = vm.taskInfo.flowData.jsScript;
            console.log('The instructions are' + instructions);
            var f = new Function('result', 'formInput', 'utils', 'renderDataTable', instructions);
            try {
                f(result, formInput, utils, nextFunction);
            } catch (e) {
                utils.alertError("There was and error >>" + JSON.stringify(e));
                console.log("There was and error >>", e);
            } 
        }

        function nextFunction(error,taskResult) {
            var taskInfo = {};
            taskInfo.id = vm.taskInfo.id;
            taskInfo.controlName = vm.taskInfo.controlName;
            taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
            taskInfo.flowItemType = vm.taskInfo.flowItemType;
            taskInfo.flowGroup = vm.taskInfo.flowGroup;
            taskInfo.taskResult = taskResult;
            taskInfo.status = "00";
            if (callbackFunc) {
                if (error) {
                    taskInfo.status = error;
                } else {
                    taskInfo.status = "00";
                }
                callbackFunc(taskInfo);
            } else {
                if (error) {
                    utils.toastError(error);
                    return;
                }
                parentActions.submitTaskResult(taskInfo);
            }
        }

         

    }


})(window.jQuery);