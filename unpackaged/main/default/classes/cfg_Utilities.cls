/*
-----------------------------------------------------------------------------------------------------------------------------
Author: Stefan Cudjoe – Cloud for Good (stefan.cudjoe@cloud4good.com)

Description: Utilities class for reusable code used in various classes.
History
<Date>			<Authors Name>		<User Story>		<Brief Description of Change>
2024-07-17		Stefan Cudjoe	       CFG-398 		     Class Creation
2024-08-09      Radhika Sharma         CFG-417           Added error handling methods
----------------------------------------------------------------------------------------------------------------------------
*/

public with sharing class cfg_Utilities {

    /**
     * @Author - Stefan Cudjoe
     * @Date - 2024-07-17
     * @Description: Method to retrieve and return NetworkId for the given Network
     * @param networkName - String - Network Name
     * @return NetworkId
     */
    public static Id getNetworkId(String networkName){
        return [SELECT Id, Name FROM Network WHERE Name =: networkName][0].Id;
    }

    /**
    * @description This method creates a cfg_Error__c record based on an Exception passed in.
    * @param eException - Exception - Exception object
    * @param errorType - String - Error Type
    * @param objectType - String - Object Type
    * @param contextType - String - Context Type
    * @param relatedSystem - String - Related System of the Error
    * @param recordId - String - Record Id if known
    * @return cfg_Error__c.
    */
    public static cfg_Error__c createErrorRecordFromException(Exception eException, String errorType, String objectType, String contextType, String relatedSystem, String recordId){
        //log an error on the error object
        return createErrorRecord(errorType, objectType, contextType, relatedSystem, recordId, null, null, eException);
    }

    /**
    * @description This method creates a cfg_Error__c record based on parameters passed in.
    * @param errorType - String - Error Type
    * @param objectType - String - Object Type
    * @param contextType - String - Context Type
    * @param relatedSystem - String - Related System of the Error
    * @param recordId - String - Record Id if known
    * @param msg - String - Error Message
    * @param stackTrace - String - Stack Trace Error detail
    * @param eException - Exception - Exception object
    * @return cfg_Error__c record
    */
    public static cfg_Error__c createErrorRecord(String errorType, String objectType, String contextType, String relatedSystem, String recordId, String msg, String stackTrace, Exception eException) {
        cfg_Error__c errorLog = new cfg_Error__c();
        errorLog.cfg_Error_Type__c = errorType;
        errorLog.cfg_Datetime__c = system.now();
        errorLog.cfg_Object_Type__c = objectType;
        errorLog.cfg_Context_Type__c = contextType;
        errorLog.cfg_Related_System__c = relatedSystem;
        if (recordId != null && recordId != '' && objectType != null && objectType != '') {
            errorLog.cfg_Record_URL__c = URL.getOrgDomainUrl().toExternalForm() + cfg_Constants.URL_LIGHTNING + objectType + cfg_Constants.URL_SLASH + recordId + cfg_Constants.URL_SLASH + cfg_Constants.URL_VIEW;
        }
        if (eException != null) {
            errorLog.cfg_Stack_Trace__c = eException.getStackTraceString();
            errorLog.cfg_Full_Message__c = eException.getMessage();
        }
        if (msg != null && stackTrace != null){
            errorLog.cfg_Full_Message__c = msg;
            errorLog.cfg_Stack_Trace__c = stackTrace;
        }

        return errorLog;
    }

    /**
    * @description This method creates an error record based on parameters passed in.
    * @param errorType - String - Error Type
    * @param objectType - String - Object Type
    * @param contextType - String - Context Type
    * @param relatedSystem - String - Related System of the Error
    * @param recordId - String - Record Id if known
    * @param msg - String - Error Message
    * @param stackTrace - String - Stack Trace Error detail
    * @return cfg_Error__c record
    */
    public static cfg_Error__c createErrorRecord(String errorType, String objectType, String contextType, String relatedSystem, String recordId, String msg, String stackTrace) {

        return createErrorRecord(errorType, objectType, contextType, relatedSystem, recordId, msg, stackTrace, null);

    }

}