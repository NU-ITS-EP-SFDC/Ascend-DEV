/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ascend_CUR_Utils {
    global static String ACTUAL_CORP_CURRENCY;
    global static Map<String,List<ucinn_ascendv2.ascend_CUR_Utils.CurrencyFieldNames>> actualCurrencyFieldNamesMap;
    global static String CORPORATE_CURRENCY {
        get;
    }
    global static Map<String,ucinn_ascendv2.ascend_CUR_Utils.CurrencyConversionObjects> currencyConversionObjectsMap;
    global static Map<String,List<ucinn_ascendv2.ascend_CUR_Utils.CurrencyFieldNames>> currencyFieldNamesMap {
        get;
        set;
    }
    global static Boolean isRunningMCTest;
    global static Map<Id,String> operatingEntityCurrencyMap;
    global ascend_CUR_Utils() {

    }
    global static Decimal convertCurrency(String sourceCurency, String targetCurrency, Date conversionDate, Decimal amountToConvert, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionMap) {
        return null;
    }
    global static void exchangeCurrency(List<SObject> triggerNew, List<SObject> triggerOld, Boolean isUpdate, String objectAPIName) {

    }
    global static void fireCurrencyExchangeBatchIfNecessary(List<SObject> triggerNew, List<SObject> triggerOld, Boolean isUpdate, String objectAPIName) {

    }
    global static String getConversionExchangeName(String baseCurrency, String targetCurrency, Date conversionDate) {
        return null;
    }
    global static Decimal getConversionRate(String baseCurrency, String targetCurrency, ucinn_ascendv2__Currency_Dated_Exchange_Rate__c exchangeRateSetting) {
        return null;
    }
    global static String getCorporateCurrencyISOCode() {
        return null;
    }
    global static ucinn_ascendv2.ascend_CUR_Utils.CurrencyConversionRates getCurrencyConversionRates(List<SObject> recordsToProcess, String objectAPIName) {
        return null;
    }
    global static ucinn_ascendv2__Currency_Dated_Exchange_Rate__c getDatedExchangeRateFromCustomSettingMap(String firstCurrency, String secondCurrency, Date conversionDate, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionRateMap) {
        return null;
    }
    global static String getOperatingEntityCurrency(Id operatingEntityId) {
        return null;
    }
    global static String getOperatingEntityCurrencyFromRecord(SObject record, ucinn_ascendv2.ascend_CUR_Utils.CurrencyFieldNames currencyFieldNames) {
        return null;
    }
    global static List<SObject> getRecordsToProcess(List<SObject> triggerNew, List<SObject> oldMap, Boolean isUpdate, String objectAPIName) {
        return null;
    }
    global static Boolean hasEmptyLists(List<SObject> recordsToProcess, List<ucinn_ascendv2.ascend_CUR_Utils.CurrencyFieldNames> currencyFieldNamesList) {
        return null;
    }
    global static Boolean isRunningMulticurrency() {
        return null;
    }
    global static void mergeCurrencyConversionObjectsMap(Map<String,ucinn_ascendv2.ascend_CUR_Utils.CurrencyConversionObjects> currencyConversionObjectsMapToMerge) {

    }
    global static Boolean performCurrencyConversions(List<SObject> recordsToProcess, String objectAPIName) {
        return null;
    }
    global static void performCurrencyConversions(List<SObject> recordsToProcess, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionMap, String objectAPIName) {

    }
    global static void populateConversionAndMissingMap(String firstCurrency, String secondCurrency, Date conversionDate, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionRateMap, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> missingConversionRate) {

    }
    global static void populateOECurrencyMap(List<SObject> triggerNew, String objectAPIName) {

    }
    global static void putRecordsToProcess(List<SObject> recordsToProcess, List<ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> missingExchangeRates, String objectAPIName) {

    }
    global static void setCorporateAmountToZero(List<SObject> recordsToProcess, String objectAPIName) {

    }
    global static void setCorporateCurrency(List<SObject> triggerNew, String objectAPIName) {

    }
    global static Boolean shouldRunActualMCCode() {
        return null;
    }
global class CurrencyConversionObjects {
    global List<ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> missingExchangeRates;
    global String objectAPIName;
    global Set<Id> recordIdsToProcess;
    global List<SObject> recordsToProcess;
    global CurrencyConversionObjects() {

    }
}
global class CurrencyConversionRates {
    global Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionRateMap;
    global Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> missingConversionRate;
    global CurrencyConversionRates(Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> currencyConversionRateMap, Map<String,ucinn_ascendv2__Currency_Dated_Exchange_Rate__c> missingConversionRate) {

    }
}
global class CurrencyFieldNames {
    global String conversionDateField;
    global String corporateAmountField;
    global String operatingEntityAmountField;
    global String operatingEntityLookupField;
    global String transactionAmountField;
    global String transactionCurrencyField;
    global CurrencyFieldNames(String transactionAmountField, String transactionCurrencyField, String corporateAmountField, String operatingEntityAmountField, String operatingEntityLookupField, String conversionDateField) {

    }
}
}
