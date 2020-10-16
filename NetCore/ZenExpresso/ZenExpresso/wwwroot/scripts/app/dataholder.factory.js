(function ($) {
    angular
        .module('app')
        .factory('DataHolder', DataHolder);
    DataHolder.$inject = ['$http', '$window'];
    function DataHolder($http, $window) {
        var subscribedFuncs = [];
        var dataWareHouse = {

        }

        function subscribeToSaveAlerts(fun) {
            subscribedFuncs.push(fun);
        }

        function saveData(key, data,eventTag) {
            dataWareHouse[key] = data;
            subscribedFuncs.forEach(function(callBackMethod) {
                callBackMethod(key, data, eventTag);
            });
        }

        function getData(key) {
            return dataWareHouse[key];
        }

        return {
            saveData: saveData,
            getData: getData,
            subscribeToSaveAlerts
        } 

    }
})(window.jQuery);