(function ($) {
    angular
        .module('app')
        .factory('AceEditor', AceEditor);
    AceEditor.$inject = ['$window'];
    function AceEditor($window) {
        var baseUrl = $("#___applicationbaseUrl").val();
        $window.ace.config.set('basePath', baseUrl + '/vendor/ace-editor');
        const editors ={};
        if (baseUrl === "") {
            baseUrl = "/";
        }         
        function initializeEditor(language,elementId,code,onchangeCb){
            if(Object.keys(editors).indexOf(elementId) > -1){
                 return;
            }
            var editor = $window.ace.edit(elementId);
            editor.setTheme("ace/theme/monokai");
            editor.session.setMode("ace/mode/"+language);
            editor.setValue(code);
            editor.getSession().on('change', function () {
                if(onchangeCb){
                    onchangeCb(editor.getSession().getValue());
                } 
            });
            editors[elementId]=editor;
            document.getElementById(elementId).style.height = "300px";
            console.log('Editor initialized') 
        }
        
        function setMode(language,elementId,code){
            console.log('Set mode The element >>'+elementId+ " the language>>"+language);
            editors[elementId].session.setMode("ace/mode/"+language);
            editors[elementId].setValue(code);
            editors[elementId].clearSelection();
        }

        return {
            initialize: initializeEditor,
            setMode:setMode
        } 
    }
})(window.jQuery);