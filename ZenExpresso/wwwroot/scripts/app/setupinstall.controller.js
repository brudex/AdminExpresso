(function () {
    'use strict';
    angular
        .module('app')
        .controller('SetupInstallController', SetupInstallController);
    SetupInstallController.$inject = ['brudexservices', 'brudexutils','$window'];
    function SetupInstallController(services, utils, $window) {
        var vm = this;
        vm.errorMsg = [];
        vm.errorParameter = [];
        vm.successMsg = [];
        vm.parameter = {};
        vm.dbTestSubmitted = false;
        vm.init = function (datamodel) {
            vm.dbTestSubmitted = true;
            vm.model = datamodel;
//            if (datamodel.dbInitialized) {
//                utils.toastSuccess("Installation Successful. You will be redirected shortly ");
//                setTimeout(function() {
//                        $window.location.reload();
//                    },
//                    6000);
//            }
        }
        console.log('Controller initialized');
        vm.testConnection = function () {
            vm.dbTestSubmitted = true;
            if (!vm.model) {
                return;
            }
            var pkeys = Object.keys(vm.model);
            if (pkeys.length < 5) {
                return;
            }
            for (var p = 0; p < pkeys.length; p++) {
                if (vm.model[pkeys[p]] == null || vm.model[pkeys[p]] == '') {
                    return;
                }
            }
            var payload = {};
            payload.dbusername = vm.model.dbUser;
            payload.dbPass = vm.model.dbPass;
            payload.dbPort = vm.model.dbPort;
            payload.dbHost = vm.model.dbHost;
            payload.dbName = vm.model.dbName;
            console.log('Database payload >>>', payload); 
            services.testDbConnectionRaw(payload,
                function (response) {
                    console.log('TEst Db response', response);
                    if (response.status === "00") {
                        utils.alertSuccess("Connection Successful");
                    } else {
                        utils.alertError("Connection Failed : "+response.message);
                    }
                });
        }
    }


})();
