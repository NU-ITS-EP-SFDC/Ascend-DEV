/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ascend_GIFT_MembershipUtils {
    global ascend_GIFT_MembershipUtils() {

    }
    global static Date getAnniversaryDateBasedOnRecipientInformation(Id recipientId, Id membershipLevelId) {
        return null;
    }
    global static List<Map<String,Object>> getDeconstructedInstallmentListWithCustomAmountToPayValue(Decimal paymentAmount, Id opportunityId) {
        return null;
    }
    global static List<Map<String,Object>> getDeconstructedInstallmentListWithCustomAmountToPayValue(Map<String,Object> params) {
        return null;
    }
    global static List<ucinn_ascendv2__Designation_Detail__c> getDesignationDetailListWithUpdatedExpirationDates(Decimal paymentAmount, Id opportunityId, String transactionType) {
        return null;
    }
    global static List<ucinn_ascendv2__Payment__c> getDesignationPaymentList(Decimal paymentAmount, Decimal nonGiftAmount, Id opportunityId, String transactionType) {
        return null;
    }
    global static List<ucinn_ascendv2__Payment__c> getDesignationPaymentList(Decimal paymentAmount, Decimal nonGiftAmount, Id opportunityId, String transactionType, Map<Decimal,List<Asset>> nestedAssetMap) {
        return null;
    }
    global static List<ucinn_ascendv2__Payment__c> getDesignationPaymentList(Decimal paymentAmount, Id opportunityId, String transactionType) {
        return null;
    }
    global static List<ucinn_ascendv2__Payment__c> getDesignationPaymentList(Map<String,Object> params) {
        return null;
    }
    global static Date getExpirationDateBasedOnRecipientInformation(Id recipientId, Id membershipLevelId, String transactionType) {
        return null;
    }
    global static Date getExpirationDateProrated(Decimal originalAmount, Date originalExpirationDate, Date anniversaryDate, Id membershipLevelId, String fieldValue, String transactionType) {
        return null;
    }
    global static List<SObject> getLevelBenefitInformationBasedOnMembershipLevel(Id membershipLevel, List<String> fieldList) {
        return null;
    }
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> getListOfHardAndSoftCreditBasedOnDesignationDetailList(String transactionType, List<ucinn_ascendv2__Designation_Detail__c> designationDetailList, List<ucinn_ascendv2__Payment__c> paymentList, Id donorId) {
        return null;
    }
    global static List<ucinn_ascendv2__Installment__c> getListOfInstallmentsBasedOnDesignationDetailList(List<ucinn_ascendv2__Designation_Detail__c> designationDetailList) {
        return null;
    }
    global static List<ucinn_ascendv2__Installment__c> getListOfInstallmentsBasedOnDesignationDetailList(Opportunity opportunityRec, List<ucinn_ascendv2__Designation_Detail__c> designationDetailList, Boolean enableForExternalPaymentGateway) {
        return null;
    }
    global static List<SObject> getListOfProductsToAddAsAssets(Id membershipLevel) {
        return null;
    }
    global static Map<String,Object> getOpportunityTypeMapBasedOnMembershipLevel(Id membershipLevelId, String transactionType) {
        return null;
    }
    global static Date getPreviousExpirationDate(Id recipientId, Id membershipLevelId, List<ucinn_ascendv2__Society_Membership__c> societyMembershipList) {
        return null;
    }
    global static Decimal getPricebookValueFromMembershipLevel(Id membershipLevelId) {
        return null;
    }
    global static Decimal getTotalPriceValueFromAllMembershipLevels(Id membershipLevelId, List<ucinn_ascendv2__Designation_Detail__c> designationDetailList, Decimal index) {
        return null;
    }
    global static List<SObject> populateNonGiftItems(List<ucinn_ascendv2__Payment__c> paymentList, List<ucinn_ascendv2__Designation_Detail__c> designationDetailList) {
        return null;
    }
}
