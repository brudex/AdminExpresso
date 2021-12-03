(function($) {
    'use strict';
    angular
        .module('app')
        .controller('SearchLogController', SearchLogController);
    SearchLogController.$inject = ['brudexservices', 'brudexutils'];

    function SearchLogController(services, utils) {
        var vm = this;
        vm.errorMsg = [];
        vm.successMsg = [];
        vm.model = { searchMode: 'bydate' };
        vm.searchResults = [];


        vm.init = function () {
            vm.model.id = $("#___LogId").val();
            console.log('The log id is >>', vm.model.id);
        }

        vm.searchLogs = function () {
            var payload = vm.model;
            services.searchLogs(payload, function (response) {
                console.log("Response from searching logs >>", response);
                vm.searchResults = response;
                if (response.status === "00") {
                    initializeDataset(response.data);
                }
            });
        }

        function initializeDataset(data) {
            var dataSet = buildDataset(data);
            var columns = buildColumns(data);
            console.log('The columns are >>',columns);
            $('#example').DataTable({
                data: dataSet,
                columns: columns,
                dom: 'Bfrtip',
                buttons: [
                            {
                                extend: 'copyHtml5'
                                 
                            },
                            {
                                extend: 'excelHtml5'
                               
                            } 
                ]
            });
        }

        function buildDataset(data) {
            var dataset = [];
            for (var k = 0, len = data.length; k < len; k++) {
                var arr = [];
                for (var prop in data[k]) {
                    arr.push(data[k][prop]);
                }
                dataset.push(arr);
            }
            return dataset;
        }

        function buildColumns(data) {
            var columns = [];
            for (var prop in data[0]) {
                columns.push({ title: prop });
            }
            return columns;
        }
    }



})(window.jQuery);
