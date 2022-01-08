(function ($) {
    'use strict';
    angular
        .module('app')
        .controller('LinkButtonViewController', LinkButtonViewController);
    LinkButtonViewController.$inject = ['brudexservices', 'brudexutils', '$window', 'DataHolder','$scope','$sce'];
    function LinkButtonViewController(services, utils, $window, DataHolder, $scope,$sce) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Link Button",buttons:[] }
        vm.taskInfo = null;
        vm.taskResults = null;
        vm.formControls = [];
        vm.formSubmitted = false;
        vm.downloadDone = false;
        var parentActions;
        var formSubmitActions = [];

        DataHolder.setFormSubmitSubscription(function (action) {
            console.log('Form submit Action added');
            formSubmitActions.push(action);
        }); 

        vm.init = function (data) {
            vm.taskInfo = data;
            console.log('The task data>>', data);
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            executeResult(vm.taskResults);
        }

        function isJsonString(str) {
            try {
                JSON.parse(str);
            } catch (e) {
                return false;
            }
            return true;
        }

        function containsParamReplacement(str) {
            try {
               return  str.indexOf("${") > -1;
            } catch (e) {
                return false;
            }
        }

        function replaceParams(str) {
            var scriptParameters = parentActions.get;
            scriptParameters.forEach(function (parameter){
                str = str.replace("${" + parameter.parameterName + "}", parameter.parameterValue);
            });
            return str; 
        }
        

        function buildActionLink(button,action) {
            var taskData = action.taskData;
            var data = '';
            if (isJsonString(taskData)) {
                if(containsParamReplacement(taskData)){
                    
                }
                data = encodeURIComponent(taskData);
            }
            var actionLink;
            if (data === '') {
                  actionLink = "/SupportTask/ExecuteTask/" + action.taskId ;
            } else {
                  actionLink = "/SupportTask/ExecuteTask/" + action.taskId + '?data=' + data;
            }
            return actionLink;
        }

        function buildJsActionFunction(button,action) {
            var f = new Function('utils', 'taskResults', action.javascript);
            function retFunc() {
                f(utils, vm.taskResults);
            }
            return retFunc;
        }

        function submitCurrentTask() {
            vm.formSubmitted = true;
            console.log('Form is Valid');
             var taskInfo = {};
            taskInfo.id = vm.taskInfo.id;
            taskInfo.controlName = vm.taskInfo.controlName;
            taskInfo.flowItemType = 'inputForm.html';
            taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
            taskInfo.flowGroup = vm.taskInfo.flowGroup;
            taskInfo.taskResult = [];
            taskInfo.formData = {};
            if (formSubmitActions.length) {
                executeFormSubmitActions(function (resultData) { //returns form inputs array
                    taskInfo.taskResult = taskInfo.taskResult.concat(resultData);
                    parentActions.submitTaskResult(taskInfo);
                });
            } else {
                parentActions.submitTaskResult(taskInfo);
            }
        }

        function executeFormSubmitActions(callback) {
            var indexIterator = 0;
            var formInputs = [];
            function recursiveIterator() {
                console.log('The form submitt acctions>>>', formSubmitActions);
                var action = formSubmitActions[indexIterator];
                action(function (actionData) {
                    console.log('Received action data is>>', actionData);
                    if (actionData.hasFormData) {
                        actionData.taskResult.forEach(function (input) {
                            formInputs.push(input);
                        });
                    }
                    indexIterator += 1;
                    if (indexIterator < formSubmitActions.length) {
                        console.log('Recalling Iterator>>', indexIterator);
                        console.log('Recalling Iterator>>', formSubmitActions.length);
                        recursiveIterator();
                    } else {
                        callback(formInputs);
                    }

                });
            }
            recursiveIterator();
        }
 
        function getAlignmentCss() {
            var alignment = vm.taskInfo.flowData.alignment;
            switch (alignment) {
                case 'left':
                    {
                        return 'float-left';
                    }
                    
                case 'right':
                    {
                        return 'float-right';
                    }
                case 'center':
                    {
                            return 'd-flex justify-content-center';
                    }
            }
            return '';
        }

        function executeResult() {
            vm.taskInfo.flowData.linkButtons.forEach(function(button) {
                var action = _.filter(vm.taskInfo.flowData.clickActions,function(a) { return a.actionName == button.onClickAction })[0];
                button.css = 'btn ' + button.buttonSize + ' ' + button.css+ ' ' + getAlignmentCss();
                button.onClickMode = action.onClickMode;
                console.log('Button mode >>', button);
                if (action.onClickMode === 'static') {
                    button.link = action.staticLink;
                    vm.model.buttons.push(button);
                } else if (action.onClickMode === 'supportTask') {
                    var link = buildActionLink(button, action);
                    button.link = link;
                    vm.model.buttons.push(button);
                } else if (action.onClickMode === 'javascript') {
                    var actionFunc = buildJsActionFunction(button, action);
                    button.onClick = function(){
                        actionFunc();
                        if(button.disableOnClick){
                            button.disabled=true;
                        }
                    }
                    vm.model.buttons.push(button);
                }
                else if (action.onClickMode === 'submit') {
                    button.onClick = function(){
                        if(button.disableOnClick){
                            button.disabled=true;
                        }
                        submitCurrentTask();
                    }
                    vm.model.buttons.push(button);
                }
                
            });
        }


    }
    })(window.jQuery);
