(function() {
    angular
        .module('app', [])
    .directive('jquerydatepicker', jqueryDatepicker);

    function jqueryDatepicker() {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModelCtrl) {
                element.datepicker({
                    language: 'en',
                    dateFormat: 'yyyy-mm-dd',
                    todayButton: new Date(),
                    autoClose: true,
                    onSelect: function (date) {
                        ngModelCtrl.$setViewValue(date);
                        ngModelCtrl.$render();
                        scope.$apply();
                    }
                });
            }
        };
    }

    
})();