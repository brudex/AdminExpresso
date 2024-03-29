﻿(function($, hljs) {
    "use strict";
    angular
        .module("app")
        .controller("DynamicFormViewController", DynamicFormViewController);
    DynamicFormViewController.$inject = ["BeforeRenderDataStore", "brudexutils", "$window", "DataHolder", "$scope"];
    function DynamicFormViewController(BeforeRenderDataStore, utils, $window, DataHolder, $scope) {
        var vm = this;
        var _ = utils._;
        vm.model = { viewName: "Input Form View" };
        vm.taskInfo = null;
        vm.taskResults = [];
        vm.formControls = [];
        vm.formSubmitted = false;
        vm.readOnlyFieldsOnly = true;
        var parentActions = null;
        var formSubmitActions = [];  

        DataHolder.setFormSubmitSubscription(function (action) {
            console.log('Form submit Action added');
            formSubmitActions.push(action);
        }); 

        vm.init = function (data) {
            vm.taskInfo = data;
            parentActions = DataHolder.getParentFunctions();
            vm.taskResults = parentActions.getTaskResults();
            executeResult();
        };
         
        function executeResult() {
            if (vm.taskInfo) {
                var flowData = vm.taskInfo.flowData;
                vm.taskInfo.description = vm.taskInfo.flowData.description;
                flowData.formControls = [];
                var dynamicFormData = null;
                if (flowData.controlDataSource) {
                    var controlDataSource = flowData.controlDataSource; //control identifier of source
                    var taskResult = _.find(vm.taskResults, function (o) { return o.controlIdentifier === controlDataSource; });
                    if (taskResult && taskResult.status === "00") {
                        if (_.isArray(taskResult.data)) {
                            dynamicFormData = taskResult.data;
                        } else {
                            dynamicFormData = taskResult.data;
                        }
                    }
                }
                if (flowData.dataSourceFormat === "array") {
                    flowData.formControls = dynamicFormData;
                } else {
                    Object.keys(dynamicFormData).forEach(function(key) {
                        var control = {};
                        control.fieldLabel = key;
                        control.fieldName = key;
                        control.fieldValue = dynamicFormData[key];
                        if (flowData.readOnlyFields) {
                            control.fieldType = 'readonly';
                        } else {
                            control.fieldType = 'text';
                        }
                        flowData.formControls.push(control);
                    });
                }
                var hasDateField = false;
                var activateSelect2 = [];
                for (var k = 0, len = flowData.formControls.length; k < len; k++) {
                    var item = flowData.formControls[k];
                    var control = {};
                    control.fieldLabel = item.fieldLabel;
                    control.fieldName = item.fieldName;
                    control.fieldType = item.fieldType;
                    if(item.fieldValue){
                        control.fieldValue = item.fieldValue;
                    }
                    control.range = item.range;
                    control.required = true;
                    control.regex = item.regex;
                    if (control.fieldType === "number") {
                        control.fieldValue = Number(control.fieldValue);
                    }
                    control.validation = item.validation;
                    if (item.required != null) {
                        control.required = item.required;
                    }
                    if (["select", "multiselect"].indexOf(control.fieldType) > -1) {
                        control.dataSource = buildSelectOptions(item.selectOptionsDatasource);
                        if(control.dataSource.length > 12|| control.fieldType==='multiselect'){
                            activateSelect2.push("."+control.fieldName) ;
                        }
                    }
                    if(control.fieldType !== 'readonly' && control.fieldType!=='imageview'){
                            vm.readOnlyFieldsOnly=false;
                    }
                    if(["date"].indexOf(control.fieldType) > -1) {
                        hasDateField = true;
                    }
                    vm.formControls.push(control);
                }
                var queryData = BeforeRenderDataStore.getQueryData();
                queryData.forEach(function(item) {
                    var control = {};
                    control.fieldName = item.parameterName;
                    control.fieldType = "hidden";
                    control.fieldValue = item.parameterValue;
                    control.required = false;
                    vm.formControls.push(control);
                });
                if (activateSelect2.length){
                    $(document).ready(function() {
                        var selectItems = activateSelect2.join(', ');
                        $(selectItems).select2({
                            placeholder: '[Select one]'
                          });
                    });
                }
                if (hasDateField) {
                    initFlatPickrDateControl();
                }
            }
        }

        function buildSelectOptions(selectOptionsDatasource) {
            var dataSource = [];
            if (selectOptionsDatasource == null) {
                return dataSource;
            }
            var dt = selectOptionsDatasource;
            if (dt.inputFormat === "delimited") {
                var arr = dt.dropDownOptions.split(/[.,\n;]/);
                arr.forEach(function (txt) {
                    dataSource.push({ label: txt, value: txt });
                });
            } else if (dt.inputFormat === "csv") {
                var rows = dt.dropDownOptions.split(/[\n]+/);
                rows.forEach(function (txt) {
                    var arr = txt.split(/[ ;,.]+/);
                    if (arr.length > 1) {
                        dataSource.push({ label: arr[0], value: arr[1] });
                    } else {
                        dataSource.push({ label: arr[0], value: arr[0] });
                    }
                });
            } else if (dt.inputFormat === "json") {
                try {
                    var json = JSON.parse(dt.dropDownOptions);
                    if (json.length) {
                        buildDropSelectOptions(json);
                    }
                } catch (e) {
                    console.log("Error in ", e);
                }
            } else if (dt.inputFormat === "rest") {
                var task = utils._.filter(vm.taskResults, function (item) { return item.controlIdentifier === dt.dataSourceName });
                if (task.length) {
                    buildDropSelectOptions(task[0].data);
                }

            }
            return dataSource;

            function buildDropSelectOptions(array) {
                array.forEach(function (obj) {
                    if (typeof obj === 'string') {
                        dataSource.push({ label: obj, value: obj });
                        return;
                    }
                    var props = Object.keys(obj);
                    var keyprops = ["value", "id"];
                    var labelprops = ["label", "key"];
                    var keyfield = "";
                    var labelfield = "";
                    props.forEach(function(p) {
                        if (keyprops.indexOf(p) > -1) {
                            keyfield = p;
                        }
                        else if (p.indexOf("id") > 0) {
                            keyfield = p;
                        }
                        if (labelprops.indexOf(p) > -1) {
                            labelfield = p;
                        }
                        else if (p.indexOf("id") > 0) {
                            labelfield = p;
                        }
                    });
                    if (labelfield === "") {
                        labelfield = props[0];
                    }
                    if (keyfield === "") {
                        if (props.length > 1) {
                            keyfield = props[1];
                        }
                        else {
                            keyfield = props[0];
                        }
                    }
                    dataSource.push({ label: obj[labelfield], value: obj[keyfield] });
                });
            }
        }

        function buildPayload() {
            var scriptParameters = [];
            vm.formControls.forEach(function (control) {
                var parameter = {};
                parameter.parameterLabel = control.fieldLabel;
                parameter.parameterName = control.fieldName;
                parameter.parameterValue = control.fieldValue;
                parameter.parameterType = control.fieldType;
                if (["select", "multiselect"].indexOf(control.fieldType) > -1) {
                    parameter.optionsList = JSON.stringify(control.dataSource);
                    if (control.fieldType === 'multiselect') {
                        parameter.parameterValue = JSON.stringify(control.fieldValue);
                    }
                }
                scriptParameters.push(parameter);
            });
            return scriptParameters;
        }

        function buildFormDataJson() {
            var formData = {};
            vm.formControls.forEach(function (control) {
                formData[control.fieldName] = control.fieldValue;
                if (["select", "multiselect"].indexOf(control.fieldType) > -1) {
                     if (control.fieldType === 'multiselect') {
                        formData[control.fieldName]  = JSON.stringify(control.fieldValue);
                    }
                }
            });
            return formData;
        }

        function updateFormData(scriptParameters,formData) {
            scriptParameters.forEach(function (parameter) {
                parameter.parameterValue = formData[parameter.parameterName];
            });
        }

        //execute all actions form other controls that need to be executed on form submit
        function executeFormSubmitActions(callback) {
            var indexIterator = 0;
            var formInputs = [];
            function recursiveIterator() {
                var action = formSubmitActions[indexIterator];
                action(function(actionData) {
                    if (actionData.hasFormData) {
                        actionData.taskResult.forEach(function (input) {
                            formInputs.push(input);
                        });  
                    } 
                    indexIterator += 1;
                    if (indexIterator < formSubmitActions.length) {
                        recursiveIterator();
                    } else {
                        callback(formInputs);
                    }

                }); 
            }
            recursiveIterator();
        }

        vm.executeSupportTask = function(valid) {
            vm.formSubmitted = true;
            if (validateForm()) {
                var formInputs = buildPayload();
                var taskInfo = {};
                taskInfo.id = vm.taskInfo.id;
                taskInfo.controlName = vm.taskInfo.controlName;
                taskInfo.flowItemType = 'inputForm.html' ;
                taskInfo.controlIdentifier = vm.taskInfo.controlIdentifier;
                taskInfo.flowGroup = vm.taskInfo.flowGroup;
                taskInfo.taskResult = formInputs;
                taskInfo.formData = buildFormDataJson();
                taskInfo.updateFormData = updateFormData;
                parentActions.submitTaskResult(taskInfo, onFormSubmitSuccessCallback);
                 
            }
         }; 

        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }

        function validatePhone(phone) {
            var re = /^((2)(3)(3)\d{9})$/;
            return re.test(String(phone));
        }

        function onFormSubmitSuccessCallback() {
            if (vm.taskInfo.flowData.onSuccessResult === "clearData") {
                vm.formControls.forEach(function(control) {
                    control.fieldValue = '';
                    control.valid = false;
                    vm.formSubmitted=false;
                });
            }
        }

        function isWithinRange(val,min,max){
            if(_.isNumeric(min) && _.isNumeric(max)){
                console.log('MinMax >'+min +" >>"+max);
                if (val>= Number(min) && val <= Number(max)) {
                    return true;
                }
            }
            return false;
        }


        function validateForm() {
            for (var p = 0, len = vm.formControls.length; p < len; p++) {
                var fieldType = vm.formControls[p].fieldType;
                var control = vm.formControls[p];
                switch (fieldType) {
                case "textarea":
                case "text":
                {
                    console.log('Input required >>', control.required);
                    if(control.required) {
                        if (!_.isEmpty(control.fieldValue)) {
                            vm.formControls[p].valid = validateInput(vm.formControls[p]);
                            console.log("Called Validate Input");
                        } else {
                            vm.formControls[p].valid = false;
                        }
                    }else {
                        if (_.isEmpty(control.fieldValue)) {
                            vm.formControls[p].valid = true;
                        } else {
                            vm.formControls[p].valid = validateInput(vm.formControls[p]);
                        }
                    }
                    break;
                }
                case "number":
                {
                    if (control.required) {
                        if(_.isNumber(vm.formControls[p].fieldValue)){
                            vm.formControls[p].valid = validateInput(vm.formControls[p]);
                        }else{
                            vm.formControls[p].valid = false;
                        }
                    } else {
                        vm.formControls[p].valid = false;
                        if (control.fieldValue == null || control.fieldValue == "") {
                            vm.formControls[p].valid = true;
                            continue;
                        }
                        if (_.isNumeric(control.fieldValue)) {
                            vm.formControls[p].valid = validateInput(vm.formControls[p]);;
                        }
                    }
                    break;
                }
                case "date":
                {
                    if (control.required) {
                        if (/^\d{4}-([0]\d|1[0-2])-([0-2]\d|3[01])$/.test(control.fieldValue)) {
                            control.valid = true;
                        } else {
                            control.valid = false;
                        }
                    } else {
                        if (!_.isEmpty(control.fieldValue)) {
                            if (/^\d{4}-([0]\d|1[0-2])-([0-2]\d|3[01])$/.test(control.fieldValue)) {
                                control.valid = true;
                            } else {
                                control.valid = false;
                            }
                        } else {
                            control.valid = true;
                        }
                    }
                    break;
                }
                case "select":
                {
                    if (control.required) {
                        if (!_.isEmpty(control.fieldValue)) {
                            control.valid = true;
                        } else {
                            control.valid = false;
                        }
                    } else {
                        control.valid = true;
                    }
                    break;
                }
                case "multiselect":
                {
                    if (control.required) {
                        if (!_.isEmpty(control.fieldValue)) {
                            control.valid = true;
                        } else {
                            control.valid = false;
                        }
                    } else {
                        control.valid = true;
                    }
                    break;
                }
                default:
                        control.valid = true;
                }

            }
            function isInvalid(c) {
                return !c.valid;
            }
            var validationResult = !vm.formControls.some(isInvalid);
            return validationResult;
        }

        function validateInput(control) {
            var validationResult = { valid: false, message: "" };
            if (control.validation == null) {
                control.validation = '_none_';
            }
            switch (control.validation) {
            case "_none_":
            {
                validationResult.valid = true;
                break;
            }
            case "text":
            {
                validationResult.valid = true;
                console.log("Control fieldValue is >>", control.fieldValue);
                if (_.isEmpty(control.fieldValue)) {
                    validationResult.valid = false;
                    validationResult.message = "This field is required";
                }
                break;
            }
            case "number":
            {
                validationResult.valid = true;
                if (!_.isNumber(control.fieldValue)) {
                    validationResult.valid = false;
                    validationResult.message = "This field must be numeric";
                }
                break;
            }
            case "range":
                {
                    console.log('Range validation encountered >>>>',control);
                    validationResult.valid = true;
                    if (_.isNumber(control.fieldValue)) {
                        var range = control.range.split(",");
                        validationResult.valid = isWithinRange(control.fieldValue,range[0],range[1]);
                        if(!validationResult.valid){
                            validationResult.message = "Field must be withing "+range[0] +" and " +range[1];
                        }
                    }else{
                        validationResult.message = "This field must be numeric";
                    }
                    break;
                }
            case "email":
            {
                validationResult.valid = true;
                if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid Email";
                }
                break;
            }
            case "phone":
            {
                validationResult.valid = true;
                if (/^((2)(3)(3)\d{9})$/.test(control.fieldValue) || /^((0)\d{9})$/.test(control.fieldValue) ) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid phone number";
                }
                break;
            }
            case "regex":
            {
                var regex = new RegExp(control.regex);
                if (regex.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = true;
                    validationResult.message = "Invalid input";
                }
                break;
            }
            case "account":
            {
                if (/^(\d{10})$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid phone number";
                }
            }
            case "accountOrEmail":
            {
                if (validateEmail(control.fieldValue) || /^(\d{10})$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid phone number or email";
                }
                break;
            }
            case "accountOrPhone":
            {
                if (/^((2)(3)(3)\d{9})$/.test(control.fieldValue) || /^(\d{10})$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid account or phone number";
                }
            }
            case "phoneOrEmail":
            {
                if (validateEmail(control.fieldValue) || /^((2)(3)(3)\d{9})$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid phone number or email";
                }
                break; 
            }
            case "accountOrPhoneOrEmail":
            {
                if (validateEmail(control.fieldValue) ||
                    validatePhone(control.fieldValue) ||
                    /^(\d{10})$/.test(control.fieldValue)) {
                    validationResult.valid = true;
                } else {
                    validationResult.valid = false;
                    validationResult.message = "Invalid account, phone or email";
                }
                break;
            }
            }
            console.log("The Validation result >>>", validationResult);
            return validationResult.valid;
        }

        function initFlatPickrDateControl() {
            $(document).ready(function() {
                $(".flatpickr-input").flatpickr({ dateFormat: "Y-m-d" });
            });
        }
        
    }

     
})(window.jQuery, window.hljs);