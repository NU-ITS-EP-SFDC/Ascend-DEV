/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ascend_GIFT_TransactionEntryBase {
    global ascend_GIFT_TransactionEntryBase() {

    }
    global virtual Object SERVER_handleFieldValidation(Map<String,Object> validationInfo) {
        return null;
    }
    global virtual Object SERVER_handleLoadRTv2(Map<String,Object> transactionInfo) {
        return null;
    }
    global virtual Object SERVER_handleTransactionEntryBeforeSave(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object SERVER_handleTransactionEntry(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object SERVER_handleTransactionQuery(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object checkForDuplicates(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Map<String,Object> checkIsAnon(Map<String,Object> transactionRecords, ucinn_ascendv2__Payment__c paymentRec, Opportunity oppRec, String payerInfoId) {
        return null;
    }
    global virtual List<String> getListOfAccessibleFields(Schema.DescribeSObjectResult describeResult) {
        return null;
    }
    global virtual void performAutoRenewMembershipWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performAutoRenewingMembershipPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performAutoRenewingPOSPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performAutoRenewingPOSWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performGiftValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performGiftWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performInstallmentBasedMembershipPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performInstallmentBasedMembershipWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performInstallmentBasedPOSPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performInstallmentBasedPOSWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performMatchingGiftPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performMatchingGiftValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performMatchingGiftWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performMatchingPaymentValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performMembershipValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performOneTimeMembershipWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performOneTimePOSWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performOverpaymentCheck(Map<String,Object> transactionRecords, Map<String,Object> warningMap, Integer index) {

    }
    global virtual void performPOSPaymentValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performPOSValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performPartialPaymentPOSPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performPartialPaymentPOSWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performPledgePaymentValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performPledgePaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performPledgePaymentWizardWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performPledgeValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performPledgeWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performRecurringGiftPaymentValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performRecurringGiftPaymentWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual void performRecurringGiftValidations(Map<String,Object> transactionRecords) {

    }
    global virtual void performRecurringGiftWarningChecks(Map<String,Object> transactionRecords, Map<String,Object> warningMap) {

    }
    global virtual Object performSaveAutoRenewMembership(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveAutoRenewingMembershipPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveAutoRenewingPOSPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveAutoRenewingPOS(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveGiftProcessingPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveGiftToPledge(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveGift(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveInstallmentBasedMembershipPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveInstallmentBasedMembership(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveInstallmentBasedPOSPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveInstallmentBasedPOS(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveMatchingGift(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveOneTimeMembership(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveOneTimePOS(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSavePartialPaymentPOSPayment(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSavePartialPaymentPOS(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSavePledgeToPledge(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSavePledge(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveRecurringGift(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSaveWizard(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performSave(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object performValidations(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Map<String,Object> performWarningChecks(Map<String,Object> transactionRecords) {
        return null;
    }
    global virtual Object prepNecessaryDataForAutoRenewingPaymentTransactions(Map<String,Map<String,Object>> returnMap, String recordId) {
        return null;
    }
    global virtual Object prepNecessaryDataForAutoRenewingTransactions(Map<String,Map<String,Object>> returnMap, String recordId) {
        return null;
    }
    global virtual Object prepNecessaryDataForInstallmentBasedPaymentTransactions(Map<String,Map<String,Object>> returnMap, String recordId) {
        return null;
    }
    global virtual Object prepNecessaryDataForInstallmentBasedTransactions(Map<String,Map<String,Object>> returnMap, String recordId) {
        return null;
    }
    global virtual Object prepNecessaryDataForOneTimeTransactions(Map<String,Map<String,Object>> returnMap, String recordId) {
        return null;
    }
    global virtual void preprocessSaveParseParamsGeneral(Map<String,Object> transactionRecords) {

    }
    global virtual Object processHardAndSoftCreditFieldChangeComponentHandled(Map<String,Object> fieldChangeInfo) {
        return null;
    }
    global virtual void processRTv2OutrightIntoLWC(Map<Object,Object> transactionRecords, ucinn_ascendv2__Review_Transaction_v2__c reviewTransV2Rec, String rtv2TransactionType) {

    }
    global virtual void processRTv2PledgeIntoLWC(Map<Object,Object> transactionRecords, ucinn_ascendv2__Review_Transaction_v2__c reviewTransV2Rec, String rtv2TransactionType, List<String> rtv2FieldSet) {

    }
    global virtual void processRTv2PledgePaymentIntoLWC(Map<Object,Object> transactionRecords, ucinn_ascendv2__Review_Transaction_v2__c reviewTransV2Rec, String rtv2TransactionType) {

    }
    global virtual void processRTv2RecurringGiftIntoLWC(Map<Object,Object> transactionRecords, ucinn_ascendv2__Review_Transaction_v2__c reviewTransV2Rec, String rtv2TransactionType, List<String> rtv2FieldSet) {

    }
    global virtual void processRTv2RecurringGiftPaymentIntoLWC(Map<Object,Object> transactionRecords, ucinn_ascendv2__Review_Transaction_v2__c reviewTransV2Rec, String rtv2TransactionType) {

    }
    global virtual Object queryForChildObjectsOnceRemoved(Map<String,Schema.DescribeSObjectResult> childObjectsOnceRemovedMap, List<SObject> sobjectList) {
        return null;
    }
    global virtual Object queryForOpportunityAndPayments(Map<String,Map<String,Object>> returnMap, String recordId, String transactionType) {
        return null;
    }
    global virtual Object queryForOpportunityAndPayments(Map<String,Map<String,Object>> returnMap, String recordId, String transactionType, Boolean isToPledgePaymentAdjustment) {
        return null;
    }
    global virtual void setInstallmentToPaymentAmounts(List<Map<String,String>> installmentPaymentMap, ucinn_ascendv2__Payment__c paymentRec, List<ucinn_ascendv2__Payment__c> designationPaymentList, Map<Id,Map<Id,Decimal>> installmentToPaymentsAmountMap, Map<Id,Decimal> installmentToAmountMap, Map<String,Decimal> designationToAmountMap, Map<Id,Decimal> newTransactionsInstallmentToAmountMap, Set<Id> paidDesignationId, String transactionType, ucinn_ascendv2__Gift_Processing_Setting__mdt giftProcessingSetting) {

    }
    global virtual void setInstallmentToPaymentAmounts(Map<String,Object> params) {

    }
}
