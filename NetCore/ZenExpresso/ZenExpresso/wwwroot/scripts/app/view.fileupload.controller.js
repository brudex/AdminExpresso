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
        var myDropzone;
        var allFilesUploadedCallback;
        var dropZoneCallbackResponse = []; 

        //allows function to be called when a submit button is clicked in a form input view
         

        vm.init = function(data) {
            vm.taskInfo = data;
            console.log('Fileupload data is>>>', vm.taskInfo);

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
                myDropzone.processQueue();
                allFilesUploadedCallback = callback; 
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

 
        vm.executeSupportTask = function(submitCallback) {
            var taskInfo = {};
            taskInfo.id = vm.taskInfo.id;
            taskInfo.controlName = vm.taskInfo.controlName;
            taskInfo.flowItemType = vm.taskInfo.flowItemType;
            taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
            taskInfo.flowGroup = vm.taskInfo.flowGroup;
            taskInfo.hasFormData = true;
            vm.executeUploads(vm.taskInfo.flowData.fieldName,function(response) {
                taskInfo.taskResult = buildPayload(response); 
                submitCallback(taskInfo);
            }); 
        }

        function getFileTypes() {
            var ftps = vm.taskInfo.flowData.fileTypes;
            var arr = ftps.split(/[,;\-]/);
            var str = '';
            var index = 0;
            arr.forEach(function (item) {
                if (index === 0) {
                    str += "." + item;
                } else {
                    str += ",." + item;
                }
                index++;
            });
            console.log('The file types are >>', str);
            return str;
        }

        function initDropZone(elementId) {
            $(document).ready(function () {
                console.log("The elementId is >>>", elementId);
                Dropzone.autoDiscover = false;
                var allowMultiple = vm.taskInfo.flowData.allowMultiple;
                myDropzone = new $window.Dropzone("form#"+elementId, {
                    url: "/FileUpload/Index",
                    acceptedFiles: getFileTypes(),
                    autoProcessQueue: false,
                    addRemoveLinks: true,
                    paramName: function () { return "files" }
                });
                $window.Dropzone.options.myDropzone = {
                    uploadMultiple: allowMultiple,
                    parallelUploads: 10,
                    paramName: function () { return "files" }
                }
                myDropzone.on("success", function (file, response) {
                    console.log("File successfully uploaded", response);
                    if (response.status === "00") {
                        dropZoneCallbackResponse.push(response.message);
                    }
                });
                myDropzone.on("processing", function () {
                    this.options.autoProcessQueue = true;
                }); 
                myDropzone.on("error", function (file, error) {
                    console.log("Error uploading file", error);
                    utils.alertError(error);
                   
                });
                myDropzone.on("complete", function (file) {
                    allFilesUploadedCallback({ status: "00", message: dropZoneCallbackResponse.join(",") });
                });
            }); 
        }

        function fileUploadFileInput(elementId, callback) {
            console.log('The element ID for upload>>', elementId);
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
        DataHolder.subscribeToFormSubmitAction(vm.executeSupportTask);
    }


})(window.jQuery);