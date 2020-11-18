(function ($) {
    angular
        .module('app')
        .factory('DataHolder', DataHolder);
    DataHolder.$inject = ['$http', '$window'];
    function DataHolder($http, $window) {
        var subscribedFuncs = [];
        var parentFunctions = {};
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
         
        function setValue(key,data) {
            dataWareHouse[key] = data;
        }
        function getValue(key) {
            return dataWareHouse[key];
        }

        function setParentFunctions(actions) {
            parentFunctions = actions;
            console.log('parent Actions set', parentFunctions);
        }

        function getParentFunctions() {
            console.log('parent Actions set', parentFunctions);
            return parentFunctions;
        }
        return {
            saveData: saveData,
            getData: getData,
            subscribeToSaveAlerts,
            setValue: setValue,
            getValue: getValue,
            getParentFunctions: getParentFunctions,
            setParentFunctions: setParentFunctions
        } 

    }
})(window.jQuery);