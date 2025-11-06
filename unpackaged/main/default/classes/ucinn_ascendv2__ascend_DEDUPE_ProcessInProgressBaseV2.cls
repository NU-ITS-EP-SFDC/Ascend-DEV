/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ascend_DEDUPE_ProcessInProgressBaseV2 {
    global Map<String,Object> additionalVariables;
    global ucinn_ascendv2.ascend_BIO_AutoMergeHelper autoMergeHelper;
    global Map<String,ucinn_ascendv2.ascend_CUR_Utils.CurrencyConversionObjects> currencyConversionObjectsMapStateful;
    global ucinn_ascendv2.ascend_BIO_ManualMergeBase mergeBase;
    global ascend_DEDUPE_ProcessInProgressBaseV2() {

    }
    global virtual void afterProcessInterims(Map<String,Object> params) {

    }
    global virtual void assignInterimStatusesBasedOnSaveResults(List<Database.SaveResult> saveResults, List<SObject> sObjList, List<Id> interimIds, Map<Id,ucinn_ascendv2__Interim__c> interimMap, Set<Id> interimsThatNeedToBeManuallyReviewed) {

    }
    global virtual void batchConstructor(String recordTypeName, String recordTypeNamespace) {

    }
    global virtual void batchExecute(Database.BatchableContext BC, List<SObject> interimList) {

    }
    global virtual void batchFinish(Database.BatchableContext BC) {

    }
    global virtual Database.QueryLocator batchStart(Database.BatchableContext BC) {
        return null;
    }
    global virtual void beforeProcessInterims(Map<String,Object> params) {

    }
    global virtual void multiCurrencySupport() {

    }
    global virtual void performMergeLogicOnEachInterim(Map<String,Object> params) {

    }
    global virtual void prepareAccountInformation(Map<String,Object> params) {

    }
    global virtual void prepareContactInformation(Map<String,Object> params) {

    }
    global virtual void processInterims(Map<String,Object> params) {

    }
}
