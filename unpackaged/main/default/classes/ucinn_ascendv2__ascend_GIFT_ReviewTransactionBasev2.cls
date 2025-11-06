/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ascend_GIFT_ReviewTransactionBasev2 {
    global static Map<String,Schema.SObjectField> accountFieldMap;
    global static Map<Id,Account> accountIdToAccountMap;
    global static String ADJUSTED_PAYMENT_EXTERNAL_ID_PREFIX;
    global static String ADJUSTED_PAYMENT_PREFIX;
    global static List<ucinn_ascendv2__Designation_Detail__c> adjustedDesignationDetailToUpdateList;
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> adjustedHardSoftCreditToUpdateList;
    global static List<ucinn_ascendv2__Installment__c> adjustedInstallmentToUpdateList;
    global static Map<Id,Set<String>> adjustedOppIdToPaymentGroupIds;
    global static List<Opportunity> adjustedOpportunityToUpdateList;
    global static Map<String,List<Opportunity>> adjustedPaymentGroupIdToOldMGsMap;
    global static Map<Id,ucinn_ascendv2__Payment__c> adjustedPaymentIdToAdjustedPaymentMap;
    global static List<ucinn_ascendv2__Payment__c> adjustedPaymentToUpdateList;
    global static List<ucinn_ascendv2__Review_Transaction_v2__c> adjustedReviewTransactionToUpdateList;
    global static List<ucinn_ascendv2__Stock_Payment__c> adjustedStockPaymentToUpdateList;
    global static List<ucinn_ascendv2__Stock__c> adjustedStockToUpdateList;
    global static List<ucinn_ascendv2__Tribute__c> adjustedTributeToUpdateList;
    global static String ADJUSTMENT_REASON_CANCELLED;
    global static String ADJUSTMENT_REASON_TERMINATED;
    global static String ADJUSTMENT_REASON_VOID;
    global static String ADJUSTMENT_REASON_WRITTEN_OFF;
    global static Map<String,Account> affiliatedAccountExternalIdToAccountMap;
    global static Map<Id,Account> affiliatedAccountIdToAccountMap;
    global static String AUTHORIZATION_CODE_PREFIX;
    global static Id autoRenewingMembershipRecordTypeId;
    global static Id autoRenewingPOSRecordTypeId;
    global static String AVERAGE_VALUE_ON_DATE_PREFIX;
    global static String BANK_REFERENCE_PREFIX;
    global static String CAMPAIGN_EXTERNAL_ID_PREFIX;
    global static String CAMPAIGN_PREFIX;
    global static Map<Id,Campaign> campaignIdToCampaignMap;
    global static String CHECK_DATE_PREFIX;
    global static String CHECK_NUMBER_PREFIX;
    global static Map<String,Schema.SObjectField> contactFieldMap;
    global static Map<Id,Contact> contactIdToContactMap;
    global static Map<Id,Contact> contactIdToInsertedContactMap;
    global static String CREDIT_CARD_EXPIRATION_DATE_PREFIX;
    global static String CREDIT_CARD_NUMBER_PREFIX;
    global static ucinn_ascendv2__Session__c currentNewSession;
    global static ucinn_ascendv2__Session__c currentSession;
    global static String DESIGNATION_EXTERNAL_ID_PREFIX;
    global static String DESIGNATION_PREFIX;
    global static Map<Id,ucinn_ascendv2__Installment__c> designationDetailIdToInstallmentMap;
    global static List<ucinn_ascendv2__Designation_Detail__c> designationDetailToInsertList;
    global static Map<Id,ucinn_ascendv2__Designation__c> designationIdToDesignationMap;
    global static Map<Id,Map<Id,ucinn_ascendv2__Hard_and_Soft_Credit__c>> designationIdToOwnerCredits;
    global static Map<Integer,Map<Integer,ucinn_ascendv2__Payment__c>> designationIndexToPaymentIndexToPaymentMap;
    global static Map<Id,Map<Id,Opportunity>> donorIdToOppIdToOppMapMap;
    global static Map<Id,Set<Id>> donorIdToSoftCreditContactIdSetMap;
    global static Map<String,List<Contact>> emailToContactListMap;
    global static Map<String,Id> externalIdToAccountIdMap;
    global static Map<String,Account> externalIdToAccountToInsertMap;
    global static Map<String,Id> externalIdToCampaignIdMap;
    global static Map<String,Id> externalIdToContactIdMap;
    global static Map<String,Contact> externalIdToContactToInsertMap;
    global static Map<String,ucinn_ascendv2__Designation__c> externalIdToDesignationMap;
    global static Map<String,Id> externalIdToMembershipLevelIdMap;
    global static Map<String,Opportunity> externalIdToOppToInsertMap;
    global static Map<String,Id> externalIdToPaymentIdMap;
    global static Map<String,Account> externalIdToPersonAccountToInsertMap;
    global static Map<String,ucinn_ascendv2__Review_Transaction_v2__c> externalIdToSummaryReviewTransaction;
    global static String FACE_VALUE_PREFIX;
    global ucinn_ascendv2__Gift_Processing_Setting__mdt giftProcessSettingsMetadata;
    global static Id giftRecordTypeId;
    global static String HARD_SOFT_CREDIT_AMOUNT_PREFIX;
    global static String HARD_SOFT_CREDIT_CONSTITUENT_EXTERNAL_ID_PREFIX;
    global static String HARD_SOFT_CREDIT_CONSTITUENT_PREFIX;
    global static String HARD_SOFT_CREDIT_DESIGNATION_NAME_PREFIX;
    global static String HARD_SOFT_CREDIT_ORGANIZATION_EXTERNAL_ID_PREFIX;
    global static String HARD_SOFT_CREDIT_ORGANIZATION_PREFIX;
    global static String HARD_SOFT_CREDIT_TYPE_PREFIX;
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> hardAndSoftCreditToInsertList;
    global static String HIGH_VALUE_ON_DATE_PREFIX;
    global static String IN_MEMORY_HONOR_COMMENTS_PREFIX;
    global static String IN_MEMORY_HONOR_CONTACT_EXTERNAL_ID_PREFIX;
    global static String IN_MEMORY_HONOR_CONTACT_PREFIX;
    global static String IN_MEMORY_HONOR_FIRST_NAME_PREFIX;
    global static String IN_MEMORY_HONOR_LAST_NAME_PREFIX;
    global static String IN_MEMORY_HONOR_NOTIFY_CONTACT_EXTERNAL_ID_PREFIX;
    global static String IN_MEMORY_HONOR_NOTIFY_CONTACT_PREFIX;
    global static String IN_MEMORY_HONOR_NOTIFY_FIRST_NAME_PREFIX;
    global static String IN_MEMORY_HONOR_NOTIFY_LAST_NAME_PREFIX;
    global static String IN_MEMORY_HONOR_ORGANIZATION_NAME_PREFIX;
    global static Map<Integer,Map<Integer,String>> indexToAdjustedPaymentExternalIdIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToAdjustedPaymentIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToAverageValueOnDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToFaceValueIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditAmountIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditConstituentExternalIdIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditConstituentIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditOrganizationExternalIdIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditOrganizationIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHardSoftCreditTypeIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToHighValueOnDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToInstallmentAmountIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToInstallmentDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToInstallmentFrequencyIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToLowValueOnDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNonGiftAmountIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNonGiftItemExternalIDIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNonGiftItemIDIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNonGiftPriceIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNonGiftQuantityIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNumberOfInstallmentsIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToNumberOfSharesIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPaymentAmountIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPaymentCustomExternalIdIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPaymentDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPOSProductAssetGrantModeIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPOSProductExternalIDIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPOSProductIDIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPOSProductPriceIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToPOSProductQuantityIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToReceivedDateIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToStockCompanyNameIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToTickerSymbolIndexApiNameMap;
    global static Map<Integer,Map<Integer,String>> indexToTotalStockAmountIndexApiNameMap;
    global static String INSTALLMENT_AMOUNT_PREFIX;
    global static String INSTALLMENT_DATE_PREFIX;
    global static String INSTALLMENT_FREQUENCY_PREFIX;
    global static Id installmentBasedMembershipRecordTypeId;
    global static Id installmentBasedPOSRecordTypeId;
    global static List<ucinn_ascendv2__Installment__c> installmentToInsertList;
    global static Map<String,Map<String,String>> installTypePaymentFrequencyMap;
    global static String LOW_VALUE_ON_DATE_PREFIX;
    global static List<ucinn_ascendv2__Payment__c> matchingCreditPmtsToClone;
    global static List<ucinn_ascendv2__Payment__c> matchingCreditPmtsToInsert;
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> matchingCreditsToClone;
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> matchingCreditsToInsert;
    global static Set<Id> matchingGiftIdsToBeAdjusted;
    global static List<ucinn_ascendv2__Payment__c> matchingGiftOldPaymentsToUpdateList;
    global static List<ucinn_ascendv2__Matching_Gift_Origination__c> matchingGiftOriginationsToInsertList;
    global static List<ucinn_ascendv2__Payment__c> matchingGiftPaymentsToInsertList;
    global static Id matchingGiftRecordTypeId;
    global static List<Opportunity> matchingGiftsToUpdateList;
    global static String MEMBERSHIP_ANNIVERSARY_DATE_PREFIX;
    global static String MEMBERSHIP_EXPIRATION_DATE_PREFIX;
    global static String MEMBERSHIP_LEVEL_EXTERNAL_ID_PREFIX;
    global static String MEMBERSHIP_LEVEL_PREFIX;
    global static Map<String,Id> membershipLevelExternalIdToMembershipIdMap;
    global static Map<Id,Product2> membershipLevelIdToMembershipLevelMap;
    global static Map<Id,List<ucinn_ascendv2__Designation_Detail__c>> newMatchingGiftIdToDesignationDetailsMap;
    global static Map<String,List<Opportunity>> newPaymentGroupIdToNewMGsMap;
    global static String NON_GIFT_AMOUNT_PREFIX;
    global static String NON_GIFT_ITEM_EXTERNAL_ID_PREFIX;
    global static String NON_GIFT_ITEM_PREFIX;
    global static String NON_GIFT_ITEM_PRICE_PREFIX;
    global static String NON_GIFT_ITEM_QUANTITY_PREFIX;
    global static Map<Id,PricebookEntry> nonGiftIdToPriceBookEntryMap;
    global static Map<String,Id> nonGiftItemExternalIdToNonGiftItemIdMap;
    global static Map<Id,Product2> nonGiftItemIdToNonGiftItemMap;
    global static List<Asset> nonGiftItemToInsertList;
    global static Id nonGiftRecordTypeId;
    global static Id nonGiftShellRecordTypeId;
    global static String NOTIFY_ADDRESS_1_PREFIX;
    global static String NOTIFY_ADDRESS_2_PREFIX;
    global static String NOTIFY_CITY_PREFIX;
    global static String NOTIFY_POSTAL_CODE_PREFIX;
    global static String NOTIFY_STATE_PREFIX;
    global static String NUMBER_OF_INSTALLMENTS_PREFIX;
    global static String NUMBER_OF_SHARES_PREFIX;
    global static Map<Id,Decimal> ogPledgeIdToRemainingAmountMap;
    global static Map<Id,ucinn_ascendv2__Designation_Detail__c> oldIdToDesignationDetailToInsertMap;
    global static Map<Id,ucinn_ascendv2__Hard_and_Soft_Credit__c> oldIdToHardSoftCreditToInsertMap;
    global static Map<Id,ucinn_ascendv2__Payment__c> oldIdToPaymentToInsertMap;
    global static Map<Id,ucinn_ascendv2__Stock__c> oldIdToStockToInsertMap;
    global static Id oneTimeMembershipRecordTypeId;
    global static Id oneTimePOSRecordTypeId;
    global static Map<String,Map<Id,ucinn_ascendv2__Designation_Detail__c>> oppExternalIdToDesignationIdToDesignationDetailMapMap;
    global static Map<Id,Map<String,ucinn_ascendv2__Designation_Detail__c>> oppIdToDesignationExternalIdToDesignationDetailMapMap;
    global static Map<Id,Map<Id,ucinn_ascendv2__Designation_Detail__c>> oppIdToDesignationIdToDesignationDetailMapMap;
    global static List<ucinn_ascendv2__Hard_and_Soft_Credit__c> oppLevelCredits;
    global static String OPPORTUNITY_EXTERNAL_ID_PREFIX;
    global static String OPPORTUNITY_PREFIX;
    global static List<Integer> orderedDesignationIndexList;
    global static Map<Integer,String> orderToAuthorizationCodeApiNameMap;
    global static Map<Integer,String> orderToBankReferenceApiNameMap;
    global static Map<Integer,String> orderToCampaignApiNameMap;
    global static Map<Integer,String> orderToCampaignExternalIdApiNameMap;
    global static Map<Integer,String> orderToCheckDateApiNameMap;
    global static Map<Integer,String> orderToCheckNumberApiNameMap;
    global static Map<Integer,String> orderToCreditCardExpirationDateApiNameMap;
    global static Map<Integer,String> orderToCreditCardNumberApiNameMap;
    global static Map<Integer,String> orderToDesignationApiNameMap;
    global static Map<Integer,String> orderToDesignationExternalIdApiNameMap;
    global static Map<Integer,String> orderToFaceValueApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorCommentsApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorContactApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorContactExternalIdApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorFirstNameApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorLastNameApiNameMap;
    global static Map<Integer,String> orderToInMemoryHonorOrganizationNameApiNameMap;
    global static Map<Integer,String> orderToInstallmentAmountApiNameMap;
    global static Map<Integer,String> orderToInstallmentDateApiNameMap;
    global static Map<Integer,String> orderToInstallmentFrequencyApiNameMap;
    global static Map<Integer,String> orderToMembershipAnniversaryDateApiNameMap;
    global static Map<Integer,String> orderToMembershipExpirationDateApiNameMap;
    global static Map<Integer,String> orderToMembershipLevelApiNameMap;
    global static Map<Integer,String> orderToMembershipLevelExternalIdApiNameMap;
    global static Map<Integer,String> orderToNonGiftAmountApiNameMap;
    global static Map<Integer,String> orderToNotifyAddress1ApiNameMap;
    global static Map<Integer,String> orderToNotifyAddress2ApiNameMap;
    global static Map<Integer,String> orderToNotifyCityApiNameMap;
    global static Map<Integer,String> orderToNotifyContactApiNameMap;
    global static Map<Integer,String> orderToNotifyContactExternalIdApiNameMap;
    global static Map<Integer,String> orderToNotifyFirstNameApiNameMap;
    global static Map<Integer,String> orderToNotifyHonorStateApiNameMap;
    global static Map<Integer,String> orderToNotifyLastNameApiNameMap;
    global static Map<Integer,String> orderToNotifyPostalCodeApiNameMap;
    global static Map<Integer,String> orderToNumberOfInstallmentsApiNameMap;
    global static Map<Integer,String> orderToOpportunityApiNameMap;
    global static Map<Integer,String> orderToOpportunityExternalIdApiNameMap;
    global static Map<Integer,String> orderToPaymentAmountApiNameMap;
    global static Map<Integer,String> orderToPaymentCustomPaymentGroupApiNameMap;
    global static Map<Integer,String> orderToPaymentCustomReceiptNumberApiNameMap;
    global static Map<Integer,String> orderToPaymentDateApiNameMap;
    global static Map<Integer,String> orderToSurchargeAmountApiNameMap;
    global static Map<Integer,String> orderToTenderTypeApiNameMap;
    global static Map<Integer,String> orderToTransactionNumberApiNameMap;
    global static Map<Integer,String> orderToTributeeApiNameMap;
    global static Map<Integer,String> orderToTributeTypeApiNameMap;
    global static Id partialPaymentPOSRecordTypeId;
    global static String PAYMENT_AMOUNT_PREFIX;
    global static String PAYMENT_CUSTOM_EXTERNAL_ID_PREFIX;
    global static String PAYMENT_CUSTOM_GROUP_ID_PREFIX;
    global static String PAYMENT_CUSTOM_RECEIPT_NUMBER;
    global static String PAYMENT_DATE_PREFIX;
    global static Map<String,ucinn_ascendv2__Payment__c> paymentExternalIdToPaymentMap;
    global static Set<String> paymentGroupIdToIgnoreSet;
    global static Map<Integer,String> paymentGroupIndexToPaymentGroupIdMap;
    global static Map<Integer,List<ucinn_ascendv2__Stock__c>> paymentGroupIndexToStockListMap;
    global static Map<String,List<ucinn_ascendv2__Payment__c>> paymentGroupToPaymentListMap;
    global static Map<Id,ucinn_ascendv2__Payment__c> paymentIdToPaymentMap;
    global static List<ucinn_ascendv2__Payment__c> paymentsToCreateMatchingGiftsList;
    global static List<ucinn_ascendv2__Payment__c> paymentToInsertList;
    global static Integer phantomPaymentCounter;
    global static Map<String,Id> phantomPaymentIdToOppIdMap;
    global static Map<Id,Opportunity> phantomPaymentOppIdToOppMap;
    global static Map<String,Opportunity> pledgeExternalSystemIdToPledgeMap;
    global static Map<Id,Opportunity> pledgeIdToPledgeMap;
    global static Id pledgeRecordTypeId;
    global static String POS_PRODUCT_ASSET_GRANT_MODE_PREFIX;
    global static String POS_PRODUCT_EXTERNAL_ID_PREFIX;
    global static String POS_PRODUCT_PREFIX;
    global static String POS_PRODUCT_PRICE_PREFIX;
    global static String POS_PRODUCT_QUANTITY_PREFIX;
    global static Map<String,Id> posProductExternalIdToPOSProductIdMap;
    global static Map<Id,Product2> posProductIdToPOSProductMap;
    global static Map<Id,PricebookEntry> posProductIdToPriceBookEntryMap;
    global static Id posProductRecordTypeId;
    global static List<Asset> posProductToInsertList;
    global static Set<String> potentialphantomPaymentIdSet;
    global static String RECEIVED_DATE_PREFIX;
    global static Map<String,Id> recordTypeMap;
    global static Map<String,Id> recordTypePrefixToRecordTypeIdMap;
    global static Map<String,ucinn_ascendv2__Review_Transaction_Prefix__mdt> recordTypePrefixToReviewTransPrefixesMap;
    global static Id recurringGiftRecordTypeId;
    global static Integer REVIEW_TRANSACTION_PREFIX_LENGTH;
    global static Map<String,ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData> reviewTransactionDataMap;
    global static Map<String,Opportunity> reviewTransExternalSystemIdToOppMap;
    global static Map<String,Schema.SObjectField> reviewTransFieldMap;
    global static Map<Id,ucinn_ascendv2__Session__c> sessionIdToSessionMap;
    global static String STOCK_COMPANY_NAME_PREFIX;
    global static List<ucinn_ascendv2__Stock_Payment__c> stockPaymentToInsertList;
    global static List<ucinn_ascendv2__Stock__c> stockToInsertList;
    global Map<String,ucinn_ascendv2__Review_Transaction_v2__c> summaryExternalSystemIdToSummaryReviewTransactionMap;
    global Map<String,ucinn_ascendv2__Review_Transaction_v2__c> summaryPrefixToSummaryReviewTransactionMap;
    global static Map<Id,ucinn_ascendv2__Review_Transaction_v2__c> summaryReviewTransactionIdMap;
    global static String SURCHARGE_AMOUNT_PREFIX;
    global static String TENDER_TYPE_PREFIX;
    global static Map<String,String> tenderTypeToCategoryMap;
    global static String TICKER_SYMBOL_PREFIX;
    global static String TOTAL_STOCK_AMOUNT_PREFIX;
    global static String TRANSACTION_NUMBER_PREFIX;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_MEMBERSHIP;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_MEMBERSHIP_PAYMENT;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_MEMBERSHIP_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_POS;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_POS_PAYMENT;
    global static String TRANSACTION_TYPE_AUTO_RENEWING_POS_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_GIFT;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_MEMBERSHIP;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_MEMBERSHIP_PAYMENT;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_MEMBERSHIP_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_POS;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_POS_PAYMENT;
    global static String TRANSACTION_TYPE_INSTALLMENT_BASED_POS_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_MATCHING_GIFT;
    global static String TRANSACTION_TYPE_MATCHING_GIFT_PAYMENT;
    global static String TRANSACTION_TYPE_MATCHING_GIFT_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_ONE_TIME_MEMBERSHIP;
    global static String TRANSACTION_TYPE_ONE_TIME_POS;
    global static String TRANSACTION_TYPE_PARTIAL_PAYMENT_POS;
    global static String TRANSACTION_TYPE_PARTIAL_PAYMENT_POS_PAYMENT;
    global static String TRANSACTION_TYPE_PARTIAL_PAYMENT_POS_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_PLEDGE;
    global static String TRANSACTION_TYPE_PLEDGE_PAYMENT;
    global static String TRANSACTION_TYPE_PLEDGE_WITH_PAYMENT;
    global static String TRANSACTION_TYPE_RECURRING_GIFT;
    global static String TRANSACTION_TYPE_RECURRING_GIFT_PAYMENT;
    global static String TRANSACTION_TYPE_RECURRING_GIFT_WITH_PAYMENT;
    global static String TRIBUTE_TYPE_PREFIX;
    global static String TRIBUTEE_PREFIX;
    global static List<ucinn_ascendv2__Tribute__c> tributeToInsertList;
    global static Boolean useEda;
    global ascend_GIFT_ReviewTransactionBasev2() {

    }
    global virtual Boolean IsPOSProductPaymentType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void afterProcessingReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global virtual void assignReviewTransactionsToBatch(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList, Integer batchSize) {

    }
    global virtual void beforeProcessingReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global String charAt(String str, Integer index) {
        return null;
    }
    global virtual void clearAndUpdateOpportunityRelatedExternalIdFields(Opportunity oppRec) {

    }
    global void clearExternalIdFieldsAndUpdateAdjustedReviewTrans(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity adjustedOpp) {

    }
    global void clearExternalIdFields(List<SObject> sObjList) {

    }
    global virtual void clearExternalPaymentGatewayIdFields(List<SObject> sObjList) {

    }
    global Opportunity clonePledgeWithRelatedLists(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void closeSession(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global virtual Opportunity createAutoRenewingMembership(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void createAutoRenewingMembershipAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual Opportunity createAutoRenewingPOS(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void createAutoRenewingPOSAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual SObject createConstituentOrOrganization(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,Object> params, SObject sObj) {
        return null;
    }
    global virtual Contact createConstituent(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,Object> params) {
        return null;
    }
    global ucinn_ascendv2__Designation_Detail__c createDesignationDetail(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Integer designationIndex, Id sessionId, Opportunity opportunityReference, ucinn_ascendv2__Designation__c designationReference) {
        return null;
    }
    global void createGift(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global List<ucinn_ascendv2__Hard_and_Soft_Credit__c> createHardAndSoftCredit(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetailReference, ucinn_ascendv2__Payment__c paymentReference, String source, String paymentGroupId, Integer designationIndex, Integer index, Id designationIdOverride) {
        return null;
    }
    global virtual List<ucinn_ascendv2__Hard_and_Soft_Credit__c> createHardAndSoftCredit(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetailReference, ucinn_ascendv2__Payment__c paymentReference, String source, String paymentGroupId, String receiptNumber, Integer designationIndex, Integer index, Id designationIdOverride) {
        return null;
    }
    global ucinn_ascendv2__Installment__c createInstallment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Decimal installmentAmount, Integer designationIndex, Integer index, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetail, Date paymentDate) {
        return null;
    }
    global virtual Opportunity createInstallmentBasedMembership(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void createInstallmentBasedMembershipAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual Opportunity createInstallmentBasedPOS(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void createInstallmentBasedPOSAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global List<ucinn_ascendv2__Installment__c> createInstallmentList(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Integer designationIndex, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetail) {
        return null;
    }
    global virtual void createInterim(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global Opportunity createMatchingGift(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global void createMatchingGiftAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual void createMatchingGiftsForPayments(List<ucinn_ascendv2__Payment__c> paymentList) {

    }
    global virtual void createNonGiftItem(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,ucinn_ascendv2__Designation_Detail__c> indexToNewDesignationDetailMap, Opportunity opp) {

    }
    global virtual void createOneTimeMembership(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual void createOneTimePOS(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual Account createOrganization(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,Object> params) {
        return null;
    }
    global virtual void createPOSProduct(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,ucinn_ascendv2__Designation_Detail__c> indexToNewDesignationDetailMap, Opportunity opp) {

    }
    global virtual Opportunity createPartialPaymentPOS(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual void createPartialPaymentPOSAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global ucinn_ascendv2__Payment__c createPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetailReference, String paymentTransactionType, String paymentGroupId, Integer designationIndex, Integer index, Id designationIdOverride) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c createPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opportunityReference, ucinn_ascendv2__Designation_Detail__c designationDetailReference, String paymentTransactionType, String paymentGroupId, String receiptNumber, Integer designationIndex, Integer index, Id designationIdOverride) {
        return null;
    }
    global String createPaymentGroupID(String SessionName, Id pledgeID) {
        return null;
    }
    global void createPaymentList(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opp, ucinn_ascendv2__Designation_Detail__c designationDetail, String paymentSource, String paymentHardSoftCreditSource, Integer designationIndex, Id designationIdOverride) {

    }
    global virtual void createPaymentList(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id sessionId, Opportunity opp, ucinn_ascendv2__Designation_Detail__c designationDetail, String paymentSource, String paymentHardSoftCreditSource, Integer designationIndex, Id designationIdOverride, Integer oppIndex) {

    }
    global Opportunity createPledge(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global void createPledgeAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global Opportunity createPledgeOrGift(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id recordTypeId, String oppType, String oppStageName) {
        return null;
    }
    global void createPledgeOrGiftPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity pledge, String paymentSource, String hardSoftCreditSource, Map<Id,ucinn_ascendv2__Designation_Detail__c> designationIdToDesignationDetailMap) {

    }
    global virtual void createPledgeOrGiftPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity pledge, String paymentSource, String hardSoftCreditSource, Map<Id,ucinn_ascendv2__Designation_Detail__c> designationIdToDesignationDetailMap, Integer oppIndex) {

    }
    global void createPledgeOrGiftRelatedLists(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Boolean createInstallment, Boolean createPayment, String pledgeGiftHardSoftCreditSource, String paymentSource, String paymentHardSoftCreditSource) {

    }
    global virtual void createPledgeOrGiftRelatedLists(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Boolean createInstallment, Boolean createPayment, Boolean createMGO, String pledgeGiftHardSoftCreditSource, String paymentSource, String paymentHardSoftCreditSource) {

    }
    global Opportunity createRecurringGift(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global void createRecurringGiftAndPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual void createSession(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global virtual void createSession(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Session__c sessionRec) {

    }
    global virtual void createSession(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void createStockListIfApplicable(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opportunityReference) {

    }
    global virtual void createSummaryReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void createTransaction(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global ucinn_ascendv2__Tribute__c createTribute(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opportunityReference, Integer index) {
        return null;
    }
    global virtual void filterReviewTransactionsIntoBatchs(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global Opportunity findPledge(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id pledgeId, Id donorId) {
        return null;
    }
    global virtual Opportunity findPledgeOrCreateGiftUsingMatchingOrder(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id pledgeId, Id donorId) {
        return null;
    }
    global virtual Opportunity findPledgeUsingDesignations(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Id donorId) {
        return null;
    }
    global String generateGUID() {
        return null;
    }
    global void getApplySoftCreditList(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void getApplySoftCreditList(Set<Id> contactIdSet, String queryString, String contactField, String relatedContactField) {

    }
    global virtual Id getConstituent(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Id getConstituentUsingBioDemo(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,Object> params) {
        return null;
    }
    global void getDcoSoftCreditList(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void getDcoSoftCreditList(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList, String queryString, String accountField, String contactField) {

    }
    global Map<String,ucinn_ascendv2__Designation__c> getExternalIdToDesignationMap(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {
        return null;
    }
    global Map<String,Id> getExternalIdToObjectIdMap(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList, Set<String> reviewTransExternalIdFieldSet, String objectName, String objectExternalIdField) {
        return null;
    }
    global String getFieldApiNameFromMap(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap, Map<Integer,String> indexToFieldApiNameMap, Integer designationIndex, Integer index) {
        return null;
    }
    global String getFieldApiNameWithValueFromMap(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap, Map<Integer,String> indexToFieldApiNameMap, Integer designationIndex, Integer index) {
        return null;
    }
    global Object getFieldValueFromMap(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap, Map<Integer,String> indexToFieldApiNameMap, Integer designationIndex, Integer index) {
        return null;
    }
    global void getHouseholdSoftCreditList(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global Integer getIndexFieldNumberOrder(String fieldApiNameWithoutNamespace) {
        return null;
    }
    global Integer getInnerIndexFieldNumberOrder(String fieldApiNameWithoutNamespace) {
        return null;
    }
    global Map<Integer,String> getOrderToFieldApiNameMap(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap, Map<Integer,String> indexToFieldApiNameMap, Integer designationIndex) {
        return null;
    }
    global virtual Id getOrganization(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Id getOrganizationUsingBioDemo(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,Object> params) {
        return null;
    }
    global virtual Decimal getPaymentAmountBasedOnPaymentMethod(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global Set<Integer> getPaymentGroupIndexSet(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToPaymentFieldIndexApiNameMap, Integer designationIndex) {
        return null;
    }
    global Set<Id> getPaymentIdSet(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToPaymentExternalIdFieldIndexApiNameMap) {
        return null;
    }
    global virtual Map<Id,Map<Id,Opportunity>> getPledgesAndGifts(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList, Set<String> contactIdSet, Set<String> contactExternalIdSet, Set<String> accountIdSet, Set<String> accountExternalIdSet, String donorExternalIdFieldWhereClause, Set<String> pledgeIdSet, Set<String> pledgeExternalSystemIdSet) {
        return null;
    }
    global Map<Id,Map<Id,Opportunity>> getPledgesAssociatedWithContactOrAccount(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {
        return null;
    }
    global String getPrefix(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual String getReceiptNumber(Boolean incrementReceiptNumber) {
        return null;
    }
    global Map<String,Id> getRecordTypesFromReviewTransactionPrefixesCustomSetting() {
        return null;
    }
    global virtual ucinn_ascendv2__Session__c getSession(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Decimal getTotalAmountForDesignation(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap, Map<Integer,String> indexToFieldApiNameMap, Integer designationIndex) {
        return null;
    }
    global virtual Id getUserId() {
        return null;
    }
    global virtual void initReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void initializeIndexedFields() {

    }
    global void insertTransactionRecords() {

    }
    global Boolean isDesignationSpecified(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, String designationExternalIdValueToCompare, Id designationLookupValueToCompare) {
        return null;
    }
    global Boolean isInManualReview(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isMatchedConstituent(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Contact cont, Map<String,Object> params) {
        return null;
    }
    global virtual Boolean isMatchedOrganization(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Account acct, Map<String,Object> params) {
        return null;
    }
    global virtual Boolean isMatchedSObject(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, SObject sObj, Map<String,Object> params) {
        return null;
    }
    global virtual Boolean isMembershipType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isNewPledgeOrGiftType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isNewPledgeOrGiftWithInstallmentType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isNonGiftOpportunityType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isNonGiftPaymentType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isPOSProductOpportunityType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isPOSType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isPaymentAgainstExistingPledgeGiftType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isPaymentForGiftsType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isPaymentForPledgesType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean isPaymentType(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global virtual Boolean isUsingDefaultCampaign(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global Boolean mapHasValue(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<Integer,String> indexToFieldApiNameMap) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populateCashCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populateCashCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populateCheckCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populateCheckCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populateCreditCardCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populateCreditCardCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populatePropertyCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populatePropertyCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populateStockGiftCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opportunityReference, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populateStockGiftCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, Opportunity opportunityReference, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global ucinn_ascendv2__Payment__c populateWireCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual ucinn_ascendv2__Payment__c populateWireCategoryPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, ucinn_ascendv2.ascend_GIFT_ReviewTransactionBasev2.ReviewTransactionData reviewTransData, ucinn_ascendv2__Payment__c payment, Integer designationIndex, Integer index) {
        return null;
    }
    global virtual void postValidateReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global virtual void preValidateReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void prepAdjustedPayment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global void prepDesignation(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global void prepHardSoftCredit(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global void prepReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void prepTribute(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {

    }
    global void processAdjustmentIfApplicable(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp) {

    }
    global virtual void processCancelledAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global void processGiftAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global virtual void processIndirectMatchingGiftAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity adjustedOpp) {

    }
    global virtual void processMatchingCreditPayments(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp) {

    }
    global void processPledgeAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global void processPledgePaymentAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global virtual void processReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void processReviewTransactions(List<ucinn_ascendv2__Review_Transaction_v2__c> triggerNew) {

    }
    @Future(callout=false)
    global static void processReviewTransactions(Set<Id> reviewTransIdSet) {

    }
    global virtual void processTerminatedAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global void processToGiftAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global void processToPledgePaymentAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global virtual void processVoidAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global virtual void processWrittenOffAdjustment(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Opportunity opp, Opportunity adjustedOpp) {

    }
    global virtual void queryForData(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global virtual void querySessions(Set<String> sessionIdSet) {

    }
    global virtual void sendPaymentsToDTD(List<ucinn_ascendv2__Review_Transaction_v2__c> triggerNew) {

    }
    global void setSingleIndexedFields(String fieldApiNameWithoutNamespace, String fieldName, Map<Integer,String> indexToFieldApiNameMap) {

    }
    global void setTwoIndicesFields(String fieldApiNameWithoutNamespace, String fieldName, Map<Integer,Map<Integer,String>> indexToFieldIndexApiNameMap) {

    }
    global virtual void setupReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
    global void trackDesignationDetailToInstallmentInfo(Set<Id> oppIdSet) {

    }
    global void updateFieldFromReviewTransField(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, SObject sObj, Map<String,Object> fieldToReviewTransFieldMap) {

    }
    global virtual void updateSummaryReviewTransaction(List<ucinn_ascendv2__Review_Transaction_v2__c> reviewTransList) {

    }
global class ApplicationException extends Exception {
}
global class ReviewTransactionData {
    global Set<String> accountDonorExternalIdFieldNameSet;
    global Boolean allowDesignMismatchForPledgePayment;
    global String autoApplyOppHardSoftCredits;
    global Boolean clearRemainingDesignationIfUseDesignationOnPledge;
    global Set<String> commentSet;
    global String constituentFieldsQueryAddition;
    global Set<String> constituentFieldsQueryAdditionSet;
    global Set<String> contactDonorExternalIdFieldNameSet;
    global Boolean createConstituentIfBioDemoNotMatch;
    global Map<String,Object> createConstituentOverrideMap;
    global Boolean createGiftIfPledgeNotFound;
    global Boolean createInterimIfNoConstituent;
    global Boolean createInterimIfNoOrganization;
    global Map<String,Object> createInterimOverrideMap;
    global Boolean createMatchingGiftsFromPayments;
    global Boolean createOrganizationIfBioDemoNotMatch;
    global Map<String,Object> createOrganizationInterimOverrideMap;
    global Map<String,Object> createOrganizationOverrideMap;
    global Boolean createPersonAccountIfBioDemoNotMatch;
    global Map<String,Object> createPersonAccountOverrideMap;
    global Boolean createSCForRelationshipOnMG;
    global Boolean defaultToManualReview;
    global Map<String,Object> designationDetailFieldToReviewTransFieldMap;
    global Set<String> designationExternalIdSet;
    global Set<Id> designationIdSet;
    global Set<String> donorExternalIdOverrideSet;
    global Boolean doNotSoftCreditDonorIfPayerDiff;
    global Boolean doNotUseApplySoftCredit;
    global Boolean doNotUseApprovalProcess;
    global Boolean doNotUseDonorControlSoftCredit;
    global Boolean doNotUseHardCredit;
    global Boolean doNotUseHouseholdSoftCredit;
    global Boolean doNotUseSourceContactSoftCredit;
    global String doubleTheDonationAccount;
    global Map<String,Object> hardSoftCreditFieldToReviewTransFieldMap;
    global List<ucinn_ascendv2__Hard_and_Soft_Credit__c> hardSoftCreditList;
    global String hscCalculationType;
    global Map<String,Object> installmentFieldToReviewTransFieldMap;
    global Map<String,Integer> installmentFrequencyToNumberMap;
    global String interimRecordTypePrefix;
    global Boolean isCreateSummary;
    global Boolean isEnableSpecialConditionBatching;
    global Boolean isPaymentToMultiplePledges;
    global Boolean isPledgeOnly;
    global Boolean isSummaryRecord;
    global Boolean keepOriginalComments;
    global Set<String> manualReviewReasonSet;
    global Boolean matchAgainstAnyPledgeOrGift;
    global Boolean matchAgainstDesignationsOfOwnPledgeOrGiftIfPledgeOrGiftNotFound;
    global Boolean matchConstituentAgainstBioDemo;
    global Map<String,Object> matchConstituentOverrideMap;
    global List<String> matchingOrder;
    global Boolean matchOrganizationAgainstBioDemo;
    global Map<String,Object> matchOrganizationOverrideMap;
    global Decimal nonSpecialConditionBatchSize;
    global Boolean onlyQueryForActiveAppeals;
    global Boolean onlyQueryForActiveDesignations;
    global Map<String,Object> oppFieldToReviewTransFieldMap;
    global String organizationFieldsQueryAddition;
    global Set<String> organizationFieldsQueryAdditionSet;
    global String organizationInterimRecordTypePrefix;
    global Map<String,Object> paymentFieldToReviewTransFieldMap;
    global Map<Integer,String> paymentGroupIndexToPaymentGroupIdMap;
    global Map<Integer,String> paymentGroupIndexToReceiptNumberMap;
    global List<ucinn_ascendv2__Payment__c> paymentList;
    global String paymentMethod;
    global String pledgeGiftStageQueryOverride;
    global Set<String> pledgeGiftStageQuerySet;
    global Boolean processSepartelyAfterLoad;
    global Boolean requireReviewedBeforePosting;
    global Integer REVIEW_TRANSACTION_PREFIX_LENGTH;
    global String reviewReasonForSpecialConditions;
    global Map<String,Object> sessionFieldToReviewTransFieldMap;
    global Boolean skipGivingSummaryCalculation;
    global Decimal specialConditionBatchSize;
    global String specialConditionCriteriaField;
    global Set<String> stageNameToAdjustmentReasonSet;
    global Map<String,Object> stockFieldToReviewTransFieldMap;
    global String summaryPrefix;
    global Decimal totalInstallmentAmount;
    global Decimal totalNonGiftAmount;
    global Decimal totalPaymentAmount;
    global Map<String,Object> tributeFieldToReviewTransFieldMap;
    global Boolean useAppealOnPledgeOrGiftAlways;
    global Boolean useAppealOnPledgeOrGiftIfAppealNotSpecified;
    global Boolean useConstituentOnPledgeOrGiftAlways;
    global Boolean useConstituentOnPledgeOrGiftIfDonorNotSpecified;
    global Boolean useDesignationOnPledgeOrGiftAlways;
    global Boolean useDesignationOnPledgeOrGiftIfDesignationNotSpecified;
    global Boolean useOrganizationOnPledgeOrGiftAlways;
    global Boolean useOrganizationOnPledgeOrGiftIfDonorNotSpecified;
    global Boolean usePledgeToDeterminePaymentAmountAlways;
    global Boolean usePledgeToDeterminePaymentAmountIfPaymentNotSpecified;
    global String whenNoPledgeGiftFound;
    global ReviewTransactionData() {

    }
    global void addComment(String comment) {

    }
    global void addDesignationExternalId(String externalId) {

    }
    global void addDesignationId(Id recordId) {

    }
    global void addManualReviewReason(String reason) {

    }
    global void clearAllManualReviewReason() {

    }
    global void clearManualReviewReason(String reason) {

    }
    global String getComments() {
        return null;
    }
    global String getManualReviewReason() {
        return null;
    }
    global String getPrefix(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans) {
        return null;
    }
    global void initCustomSetting(ucinn_ascendv2__Review_Transaction_v2__c reviewTrans, Map<String,ucinn_ascendv2__Review_Transaction_Prefix__mdt> recordTypePrefixToReviewTransPrefixesMap) {

    }
    global void initializeComments(String comments) {

    }
    global void updateTotalInstallmentAmount(Decimal amt) {

    }
    global void updateTotalNonGiftAmount(Decimal amt) {

    }
    global void updateTotalPaymentAmount(Decimal amt) {

    }
}
global class ReviewTransactionFilterWrapper {
    global Integer nonSpecialConditionBatchSize;
    global List<ucinn_ascendv2__Review_Transaction_v2__c> nonSpecialConditionReviewTransactions;
    global String prefix;
    global Integer specialConditionBatchSize;
    global List<ucinn_ascendv2__Review_Transaction_v2__c> specialConditionReviewTransactions;
    global ReviewTransactionFilterWrapper() {

    }
}
}
