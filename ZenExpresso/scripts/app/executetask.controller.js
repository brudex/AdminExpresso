(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('ExecuteTaskController', ExecuteTaskController);
    ExecuteTaskController.$inject = ['brudexservices', 'brudexutils'];
    function ExecuteTaskController(services, utils) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.formSubmitted = false;
        vm.model = {searchFields:[]};
        vm.databases = [];
        vm.tables = [];
        vm.columns = [];
        var supportTaskId = $("#__supportTaskId").val();
        var supportTaskInfo = {};
        var dataTable = null;

        vm.init = function(execNow) {
            getSupportTaskInfo(function() {
                if (execNow) {
                    vm.executeSupportTask(true);
                }
            });
        }

        vm.executeSupportTask = function (formValid) {
            vm.formSubmitted = true;
            if (formValid) {
                vm.model.taskId = supportTaskId;
                services.executeSupportTask(vm.model, function (response) {
                   if (response.status === "00") {
                        translateResult(response.data);
                        vm.formSubmitted = false;
                    } else {
                        utils.alertError(response.message);
                    }
                });
            }
        }

        function translateResult(result) {
           switch(supportTaskInfo.taskResultType)
            {
               case "tableresult":
               {
                   if (result.length) {
                       renderDataTable(result);
                   } else {
                       utils.alertWarning("Query returned no data");
                   }
                  
                   break;
               }
               case "successCode":
               {
                   if (result.length) {
                       var keys = Object.keys(result[0]);
                       var retVal = result[0][keys[0]];
                       console.log('thhe retVal is >>', retVal);
                       if (retVal === true || retVal === 1 || retVal === 0 || retVal === "00" || retVal === "0") {
                           utils.alertSuccess("Operation Successful");
                       } else {
                           utils.alertError("Error Code , returned >>" + JSON.stringify(result));
                       }
                   } else {
                       utils.alertError("There was an error , returned >>" + JSON.stringify(result));
                   } 
                    break;
               }
               case "execJsResult":
               {
                   executeJavascriptResult(result, utils, renderDataTable);
                    break;
               }
            }
        }


        function executeJavascriptResult(result,utils,renderDataTable) {
            var instructions = supportTaskInfo.jsScript;
            var f = new Function('result', 'utils', 'renderDataTable', instructions);
            try {
                f(result, utils, renderDataTable);
            } catch (e) {
                console.log('there was an error execution server js', e);
            }  
        }


        function renderDataTable(data) {
            var rows = extractRows(data);
            var cols = extractColumns(data); 
            $(document).ready(function () {
                if (dataTable) {
                    dataTable.destroy();
                }
                dataTable = $('#dynamic-table').DataTable({
                    data: rows,
                    columns: cols,
                    dom: 'Bfrtip',
                    buttons: [
                                {
                                    extend: 'copyHtml5'
                                 
                                },
                                {
                                    extend: 'excelHtml5'
                               
                                } ,
                                {
                                    extend: 'csv'
                               
                                },
                                 {
                                     extend: 'pdf'

                                 }
                    ],
                    colReorder: true
                });
            });
        }

        function extractRows(data) {
            var arr = [];
            data.forEach(function (item) { 
                var obarr = [];
                Object.keys(item).forEach(function(prop) {
                    obarr.push(item[prop]);
                });
               arr.push(obarr); 
            });
            return arr;
        }

        function extractColumns(data) {
            var arr = [];
            if (data.length) {
                Object.keys(data[0]).forEach(function(item) {
                    arr.push({ "title": item });
                });
            }
            return arr;
        }
        
        function getSupportTaskInfo(callback) {
            var payload = {};
            payload.taskId = supportTaskId;
            services.getSuppotTaskInfo(payload,function (response) {
                console.log('Support task result >>', response);
                if (response.status === "00") {
                    supportTaskInfo = response.data;
                    if (callback) {
                        callback();
                    }
                }  
            });
        }
    }
})(window.jQuery);
