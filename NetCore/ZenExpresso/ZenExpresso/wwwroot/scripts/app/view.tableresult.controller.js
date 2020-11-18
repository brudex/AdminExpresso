(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('TableViewResultController', TableViewResultController);
    TableViewResultController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function TableViewResultController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        var dataTable = null; 
        vm.model = { viewName: "Table Result View" }
        vm.viewSettings = {exportButtons:true,searchable:true,actionRows:false}; //todo check datatable doc and implement
        vm.taskInfo = null; 
        vm.init = function (data) {
            vm.taskInfo = data;
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var taskResults = parentActions.getTaskResults();
            console.log('The task Results>>', taskResults);
            if (taskResults.length === 1) {
                if (taskResults[0].status === "00") {
                    executeResult(taskResults[0].data);
                    return;
                }
            }
        } 
     
         
        function executeResult(result) {
            if (result.length) {
                renderDataTable(result);
            } else {
                utils.alertWarning("Query returned no data");
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
                        },
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
                Object.keys(item).forEach(function (prop) {
                    obarr.push(item[prop]);
                });
                arr.push(obarr);
            });
            return arr;
        }

        function extractColumns(data) {
            var arr = [];
            if (data.length) {
                Object.keys(data[0]).forEach(function (item) {
                    arr.push({ "title": item });
                });
            }
            return arr;
        }

        







    }
    })(window.jQuery,window.hljs);
