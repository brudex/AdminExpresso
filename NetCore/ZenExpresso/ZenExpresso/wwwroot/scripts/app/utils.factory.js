(function () {
    angular
        .module('app')
        .factory('brudexutils', UtilityFunctions);
    UtilityFunctions.$inject = ['$http', '$location', '$window'];
    function UtilityFunctions($http, $location, $window) {
        return {
            alertSuccess: createAlert('success'),
            alertError: createAlert('error'),
            alertInfo : createAlert('info'),
            alertWarning: createAlert('warning'),
            alertConfirm: createAlertCustomized('warning'),
            _ :$window._
        };
        function createAlert(alertType) {
            return function showAlert(title, message) {
                var args = [].slice.call(arguments);
                if (args.length === 1) {
                    message = args[0];
                    title = alertType;
                }
                $window.swal(title, message, alertType);
            }
        }
 
        function createAlertCustomized(alertType) {
            return function showAlert(title, message, callback) {
                var args = [].slice.call(arguments);
                if (args.length === 1) {
                    message = args[0];
                    title = alertType;
                }

                $window.swal({
                    title: title,
                    text: message,
                    type: alertType,
                    showCancelButton: true,
                    confirmButtonClass: "btn-md btn-danger",
                    cancelButtonClass: "btn-md btn-default ",
                    confirmButtonText: "Yes",
                    closeOnConfirm: true
                },
                    function () {
                        if (callback) {
                            callback();
                        }
                    });

            }
        }


    }
})();