/*
-----------------------------------------------------------------------------------------------------------------------------

Author: Stefan  Cudjoe – Cloud for Good (stefan.cudjoe@cloud4good.com)

Description: Test Data Factory, contains reusable methods to construct test data to be used in Apex Test Classes

History
    <Date>          <Authors Name>      <User Story>        <Brief Description of Change>
    2024-06-05      Stefan Cudjoe         CFG-265          Initial Creation
    2024-06-05      Stefan Cudjoe         CFG-258          Added Welcome Tab parameters to createAffinityGroup
    2024-06-05      Stefan Cudjoe         CFG-260          Added Upcoming Events, Northeastern Team, Members, Resources, Documents, Discussions Tab parameters to createAffinityGroup
    2024-06-13      Stefan Cudjoe         CFG-175          Added createUpcomingEvent() method to create Upcoming Events
    2024-06-24      Stefan Cudjoe         CFG-344          Updated createUpcomingEvent() method added parameters RecordTypeId, evStatus, affGroupToExclude
    2024-06-26      Stefan Cudjoe         CFG-267          Added createAffinityGroupMembership() & createContact()
    2024-06-26      Stefan Cudjoe         CFG-198          Added createCollaborationGroup() and modified createAffinityGroup() to include field cfg_Collaboration_Group_ID__c
    2024-07-10      Radhika Sharma        CFG-384          Added getSysAdminProfileId(), getSysAdminRoleId(), generateAdminUser(), generateExpSiteUser(), createCollaborationGroupMemberRecord()
    2024-07-15      Stefan Cudjoe         CFG-398          Added createTriggerHandlerTDTM(). Updated createCollaborationGroup(), createAffinityGroupMembership()
    2024-07-22      Stefan Cudjoe         CFG-289          Added createGroupResource()
    2024-08-09      Radhika Sharma        CFG-417          Added createSCCCustomerRegRequest(), generateRandomString(), createContact(), and createContacts()
    2024-09-03      Radhika Sharma        CFG-514          Udpate to createAffinityGroup method to set collaboration group name field
----------------------------------------------------------------------------------------------------------------------------
*/
@IsTest
public with sharing class cfg_TestDataFactory {

    // *************************************** //
    // ** CLASS CONSTANTS - USER VALUES     ** //
    // *************************************** //

    public static final String USER_TIMEZONE = 'America/New_York';
    public static final String EMAIL_ENCODING_KEY ='ISO-8859-1';
    public static final String LOCALE_SID_KEY ='en_US'; 
    public static final String LANGUAGE_LOCALE_KEY ='en_US';
    public static final String PORTAL_ROLE_MANAGER = 'Manager';
    public static final String COLLABORATION_GROUP_MEMBER_ROLE_STANDARD = 'Standard';
    public static final String TDTM_AFFINITY_GROUP_OBJECT = ucinn_portal_Zone__c.SObjectType.getDescribe().getName();
    public static final String TDTM_AFFINITY_GROUP_MEMBERSHIP_OBJECT = ucinn_portal_Zone_Membership__c.SObjectType.getDescribe().getName();
    public static final String TDTM_GROUP_RESOURCE_OBJECT = cfg_Group_Resource__c.SObjectType.getDescribe().getName();
    public static final String TDTM_BEFORE_INSERT_TRIGGER_ACTION = 'BeforeInsert';
    public static final String TDTM_AFTER_INSERT_TRIGGER_ACTION = 'AfterInsert';
    public static final String TDTM_AFTER_INSERT_AFTER_UPDATE_TRIGGER_ACTION = 'AfterInsert;AfterUpdate';
    public static final Integer TDTM_LOAD_ORDER_1 = 1;
    public static final Id HUSKY_NETWORK_ID = getExpCloudNetworkId(cfg_Constants.HUSKY_PORTAL_NETWORK_NAME);
    public static final String GROUP_RESOURCE_TYPE_NEWSLETTER = 'Newsletter';
    public static final String TDTM_CONTENT_DOCUMENT_LINK_OBJECT = ContentDocumentLink.SObjectType.getDescribe().getName();
    public static final String CONTENT_DOCUMENT_DOWNLOAD_URL_SUFFIX = 'sfc/dist/version/download';
    private static final String CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';


    /**
    * @description Creates an SCC Customer Registration request string from the provided parameters. Any parameters omitted will be left blank in the request.
    * @param firstname - String - first name for the user/contact for which the request is to be created
    * @param lastname - String - last name for the user/contact for which the request is to be created
    * @param email - String - email for the user/contact for which the request is to be created
    * @param customerNo - String - customer number from sfcc for the user/contact for which the request is to be created
    * @param customerId - String - customer Id from sfcc for the user/contact for which the request is to be created
    * @param externalId - String - user Id for the user/contact for which the request is to be created
    * @return Blob - The created blob with parameters set according to passed in parameters
    */
    public static Blob createSCCCustomerRegRequest(String firstname, String lastname, String email, String customerNo, String customerId, String externalId) {
        Blob requestString = Blob.valueOf('{"first_name":"' + firstname + '","last_name":"' + lastname + '","email":"' + email + '","customer_no":"'
            + customerNo + '","customer_id":"' + customerId + '", "external_id":"' + externalId + '"}');

        return requestString;

    }

    /** 
    * @description Generates the random character strings used by a lot of methods in this class for name and required text fields.
    * @param len - Integer - Determine length of Random String to create.
    * @return String - Randomized String.
    */
    public static String generateRandomString(Integer len) {

        String randStr = '';
        
        while (randStr.length() < len) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), CHARS.length());
            randStr += CHARS.substring(idx, idx+1);
        }

        return randStr;

    }

    /**
    * @description Creates one contact record with random string FN & LN. Includes all required fields and will pass back to calling method.
    * @param emailDomain - String - String representing email domain of new contact
    * @return Contact record generated.
    */
    public static Contact createContact(String emailDomain) {
        String firstNameString = generateRandomString(5);
        String emailString = firstNameString + emailDomain;
        Contact c = new Contact(
            FirstName= firstNameString,
            LastName=generateRandomString(5),
            Email = emailString,
            cfg_Affinity_Group_Email__c = emailString
        );

        return c;

    }

    /**
    * @description Creates multiple contact records with random string FN & LN. Includes all required fields and will pass back to calling method.
    * @param numContacts - Integer - Number of Contacts requested.
    * @param emailDomain - String - String representing email domain new contacts should have
    * @return List of Contact records.
    */
    public static List<Contact> createContacts(Integer numContacts, String emailDomain) {

        //declare variables
        List<Contact> contacts = new List<Contact>();

        for(Integer i=0;i<numContacts;i++) {
            contacts.add(createContact(emailDomain));
        }

        return contacts;

    }

    /**
    * @description Retrieve the system administrator user profile id
    * @Author: Radhika Sharma
    * @Date: 2024-07-10
    * @return Id - Profile Id
    **/
    public static Id getSysAdminProfileId() {
        return [SELECT Id FROM Profile WHERE Name = : cfg_Constants.SYS_ADMIN_PROFILE_NAME]?.Id;
    }

    /**
    * @description Retrieve the system administrator user role id
    * @Author: Radhika Sharma
    * @Date: 2024-07-10
    * @return Id - User Role Id
    **/
    public static Id getSysAdminRoleId() {
        return [SELECT Id FROM UserRole WHERE Name = : cfg_Constants.ADMIN_USER_ROLE_NAME]?.Id;
    }

    /**
    * @description Retrieve the Experience Cloud Network Id
    * @param networkName - String - Network Name
    * @Author: Stefan Cudjoe
    * @Date: 2024-07-15
    * @return Id - Network Id
    **/
    public static Id getExpCloudNetworkId(String networkName) {
        return [SELECT Id FROM Network WHERE Name =: networkName]?.Id;
    }

    /**
    * @description Retrieve the Partner Community Profile Id
    * @Author: Stefan Cudjoe
    * @Date: 2024-07-15
    * @return Id - Partner Community Profile Id
    **/
    public static Id getPartnerCommunityProfileId() {
        return [SELECT Id FROM Profile WHERE Name = : cfg_Constants.PARTNER_COMMUNITY_PROFILE_NAME]?.Id;
    }

    /**
   * @description Retrieve UserRole Id
   * @Author: Stefan Cudjoe
   * @Date: 2024-07-16
   * @return Id - UserRoleId
   **/
    public static Id getUserRoleId() {
        return [SELECT Id, DeveloperName FROM UserRole WHERE PortalType = 'None' LIMIT 1]?.Id;
    }

    /**
    * @description Method to create CollaborationGroupMember record for given user Id and group Id
    * @Author: Radhika Sharma
    * @Date: 2024-07-10
    * @param memberId - Id - User Id for which to create the CollaborationGroupMember record
    * @param groupId - Id - Group Id for which to create the CollaborationGroupMember record
    * @param notifyFrequency - String - Notification Frequency for the CollaborationGroupMember record
    * @return CollaborationGroupMember - Created CollaborationGroupMember record
    **/
    public static CollaborationGroupMember createCollaborationGroupMemberRecord(Id memberId, Id groupId, String notifyFrequency) {

        //create CollaborationGroupMember record
        CollaborationGroupMember collabGroupMember = new CollaborationGroupMember();
        collabGroupMember.CollaborationGroupId = groupId;
        collabGroupMember.MemberId = memberId;
        collabGroupMember.CollaborationRole = COLLABORATION_GROUP_MEMBER_ROLE_STANDARD;
        collabGroupMember.NotificationFrequency = notifyFrequency; 

        return collabGroupMember;
    }

    /**
    * @description Creates a generic admin user
    * @Author: Radhika Sharma
    * @Date: 2024-07-10
    * @param lastName - String - Last name for which to create user with 
    * @param emailSuffix - String - Email Suffix for which to create user with
    * @return User - The created admin user 
    */
    public static User generateAdminUser(String lastName, String emailSuffix) {

        //create an admin user
        User adminUser = new User(
                LastName = lastName,
                Email = lastName.deleteWhitespace() + emailSuffix,
                ProfileId = cfg_TestDataFactory.getSysAdminProfileId(),
                UserRoleId = cfg_TestDataFactory.getSysAdminRoleId(),
                Username = lastName.deleteWhitespace() + emailSuffix,
                Alias = (lastName.deleteWhitespace()).left(8),
                TimeZoneSidKey = USER_TIMEZONE,
                EmailEncodingKey = EMAIL_ENCODING_KEY,
                LocaleSidKey = LOCALE_SID_KEY,
                LanguageLocaleKey = LANGUAGE_LOCALE_KEY
        );

        return adminUser;
    }

    /**
    * @description Creates an Experience Site User associated to the contact passed in, please be sure to provide the first,
    * last name and cfg_Affinity_Group_Email__c in the contact passed in
    * @Author: Radhika Sharma
    * @Date: 2024-07-10
    * @param con - Contact - Contact for which to create an associated user
    * @param profileId - Id - Type of profile to create user with
    * @return User - Created user record
    **/
    public static User generateExpSiteUser(Contact con, Id profileId) {

        //create an Experience Site user
        User expSiteUser = new User(
                FirstName = con.FirstName,
                LastName = con.LastName,
                Email = con.cfg_Affinity_Group_Email__c,
                ProfileId = profileId,
                ContactId = con.Id,
                Username = con.cfg_Affinity_Group_Email__c,
                Alias = (con.FirstName).left(8),
                TimeZoneSidKey = USER_TIMEZONE,
                EmailEncodingKey = EMAIL_ENCODING_KEY,
                LocaleSidKey = LOCALE_SID_KEY,
                LanguageLocaleKey = LANGUAGE_LOCALE_KEY,
                PortalRole = PORTAL_ROLE_MANAGER
        );

        return expSiteUser;
    }

    /**
     * @description Creates and returns an Affinity Group Organization
     * @Author: Stefan Cudjoe
     * @Date: 2024-06-05
     * @param orgName - String - Account Name
     * @return Account - Account record
     */
    public static Account createAffinityGroupOrganization(String orgName){
        Account tempAcct = new Account();
        tempAcct.NU_ADV_Affinity_Group__c = true;
        tempAcct.Name = orgName;
        return tempAcct;
    }

    /**
     * @description Create and returns an Involvement Value record
     * @Author: Stefan Cudjoe
     * @Date: 2024-06-05
     * @param invName - String - Involvement Value Name
     * @param isAffGroup - Boolean - Affinity Group?
     * @param invDesc - String - Involvement Value Description
     * @return ucinn_ascendv2__Involvement_Value__c - Involvement Value record
     */
    public static ucinn_ascendv2__Involvement_Value__c createInvolvementValue (String invName, Boolean isAffGroup, String invDesc){
        ucinn_ascendv2__Involvement_Value__c tempInv = new ucinn_ascendv2__Involvement_Value__c();
        tempInv.NU_ADV_Affinity_Group__c = isAffGroup;
        tempInv.Name = invName;
        tempInv.ucinn_ascendv2__Involvement_Description__c = invDesc;
        return tempInv;
    }

    /**
     * @description Create and returns an Affinity Group
     * @Author: Stefan Cudjoe
     * @Date: 2024-06-05
     * @param affGroupName - String - Affinity Group Name
     * @param invValueId - Id - Involvement Group Id
     * @param relatedOrgId - Id - Related Organization Id
     * @param welcomeTabName - String - Welcome Tab Name
     * @param welcomeTabContent - String - Welcome Tab Content
     * @param isWelcomeTabHidden - Boolean - Is Welcome Tab hidden?
     * @param upcomingEventsTabName - String - Upcoming Events Tab Name
     * @param isUpcomingEventsTabHidden - Boolean - is Upcoming Events Tab Hidden?
     * @param northeasternTeamTabName - String - Northeastern Team Tab Name
     * @param isNortheasternTeamTabHidden - Boolean - is Northeastern Team Tab Hidden?
     * @param membersTabName - String - Members Tab Name
     * @param isMembersTabHidden - Boolean - is Members Tab Hidden?
     * @param resourcesTabName - String - Resources Tab Name
     * @param isResourcesTabHidden - Boolean - is Resources Tab Hidden?
     * @param documentsTabName - String - Documents Tab Name
     * @param isDocumentsTabHidden - Boolean - is Documents Tab Hidden?
     * @param discussionsTabName - String - Discussions Tab Name
     * @param isDiscussionsTabHidden - Boolean - is Discussions Tab Hidden?
     * @param collabGroupId - Id - Collaboration Group Id
     * @return ucinn_portal_Zone__c - Affinity Group record
     */
    public static ucinn_portal_Zone__c createAffinityGroup(String affGroupName, Id invValueId, Id relatedOrgId, String welcomeTabName, String welcomeTabContent, Boolean isWelcomeTabHidden,
            String upcomingEventsTabName, Boolean isUpcomingEventsTabHidden, String northeasternTeamTabName, Boolean isNortheasternTeamTabHidden, String membersTabName, Boolean isMembersTabHidden,
            String resourcesTabName, Boolean isResourcesTabHidden, String documentsTabName, Boolean isDocumentsTabHidden, String discussionsTabName, Boolean isDiscussionsTabHidden, Id collabGroupId){
        ucinn_portal_Zone__c tempAffGroup = new ucinn_portal_Zone__c();
        tempAffGroup.Name = affGroupName;
        tempAffGroup.cfg_Related_Involvement_Value__c = invValueId;
        tempAffGroup.cfg_Related_Organization__c = relatedOrgId;
        tempAffGroup.cfg_Welcome_Tab_Name__c = welcomeTabName;
        tempAffGroup.cfg_Welcome_Tab_Content__c = welcomeTabContent;
        tempAffGroup.cfg_Hide_Welcome_Tab__c = isWelcomeTabHidden;
        tempAffGroup.cfg_Upcoming_Events_Tab_Name__c = upcomingEventsTabName;
        tempAffGroup.cfg_Hide_Upcoming_Events_Tab__c = isUpcomingEventsTabHidden;
        tempAffGroup.cfg_Northeastern_Team_Tab_Name__c = northeasternTeamTabName;
        tempAffGroup.cfg_Hide_Northeastern_Team_Tab__c = isNortheasternTeamTabHidden;
        tempAffGroup.cfg_Members_Tab_Name__c = membersTabName;
        tempAffGroup.cfg_Hide_Members_Tab__c = isMembersTabHidden;
        tempAffGroup.cfg_Resources_Tab_Name__c = resourcesTabName;
        tempAffGroup.cfg_Hide_Resources_Tab__c = isResourcesTabHidden;
        tempAffGroup.cfg_Documents_Tab_Name__c = documentsTabName;
        tempAffGroup.cfg_Hide_Documents_Tab__c = isDocumentsTabHidden;
        tempAffGroup.cfg_Discussions_Tab_Name__c = discussionsTabName;
        tempAffGroup.cfg_Hide_Discussions_Tab__c = isDiscussionsTabHidden;
        tempAffGroup.cfg_Collaboration_Group_ID__c = collabGroupId;
        tempAffGroup.cfg_Collaboration_Group_Name__c = affGroupName;
        return tempAffGroup;
    }

    /**
    * @description Create and returns an Upcoming Event
    * @Author: Stefan Cudjoe
    * @Date: 2024-06-12
    * @param evRTID - String - Event Record Type
    * @param evName - String - Event Name
    * @param evStartDate - DateTime - Event Start Date
    * @param evEndDate - DateTime - Event End Date
    * @param evTimeZone - String - Event TimeZone
    * @param affGroup - String - String value name of Affinity Group
    * @param affGroupToExclude - String - String value name of Affinity Groups to exclude
    * @param evLocation - String - Event Location
    * @param evDescription - String - Event Location
    * @param evStatus - String - Event Status
    * @return ucinn_portal_Listing__c - Event record
    */
    public static ucinn_portal_Listing__c createUpcomingEvent (Id evRTID, String evName, Datetime evStartDate, Datetime evEndDate, String evTimeZone, String affGroup, String affGroupToExclude, String evLocation, String evDescription, String evStatus){
        ucinn_portal_Listing__c tempEvent = new ucinn_portal_Listing__c();
        tempEvent.RecordTypeId = evRTID;
        tempEvent.Name = evName;
        tempEvent.Event_Start_Date_Time__c = evStartDate;
        tempEvent.Event_End_Date_Time__c = evEndDate;
        tempEvent.cfg_Time_Zone__c = evTimeZone;
        tempEvent.Portal_Zone__c = affGroup;
        tempEvent.Portal_Zones_To_Exclude__c = affGroupToExclude;
        tempEvent.Location_Venue__c = evLocation;
        tempEvent.cfg_Event_Description__c = evDescription;
        tempEvent.Status__c = evStatus;
        return tempEvent;
    }

    /**
    * @description Create and returns an Affinity Group Membership
    * @Author: Stefan Cudjoe
    * @Date: 2024-06-25
    * @param afmConstituent - Contact - Affinity Group Membership Constituent
    * @param afmRole - String - Affinity Group Membership Role
    * @param afId - Id - Affinity Group Id
    * @param afStatus - String - Affinity Group Membership Status
    * @return ucinn_portal_Zone_Membership__c - Affinity Group Membership record
    */
    public static ucinn_portal_Zone_Membership__c createAffinityGroupMembership (Contact afmConstituent, String afmRole, Id afId, String afStatus){
        ucinn_portal_Zone_Membership__c tempAFMember = new ucinn_portal_Zone_Membership__c();
        tempAFMember.Constituent__c = afmConstituent.Id;
        tempAFMember.cfg_Role__c = afmRole;
        tempAFMember.Zone__c = afId;
        tempAFMember.Status__c = afStatus;
        return tempAFMember;
    }

    /**
    * @description Create and returns a Constituent with values to build an Affinity Group Membership record
    * @Author: Stefan Cudjoe
    * @Date: 2024-06-25
    * @param conFirstName - String - Constituent First Name
    * @param conLastName - String - Constituent Last Name
    * @param conTitle - String - Constituent Professional Title
    * @param conEmploymentPlace - String - Constituent Place of Employment
    * @param conBio - String - Constituent Bio
    * @param conPhone - String - Constituent Phone Number
    * @param conEmail - String - Constituent Email Address
    * @param conNameShare - Boolean - Share Constituent Name
    * @param conTitleShare - Boolean - Share Constituent Title
    * @param conEmploymentPlaceShare - Boolean - Share Constituent Place of Employment
    * @param conPhotoUrlShare - Boolean - Share Constituent Name
    * @param conBioShare - Boolean - Share Constituent Bio
    * @param conPhoneShare - Boolean - Share Constituent Phone Number
    * @param conEmailShare - Boolean - Share Constituent Email Address
    * @param groupRoleShare - Boolean - Share Constituent Role
    * @return Contact - Constituent record
    */
    public static Contact createAffinityTeamContact (String conFirstName, String conLastName, String conTitle, String conEmploymentPlace,
                                        String conBio, String conPhone, String conEmail,
                                        Boolean conNameShare, Boolean conTitleShare, Boolean conEmploymentPlaceShare,
                                        Boolean conPhotoUrlShare, Boolean conBioShare, Boolean conPhoneShare, Boolean conEmailShare,
                                        Boolean groupRoleShare){
        Contact tempContact = new Contact();
        tempContact.FirstName = conFirstName;
        tempContact.LastName = conLastName;
        tempContact.cfg_Professional_Title__c = conTitle;
        tempContact.cfg_Primary_Place_of_Employment__c = conEmploymentPlace;
        tempContact.cfg_About_Me_Section__c = conBio;
        tempContact.cfg_Affinity_Group_Phone__c = conPhone;
        tempContact.cfg_Affinity_Group_Email__c = conEmail;
        tempContact.cfg_Sharing_Name__c = conNameShare;
        tempContact.cfg_Sharing_Professional_Title__c = conTitleShare;
        tempContact.cfg_Sharing_Primary_Place_of_Employment__c = conEmploymentPlaceShare;
        tempContact.cfg_Sharing_Photo__c = conPhotoUrlShare;
        tempContact.cfg_Sharing_About_Me_Section__c = conBioShare;
        tempContact.cfg_Sharing_Phone__c = conPhoneShare;
        tempContact.cfg_Sharing_Email__c = conEmailShare;
        tempContact.cfg_Sharing_Affinity_Group_Role__c = groupRoleShare;
        return tempContact;
    }

    /**
    * @description Create and returns an Collaboration Group
    * @Author: Stefan Cudjoe
    * @Date: 2024-06-25
    * @param cgName - String - Collaboration Group Name
    * @param cgDesc - String - Collaboration Group Description
    * @param cgOwner - String - Collaboration Group Owner
    * @param cgAccess - String - Collaboration Group Access Type
    * @return CollaborationGroup - Affinity Group Membership record
    */
    public static CollaborationGroup createCollaborationGroup (String cgName, String cgDesc, String cgOwner, String cgAccess){
        CollaborationGroup tempCollabGroup = new CollaborationGroup();
        tempCollabGroup.Name = cgName;
        tempCollabGroup.Description = cgDesc;
        tempCollabGroup.OwnerId = cgOwner;
        tempCollabGroup.CollaborationType = cgAccess;
        tempCollabGroup.NetworkId = HUSKY_NETWORK_ID;
        return tempCollabGroup;
    }

    /**
    * @description Create trigger handler record
    * @Author: Stefan Cudjoe
    * @Date: 2024-07-15
    * @param className - String - Class name for the trigger handler
    * @param objectName - String - Object name for the trigger handler
    * @param triggerAction - String - Trigger actions for the trigger handler
    * @param loadOrder - Integer - Trigger handler load order
    * @return ucinn_ascendv2__Trigger_Handler__c - Trigger Handler
    */
    public static ucinn_ascendv2__Trigger_Handler__c createTriggerHandlerTDTM(String className, String objectName, String triggerAction, Integer loadOrder) {

        ucinn_ascendv2__Trigger_Handler__c triggerHandler = new ucinn_ascendv2__Trigger_Handler__c();
        triggerHandler.ucinn_ascendv2__Is_Active__c = true;
        triggerHandler.ucinn_ascendv2__Class__c = className;
        triggerHandler.ucinn_ascendv2__Object__c = objectName;
        triggerHandler.ucinn_ascendv2__Trigger_Action__c = triggerAction;
        triggerHandler.ucinn_ascendv2__Load_Order__c = loadOrder;
        return triggerHandler;
    }

    /**
   * @description Create Group Resource records
   * @Author: Stefan Cudjoe
   * @Date: 2024-07-22
   * @param resourceName - String - Group Resource Name
   * @param resourceHeader - String - Group Resource Header
   * @param resourceAffGroup - Id - Group Resource Affinity Group
   * @param resourceDescription - String - Group Resource Description
   * @param resourceType - String - Group Resource Type
   * @param resourceExUrl - String - Group Resource External URL
   * @return cfg_Group_Resource__c - Group Resource record
   */
    public static cfg_Group_Resource__c createGroupResource(String resourceName, String resourceHeader, Id resourceAffGroup, String resourceDescription, String resourceType, String resourceExUrl){

        cfg_Group_Resource__c tempGroupResource = new cfg_Group_Resource__c();
        tempGroupResource.Name = resourceName;
        tempGroupResource.cfg_Header__c = resourceHeader;
        tempGroupResource.cfg_Affinity_Group__c = resourceAffGroup;
        tempGroupResource.cfg_Description__c = resourceDescription;
        tempGroupResource.cfg_Resource_Type__c = resourceType;
        tempGroupResource.cfg_External_Link__c = resourceExUrl;
        return tempGroupResource;
    }

}