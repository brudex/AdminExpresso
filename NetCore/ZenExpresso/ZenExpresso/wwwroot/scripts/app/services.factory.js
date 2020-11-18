(function ($) {
    angular
        .module('app')
        .factory('brudexservices', DataService);
    DataService.$inject = ['$http', '$location', '$window'];
    function DataService($http, $location, $window) {
        var baseUrl = $("#___applicationbaseUrl").val();
        console.log('the app base url >>', baseUrl);
        if (baseUrl === "") {
            baseUrl = "/";
        }
        console.log('the app base url >>', baseUrl);
        var spinner = null;
        var spinTarget = null;
        return {
            listDatabases: postData('api/DbLogManagerApi/ConnectDbListDatabases'),
            listTables: postData('api/DbLogManagerApi/ConnectDbListTables'),
            listTableColumns: postData('api/DbLogManagerApi/ConnectDbListTableColumns'),
            submitLogToManage: postData('api/DbLogManagerApi/SaveLogManagement'),
            searchLogs: postData('api/DbLogManagerApi/SearchLogs'),
            createSupportTask: postData('api/SupportTaskApi/CreateSupportTask'),
            createAdvancedTask: postData('api/SupportTaskApi/CreateAdvancedSupportTask'),
            getSuppotTaskInfo: postData('api/SupportTaskApi/SupportTaskInfo'),
            getScriptParameters: postData('api/SupportTaskApi/ScriptParameters'),
            getSupportTaskGroups: getData('api/SupportTaskApi/TaskGroups'),
            saveSupportTaskGroup: postData('api/SupportTaskApi/SaveSupportTaskGroup'),
            executeSupportTask: postData('api/SupportTaskApi/ExecuteSupportTask'),
            executeAdvancedTask: postData('api/SupportTaskApi/ExecuteAdvancedTask'),
            testDbConnection: postData('api/SupportTaskApi/TestDbConnection'),
            listActiveDirectoryGroups: getData('api/SupportTaskApi/ListActiveDirectoryGroups'),

            getMenuList: getData('api/SetupApi/GetMenuList'),
            addMenu: postData('api/SetupApi/SaveMenu'),
            deleteMenu: postData('api/SetupApi/DeleteDataSource'),

            getDataSources: getData('api/SetupApi/GetDataSources'),
            saveDataSource: postData('api/SetupApi/SaveDataSource'),
            deleteDataSource: postData('api/SetupApi/DeleteDataSource'),

            getAdminList: getData('api/SetupApi/GetAdminList'),
            addAdmin: postData('api/SetupApi/SaveDedicatedAdmin'),
            deleteAdmin: postData('api/SetupApi/DeleteAdmin')
        }; 
        function startSpiner() {
            var opts =  {
                lines: 13,  
                length: 42,  
                width: 28,  
                radius: 80, 
                scale: 1,  
                corners: 1,  
                color: '#000000',  
                fadeColor: 'transparent', 
                speed: 1,  
                rotate: 0,  
                animation: 'spinner-line-fade-quick', 
                direction: 1,  
                zIndex: 2e9,  
                className: 'spinner',  
                top: '30%',  
                left: '50%', 
                shadow: '0 0 1px transparent',  
                position: 'absolute'  
            };
            if (!spinTarget) {
                spinTarget = $window.document.getElementById('spinnerContainer');
                spinner = new $window.Spinner(opts);
            } 
            spinner.spin(spinTarget);
        }

        function stopSpinner() {
            spinner.stop(spinTarget);
        }

        function postData(endpoint) {
            return function (data, callback) {

                if (!callback) {
                    callback = data;
                    data = {};
                }
                var url = baseUrl + endpoint;
                startSpiner();
                doPost(url, data, function (err, response) {
                    stopSpinner();
                    if (err) {
                        console.error(err);
                        return;
                    } 
                    callback(response.data); 
                });
            }
        }

        function getData(url) {
            
            return function (callback) {
                if (arguments.length > 1) {
                    url =  url + "/" + arguments[0];
                    callback = arguments[1];
                }
                console.log('The get url>>' + url);
                startSpiner();
                doGet(url, function (err, response) {
                    stopSpinner();
                    if (err) {
                        console.error(err);
                        return;
                    }
                    callback(response.data);
                   
                });
            }
        }

        function doPost(url, data, callback) {
            return $http.post(url, data)
               .then(function (response) {
                   if (response == null) {
                       return callback(null, { status: "07", message: "Error in response" });
                   }
                   return callback(null, response);
               })
               .catch(function (error) {
                   console.log(error);
                   callback(error);
               });
        }

        function doGet(endpoint, callback) {
            var url = baseUrl + endpoint;
            console.log('the url>>>', url);
            return $http.get(url)
               .then(function (response) {
                   if (response == null) {
                       return callback(null, { status: "07", message: "Error in response" });
                   }
                   return callback(null, response);
               })
               .catch(function (error) {
                   console.log(error);
                   return callback(error);
               });
        }


    }
})(window.jQuery);