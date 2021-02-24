(function($) {
    "use strict";
    angular
        .module("app")
        .controller("FileUploadViewController", FileUploadViewController);
    FileUploadViewController.$inject = ["brudexservices", "brudexutils", "$window", "DataHolder", '$scope'];
    function FileUploadViewController(services, utils, $window, DataHolder,$scope) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "File Upload Component" };
        vm.taskInfo = null;
        vm.taskResults = [];
        vm.formControls = [];
        vm.formSubmitted = false;
        var parentActions = null;
        var dropZoneCallbackResponse = [];
        $scope.$on('submitTaskResults', function () {
            console.log("Submit Task Results triggered>>");
            vm.executeSupportTask();
        }); 
        vm.init = function(data) {
            vm.taskInfo = data;
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            vm.taskInfo.flowData.fieldName = vm.taskInfo.flowData.fieldName.replace(" ", "");
            $window.Dropzone.autoDiscover = false;
            if (vm.taskInfo.flowData.viewOption === 'dropView') {
                initDropZone(vm.taskInfo.flowData.fieldName);
            } 
        };

        vm.executeUploads = function (elementId,callback) {
            if (vm.taskInfo.flowData.viewOption === 'formControlView') {
                fileUploadFileInput(elementId, callback);
            } else {
                callback({status:"00",message:dropZoneCallbackResponse.join(",")});
            }
        }

        function buildPayload(response) {
            var scriptParameters = [];
            var parameter = {};
            parameter.parameterLabel = vm.taskInfo.flowData.fieldLabel;
            parameter.parameterName = vm.taskInfo.flowData.fieldName;
            parameter.parameterType = "fileupload";
            parameter.parameterValue = response.message;
            scriptParameters.push(parameter);
            return scriptParameters;
        }

        vm.executeSupportTask = function() {
            var taskInfo = {};
            taskInfo.id = vm.taskInfo.id;
            taskInfo.controlName = vm.taskInfo.controlName;
            taskInfo.flowItemType = vm.taskInfo.flowItemType;
            taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
            taskInfo.flowGroup = vm.taskInfo.flowGroup;
            vm.executeUploads(vm.taskInfo.flowData.fieldName,function(response) {
                taskInfo.taskResult = buildPayload(response);
                parentActions.submitTaskResult(taskInfo);
            }); 
        }

        function initDropZone(elementId) {
            $(document).ready(function () {
                console.log("The elementId is >>>", elementId);
                var myDropzone = new $window.Dropzone("div#" + elementId, {
                    url: "/FileUpload/Index", paramName: myParamName,
                    uploadMultiple: true
                });
                //todo set options for file type and file size
                myDropzone.on("success", function (file, response) {
                    console.log("File successfully uploaded", response);
                    if (response.status === "00") {
                        dropZoneCallbackResponse.push(response.message);
                    }
                });
                function myParamName() {
                    return "files";
                }
                myDropzone.on("error", function (file,error) {
                    console.error("Error uploading file", error);
                }); 
            }); 
        }

        function fileUploadFileInput(elementId,callback) {
            var input = document.getElementById(elementId);
            var files = input.files;
            var formData = new FormData();
            for (var i = 0; i === files.length; i++) {
                formData.append("files", files[i]);
            }
            $.ajax(
                {
                    url: "/FileUpload/Index",
                    data: formData,
                    processData: false,
                    contentType: false,
                    type: "POST",
                    success: function (response) {
                        console.log("Response from File Upload");
                        callback(response);
                    }
                }
            );
        }

         

    }


})(window.jQuery);