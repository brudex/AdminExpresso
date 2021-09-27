(function($) {
    "use strict";
    angular
        .module("app")
        .controller("SuccessMessageViewController", SuccessMessageViewController);
    SuccessMessageViewController.$inject = ["brudexservices", "brudexutils", "$window", "DataHolder", "$scope"];

    function SuccessMessageViewController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Success Message View" };
        vm.taskInfo = null;
        vm.taskResults = [];
        vm.formControls = [];
        vm.formSubmitted = false;
        var parentActions = null;
        vm.init = function(data) {
            vm.taskInfo = data;
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            console.log("The task info>>", vm.taskInfo);
            console.log("The task results>>", vm.taskResults);
            executeResult();
        };


 
        function showAlertMessage(statusMessage) {
            var flowData = vm.taskInfo.flowData;
             for (var k = 0, len = flowData.statusCodes.length; k < len; k++) {
                var statusConfig = flowData.statusCodes[k];
                if (statusMessage[statusConfig.fieldName] === statusConfig.code) {
                    var message = '';
                    if (statusConfig.enterMessage) {
                        message = statusConfig.staticMessage;
                    } else {
                        message = statusMessage[statusConfig.messageField];
                    }
                    showAlertDialog(statusConfig.alertType, message);
                }
            }
        }

        function showAlertDialog(alertType, message) {
             switch (alertType) {
                case 'success': utils.alertSuccess(message); break;
                case 'error': utils.alertError(message); break;
                case 'warning': utils.alertWarning(message); break;
                default: utils.alertWarning(message); break;
            }
        }

        function showErrorResult() {
            utils.alertError("No result for status message" );
        }

        function executeResult() {
            if (vm.taskResults.length) {
                var result = vm.taskResults[vm.taskResults.length-1];
                console.log("the result.data in successmessage>>", result);
                 if (result.status === "00") {
                    var data = result.data;
                    if (_.isArray(data)) {
                        if (data.length === 1) {
                            showAlertMessage(data[0]);
                        } else {
                            showAlertMessage(result);
                        }

                    } else {
                        showAlertMessage(data);
                    }
                } else if (result.message) {
                    console.clear();
                    console.error(result.message);
                    showAlertDialog("error", result.message);
                } else {
                    utils.alertError("No result for status message");
                }
            }
             
        }

   


    }


})(window.jQuery);