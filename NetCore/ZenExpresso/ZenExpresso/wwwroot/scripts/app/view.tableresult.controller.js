(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('TableViewResultController', TableViewResultController);
    TableViewResultController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope','$sce'];
    function TableViewResultController(services, utils, $window, DataHolder, $scope,$sce) {
        var vm = this;
        var _ = utils._;
        var dataTable = null; 
        vm.model = { viewName: "Table Result View" }
        vm.viewSettings = {exportButtons:true,searchable:true,actionRows:false}; //todo check datatable doc and implement
        vm.taskInfo = null;
        vm.tableId = 'dynamic-table';
        vm.tableModel ={hasActions:false};
        vm.init = function (data) {
            vm.taskInfo = data;
            var parentActions = DataHolder.getParentFunctions();
            var taskResults = parentActions.getTaskResults();
            if (taskResults.length === 1) {
                if (taskResults[0].status === "00") {
                    if (_.isArray(taskResults[0].data)) {
                        executeResult(taskResults[0].data);
                    } else {
                        var arr = [];
                        arr.push({ __RESULT__: JSON.stringify(taskResults[0].data) });
                        executeResult(arr);
                    }
                    return;
                } else {
                    utils.alertWarning(taskResults[0].message);
                }
            } else {
                var controlDataSource = vm.taskInfo.flowData.controlDataSource;
                var taskResult = _.find(taskResults, function (o) { return o.controlIdentifier === controlDataSource; });
                if (taskResult) {
                    vm.tableId = vm.tableId + "-" + controlDataSource;
                    if (taskResult.status === "00") {
                        if (_.isArray(taskResult.data)) {
                            executeResult(taskResult.data);
                        } else {
                            var arr = [];
                            arr.push({ __RESULT__: JSON.stringify(taskResult.data) });
                            executeResult(arr);
                        }
                        return;
                    } else {
                        utils.alertWarning(taskResult.message);
                    }
                } else {
                    utils.alertWarning("No matching data source for identifier "+controlDataSource);
                }
            }
        }

        function executeResult(result) {
            if (result.length) {
                var useDataTable = vm.taskInfo.flowData.exportCsv || vm.taskInfo.flowData.exportExcel  || vm.taskInfo.flowData.exportPdf || vm.taskInfo.flowData.copyData;  
                useDataTable = useDataTable || vm.taskInfo.flowData.paginate ||  vm.taskInfo.flowData.printPreview;
                if(useDataTable){
                    vm.viewSettings.useDataTable= true;;
                    renderDataTable(result);
                }else{
                    vm.viewSettings.useNormalTable =true;
                    renderTable(result);
                }
            } else {
                utils.alertWarning("Query returned no data");
            }
        }

        vm.trustAsHtml = function (html) {
            return $sce.trustAsHtml(html);
        }

        function buildActionHtml(rowData,actionData){
          var link = buildActionLink(rowData,actionData);
          return '<a class="btn btn-sm btn-primary" href="'+link+'">'+actionData.buttonLabel+'</a>';
        }

        function buildActionLink(rowData,actionInfo) {
            var rowDataStr = JSON.stringify(rowData);
            var data = '';
            switch(actionInfo.payloadSelection) {
                case 'fullrow':
                {
                    data = encodeURIComponent(rowDataStr);
                    break;
                }
                case 'selectfields':
                {
                    var splitFields = actionInfo.payload.split(/[.,\n;]/);
                    var selectFields = utils._.pick(rowData, splitFields);
                    data = encodeURIComponent(JSON.stringify(selectFields));
                    break;
                }
                case 'javascript':
                {
                    var jsScript = actionInfo.payloadType;
                    var f = new Function('rowData', 'utils', jsScript);
                    var jsonResult = f(rowData, utils);
                    data = encodeURIComponent(JSON.stringify(jsonResult));
                    break;
                }
            }
            return "/SupportTask/ExecuteTask/" + actionInfo.executingTask + '?data=' + data;
        }


        function renderDataTable(data) {
            var rows = extractRowsDataTable(data);
            console.log('The rows extracted >>',rows);
            var cols = extractColumns(data);

            $(document).ready(function () {
                if (dataTable) {
                    dataTable.destroy();
                }
                var colDefs=[];
                if(vm.taskInfo.flowData.rowActionButtons.length){
                     colDefs = [{
                        "targets": -1,
                        "data": null,
                        "render": function ( data, type, row, meta ) {
                            var buttonsHtml='';
                            vm.taskInfo.flowData.rowActionButtons.forEach(function(action){
                                var rowDataStr = row[row.length-1];
                                var rowData = JSON.parse(rowDataStr);
                                buttonsHtml+=buildActionHtml(rowData,action);
                            });
                            return buttonsHtml;
                          }
                        }];
                }
               
                var exportButtons =[];
                if(vm.taskInfo.flowData.exportExcel){
                    exportButtons.push({
                        extend: 'excelHtml5'
                    });
                }
                if(vm.taskInfo.flowData.exportCsv){
                    exportButtons.push({
                        extend: 'csv'
                    });
                }
                if(vm.taskInfo.flowData.exportPdf){
                    exportButtons.push({
                        extend: 'pdf'
                    });
                }
                if(vm.taskInfo.flowData.copyData){
                    exportButtons.push({
                        extend: 'copyHtml5'
                    });
                }
                if(vm.taskInfo.flowData.printPreview){
                    exportButtons.push({
                        extend: 'print',
                        title: vm.taskInfo.description
                    });
                }
                var pageLength =20;
                if(vm.taskInfo.flowData.paginate){
                    pageLength=vm.taskInfo.flowData.itemsPerPage;
                }
                dataTable = $('#'+vm.tableId).DataTable({
                    data: rows,
                    columns: cols,
                    "pageLength": pageLength,
                    dom: 'Bfrtip',
                    columnDefs : colDefs,
                    buttons: exportButtons,
                    colReorder: true
                });
            });
        }


        function extractRowsDataTable(data) {
            var arr = [];
            data.forEach(function (item) {
                var obarr = [];
                Object.keys(item).forEach(function (prop) {
                    obarr.push(item[prop]);
                });
                if(vm.taskInfo.flowData.rowActionButtons.length){
                    var data=JSON.stringify(item);
                    obarr.push(data);
                }
                arr.push(obarr);
            });
            return arr;
        }

        function renderTable(data){
            vm.tableModel.cols=extractColumns(data);
            vm.tableModel.rows=extractRows(data);
            vm.tableModel.tableId = 'listTable-'+vm.taskInfo.flowData.controlDataSource;
            if(vm.taskInfo.flowData.searchable){
                vm.tableModel.searchable=true;
            }
            if(vm.taskInfo.flowData.rowActionButtons.length){
                vm.tableModel.hasActions=true;
            }
            var listVals =[];
            var index=0;
            vm.tableModel.cols.forEach(function(item){
                if(item!==''){
                    listVals.push('js-lists-values-'+item.title)
                }
                if(index==0){
                    vm.tableModel.dataSortBy=item.age;
                    index+=1;
                }
            })
            vm.tableModel.dataListValues = '['+listVals.join(',')+']';
            $(document).ready(function(){
                var userList = new $window.List(vm.tableModel.tableId,{
                    valueNames: listVals
                  });
            }) 
        }

        function extractRows(data) {
            var arr = [];
            data.forEach(function (item) {
                var buttonsHtml='';
                var obarr = [];
                Object.keys(item).forEach(function (prop) {
                    obarr.push({value:item[prop],css:'js-lists-values-'+prop});
                });
                if(vm.taskInfo.flowData.rowActionButtons.length){
                    vm.taskInfo.flowData.rowActionButtons.forEach(function(action){
                        buttonsHtml+=buildActionHtml(item,action);
                    });
                }
                arr.push({cells:obarr,actions:buttonsHtml});
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
            if(vm.taskInfo.flowData.rowActionButtons.length){
                arr.push('');
            }
            return arr;
        } ;

    }
    })(window.jQuery,window.hljs);
