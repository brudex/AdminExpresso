(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('CardViewResultController', CardViewResultController);
    CardViewResultController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope'];
    function CardViewResultController(services, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Card Result View", cardDesignOption: '', cardItems: [] } //horizontalWithButtons,horizontalWithDropDown,verticalWithDropDown,verticalWithButtons
        vm.viewSettings = {cardType:''}; 
        vm.taskInfo = null;
        vm.cardItems = [];
        vm.init = function (data) {
            vm.taskInfo = data;
            vm.model.cardDesignOption = 'card-'+ vm.taskInfo.flowData.cardDesignOption;
            console.log('Card Task Info >>', data);
            var parentActions = DataHolder.getParentFunctions();
            console.log('parentActions', parentActions);
            var taskResults = parentActions.getTaskResults();
             if (taskResults.length === 1) {
                if (taskResults[0].status === "00") {
                    if (_.isArray(taskResults[0].data)) {
                        executeResult(taskResults[0].data);
                    } else {
                        var arr = [];
                        arr.push(taskResults[0].data);
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
                            arr.push(taskResult.data);
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
                renderCardView(result);
            } else {
                utils.alertWarning("Query returned no data");
            }
        } 

        function buildActionLink(rowData,actionInfo) {
            
            var data = '';
            switch (actionInfo.payloadSelection) {
                case 'fullrow':
                {
                    data = encodeURIComponent(JSON.stringify(rowData));
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

        function renderCardView(data) {
            console.log('Array Data', data);
             vm.taskInfo.flowData.rowCount = 2;
            vm.model.columnCss = 'col-md-'+ (12 / vm.taskInfo.flowData.rowCount);
            for (var k = 0, len = data.length; k < len; k++) {
                var card = {};
                if (vm.taskInfo.flowData.cardImageCheck) {
                    card.imageUrl = data[k][vm.taskInfo.flowData.cardImageFieldName];
                } 
                if (vm.taskInfo.flowData.cardTitleCheck) {
                    card.title = data[k][vm.taskInfo.flowData.cardTitleFieldName];
                }
                if (vm.taskInfo.flowData.cardBodyCheck) {
                    card.bodyText = data[k][vm.taskInfo.flowData.cardBodyFieldName];
                }
                if (vm.taskInfo.flowData.cardFooterCheck) {
                    card.footerText = data[k][vm.taskInfo.flowData.cardFooterFieldName];
                }
                var rowData = data[k];
                card.actions = [];
                vm.taskInfo.flowData.rowActionButtons.forEach(function (item) {
                    var action = {};
                    if (item.actionMode === 'cardHeaderClicked' || item.actionMode ==='cardImageClicked') {
                        action.method = 'get';
                        if (item.actionMode === 'cardHeaderClicked') {
                            card.headerLink = buildActionLink(rowData, item);
                        } else {
                            card.imageClickLink = buildActionLink(rowData, item);;
                        }
                    } else {
                        action.method = 'get';//todo support for post later ,only get for now
                        action.buttonLabel = item.buttonLabel;
                        action.actionLink = buildActionLink(rowData, item);;
                    }
                    card.actions.push(action);
                });
                vm.model.cardItems.push(card); 
            }
            console.log('The row Arrays...', vm.model.cardItems);

        }
  
    }
    })(window.jQuery,window.hljs);
