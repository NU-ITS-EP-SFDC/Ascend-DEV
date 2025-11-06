/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ascend_ENGAGE_GenerateEmail {
    global ascend_ENGAGE_GenerateEmail() {

    }
    @AuraEnabled
    global static ucinn_ascendv2__Generated_Email__c createAndGenerateEmail(Id contactId, String prompt, ucinn_ascendv2__Generated_Email__c generatedEmail) {
        return null;
    }
    @InvocableMethod(label='Generate Email')
    global static List<ucinn_ascendv2.ascend_ENGAGE_GenerateEmail.Result> generateEmail(List<ucinn_ascendv2__Generated_Email__c> requests) {
        return null;
    }
    global static Map<String,Set<String>> getMergeFields(String prompt) {
        return null;
    }
    @AuraEnabled
    global static String getSettings(String prompt) {
        return null;
    }
    global static ucinn_ascendv2.ascend_ENGAGE_GenerateEmail.EmailConfigWrapper getSettingsWrapper(String prompt) {
        return null;
    }
    global static String replaceMergeFields(String prompt, Map<String,SObject> sObjectMap) {
        return null;
    }
global class EmailConfigAscendFieldWrapper {
    global EmailConfigAscendFieldWrapper() {

    }
}
global class EmailConfigEngageFieldWrapper {
    global EmailConfigEngageFieldWrapper() {

    }
}
global class EmailConfigWrapper {
    global EmailConfigWrapper() {

    }
}
global class Result {
    @InvocableVariable( description='Generated Email' required=false)
    global ucinn_ascendv2__Generated_Email__c generatedEmail;
    global Result() {

    }
}
}
