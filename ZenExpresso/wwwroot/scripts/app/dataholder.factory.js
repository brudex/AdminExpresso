﻿(function ($) {
    angular
        .module('app')
        .factory('DataHolder', DataHolder);
    DataHolder.$inject = ['$http', '$window'];
    function DataHolder($http, $window) {
        var subscribedFuncs = [];
        var parentFunctions = {};
        var formSubmitSubscription = null;
        var subscriptionsHolder= [];
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
        }

        function getParentFunctions() {
            return parentFunctions;
        }

        function setFormSubmitSubscription(subscriptionFunc ) {
            formSubmitSubscription = subscriptionFunc;
            subscriptionsHolder.forEach(function(action) {
                formSubmitSubscription(action);
            });
            subscriptionsHolder = []; 
        }

        function subscribeToFormSubmitAction(action) {
            if (formSubmitSubscription) {
                formSubmitSubscription(action);
            } else {
                subscriptionsHolder.push(action);
            } 
        }
        

        return {
            saveData: saveData,
            getData: getData,
            subscribeToSaveAlerts: subscribeToSaveAlerts,
            setValue: setValue,
            getValue: getValue,
            getParentFunctions: getParentFunctions,
            setParentFunctions: setParentFunctions,
            setFormSubmitSubscription: setFormSubmitSubscription,
            subscribeToFormSubmitAction: subscribeToFormSubmitAction
        } 


    }
})(window.jQuery);