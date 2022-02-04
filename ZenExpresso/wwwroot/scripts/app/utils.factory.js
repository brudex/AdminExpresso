(function () {
    angular
        .module('app')
        .factory('brudexutils', UtilityFunctions);
    UtilityFunctions.$inject = ['$http', '$location', '$window'];
    function UtilityFunctions($http, $location, $window) {
        if ($window._) {
            $window._.isNumeric = function isNumeric(str) {
                if (typeof str != "string") return false // we only process strings!  
                return !isNaN(str) && // use type coercion to parse the _entirety_ of the string (`parseFloat` alone does not do this)...
                    !isNaN(parseFloat(str)) // ...and ensure strings of whitespace fail
            }
        }
       
        return {
            alertSuccess: createAlert('success'),
            alertError: createAlert('error'),
            alertInfo : createAlert('info'),
            alertWarning: createAlert('warning'),
            alertConfirm: createAlertCustomized('warning'),
            toastSuccess: createToast('success'),
            toastError: createToast('warning'),
            toastInfo: createToast('info'),
            toastWarning: createToast('warning'),
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

        function createToast(toastType) {
            return function showToast(message) {
                $window.toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-bottom-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                $window.toastr[toastType](message);
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