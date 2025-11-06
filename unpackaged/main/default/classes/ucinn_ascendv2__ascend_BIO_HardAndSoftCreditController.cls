/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ascend_BIO_HardAndSoftCreditController {
    global static List<ucinn_ascendv2.ascend_BIO_HardAndSoftCreditController.GivingDetailFromHardSoftCredit> getGivingDetailListFromHSC(List<ucinn_ascendv2__Hard_and_Soft_Credit__c> details) {
        return null;
    }
global class GivingDetailFromHardSoftCredit {
    global Id accountId {
        get;
        set;
    }
    global Double amount {
        get;
        set;
    }
    global Boolean anonymous {
        get;
        set;
    }
    global String appeal {
        get;
        set;
    }
    global Id appealLink {
        get;
        set;
    }
    global String businessUnit {
        get;
        set;
    }
    global Id contactID {
        get;
        set;
    }
    global Date creditDate {
        get;
        set;
    }
    global Id creditRecipientId {
        get;
        set;
    }
    global String creditType {
        get;
        set;
    }
    global String currencyIsoCode {
        get;
        set;
    }
    global Boolean defaultSpouseSoftCredit {
        get;
        set;
    }
    global String department {
        get;
        set;
    }
    global String department2 {
        get;
        set;
    }
    global String department2Text {
        get;
        set;
    }
    global String departmentText {
        get;
        set;
    }
    global String designation {
        get;
        set;
    }
    global Id designationDetail {
        get;
        set;
    }
    global Id designationLookup {
        get;
        set;
    }
    global String designationLUDept {
        get;
        set;
    }
    global String designationName {
        get;
        set;
    }
    global Id detailRecordId {
        get;
        set;
    }
    global Double finalAmount {
        get;
        set;
    }
    global Date giftDate {
        get;
        set;
    }
    global String giftNo {
        get;
        set;
    }
    global String giftType {
        get;
        set;
    }
    global String hardCreditDonor {
        get;
        set;
    }
    global Id hardCreditRecipientConstituent {
        get;
        set;
    }
    global Id hardCreditRecipientOrganization {
        get;
        set;
    }
    global Boolean isGivingDetail {
        get;
        set;
    }
    global Double nonGiftAmount {
        get;
        set;
    }
    global String opportunityGiftType {
        get;
        set;
    }
    global Id opportunityId {
        get;
        set;
    }
    global String paymentGroupId {
        get;
        set;
    }
    global String pledgeId {
        get;
        set;
    }
    global ucinn_ascendv2__Hard_and_Soft_Credit__c reference {
        get;
        set;
    }
    global Id sessionId {
        get;
        set;
    }
    global String tenderType {
        get;
        set;
    }
    global Double totalAmount {
        get;
        set;
    }
    global Double totalRecurringAmount {
        get;
        set;
    }
    global String transactionCurrencyIsoCode {
        get;
        set;
    }
    global GivingDetailFromHardSoftCredit(ucinn_ascendv2__Hard_and_Soft_Credit__c credit) {

    }
    global void processHardSoftCreditCommonFields(ucinn_ascendv2__Hard_and_Soft_Credit__c credit) {

    }
    global void processHardSoftCreditFromPayment(ucinn_ascendv2__Hard_and_Soft_Credit__c credit) {

    }
    global void processHardSoftCreditFromPledge(ucinn_ascendv2__Hard_and_Soft_Credit__c credit) {

    }
}
global class GivingDetailSummaryWrapper {
    global Decimal amountAppliedToSummary {
        get;
        set;
    }
    global Map<String,ucinn_ascendv2.ascend_BIO_HardAndSoftCreditController.GivingDetailFromHardSoftCredit> currentGivingDetailMap {
        get;
        set;
    }
    global Decimal fundraisedCampaignCreditAmount {
        get;
        set;
    }
    global Decimal fundraisedCreditAmount {
        get;
        set;
    }
    global Decimal paidCreditAmount {
        get;
        set;
    }
    global Decimal paidCreditCampaignAmount {
        get;
        set;
    }
    global GivingDetailSummaryWrapper() {

    }
}
}
