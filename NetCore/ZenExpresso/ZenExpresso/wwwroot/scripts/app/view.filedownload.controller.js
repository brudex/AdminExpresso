(function ($,hljs) {
    'use strict';
    angular
        .module('app')
        .controller('FileDownloadViewController', FileDownloadViewController);
    FileDownloadViewController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope','$sce'];
    function FileDownloadViewController(services, utils, $window, DataHolder, $scope,$sce) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "File Download" }
        vm.taskInfo = null;
        vm.downloadDone = false;
        vm.init = function (data) {
            vm.taskInfo = data;
            console.log('The taskInfo >>', vm.taskInfo);
            var parentActions = DataHolder.getParentFunctions();
            var taskResults = parentActions.getTaskResults();
            if (taskResults.length === 1) {
                console.log("The TaskResult is >>", taskResults);
                if (taskResults[0].status === "00") {
                    if (isValidUrlLink(taskResults[0].data)) {
                        executeResult(taskResults[0].data);
                    } else {
                        utils.alertWarning("Invalid Url link :" + taskResults[0].data);
                    }
                    return;
                } else {
                    utils.alertWarning(taskResults[0].message);
                }
            } else {
                var controlDataSource = vm.taskInfo.flowData.controlDataSource;
                if (controlDataSource === 'static') {
                    console.log('Calling executeResult');
                    executeResult();
                    return;
                }
                var taskResult = _.find(taskResults, function (o) { return o.controlIdentifier === controlDataSource; });
                if (taskResult) {
                    vm.tableId = vm.tableId + "-" + controlDataSource;
                    if (taskResult.status === "00") {
                        if (taskResults[0].status === "00") {
                            if (isValidUrlLink(taskResults[0].data)) {
                                executeResult(taskResults[0].data);
                            } else {
                                utils.alertWarning("Invalid Url link :" + response[0].data);
                            }
                            return;
                        } else {
                            utils.alertWarning(taskResults[0].message);
                        }
                    } else {
                        utils.alertWarning(taskResult.message);
                    }
                } else {
                    utils.alertWarning("Data Source "+controlDataSource +" not found for file download ");
                }
            }
        }
         

        function isValidUrlLink(string) {
            var url; 
            try {
                url = new URL(string);
            } catch (_) {
                return false;
            } 
            return url.protocol === "http:" || url.protocol === "https:";
        }

        function executeResult(result) {

            if (vm.taskInfo.flowData.downloadStart === 'onPageLoad') {
                vm.model.startImmediately = true;
                if (vm.taskInfo.controlDataSource === 'static') {
                    vm.model.downloadLink = vm.taskInfo.flowData.fileLink;
                    downloadFile(vm.taskInfo.flowData.fileLink);
                } else {
                    vm.model.downloadLink = result;
                    downloadFile(result); 
                }
                if (vm.taskInfo.flowData.printPreview) {
                    printOnload(vm.model.downloadLink);
                    bindPrintButton();
                    vm.model.showPrintButton = true;
                }
            } else {
                vm.model.startImmediately = false;
                vm.model.downloadLink = vm.taskInfo.flowData.fileLink;
                if (vm.taskInfo.flowData.printPreview) {
                    vm.model.showPrintButton = true;
                }
            }
        }

        function downloadFile(link) {
            if (vm.downloadDone) {
                return;
            }
            vm.downloadDone = true;
            console.log("Starting download>>", link);
            $(document).ready(function () {
                downloadURI(link,''); 
            }); 
        } 

        function downloadURI(uri, name) {
            var link = document.createElement("a");
            link.setAttribute('download', name);
            link.href = uri;
            document.body.appendChild(link);
            link.click();
            link.remove();
        }

         
        vm.openPrintPreview = function (link) {
            console.log("Opening link >>>", link);
            $window.printJS(link);
        }

        function bindPrintButton() {
            $(document).ready(function() {
                $("#printPreview").click(function() {
                    $window.printJS(vm.model.downloadLink);
                });
            });
        }

        function printOnload(link) {
            console.log("Opening link >>>", link);
            $(document).ready(function () {
                $window.printJS(link);
            });
        }

    }
    })(window.jQuery,window.hljs);
