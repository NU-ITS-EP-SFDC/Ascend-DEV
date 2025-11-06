/*
-----------------------------------------------------------------------------------------------------------------------------

Author: Stefan  Cudjoe – Cloud for Good (stefan.cudjoe@cloud4good.com)

Description: Constants class: Holds re-usable values that are accessible through the code base to
             allow for ease of update and minimize code duplication.

History
    <Date>          <Authors Name>      <User Story>        <Brief Description of Change>
    2024-06-25      Stefan Cudjoe         CFG-344               Initial Creation
----------------------------------------------------------------------------------------------------------------------------
*/

public abstract class cfg_Constants {

    //User constants
    public static final String SYS_ADMIN_PROFILE_NAME = 'System Administrator';
    public static final String ADMIN_USER_ROLE_NAME = 'Portal Admin';
    public static final String PARTNER_COMMUNITY_PROFILE_NAME = 'Partner Community User';


    //Record Types
    public static final Id LISTING_EVENT_RT_ID = Schema.SObjectType.ucinn_portal_Listing__c.getRecordTypeInfosByDeveloperName().get('Event').getRecordTypeId();

    //Affinity Group Constants
    public static final String ALL_AFFINITY_GROUPS_STR = 'All';
    public static final String PUBLISHED_AFFINITY_GROUPS_STR = 'Published';

    //Affinity Group Membership Constants
    public static final String STAFF_AFFINITY_GROUP_MEMBERSHIP_ROLE = 'Staff';
    public static final String VOLUNTEER_AFFINITY_GROUP_MEMBERSHIP_ROLE = 'Volunteer';
    public static final String FACULTY_AFFINITY_GROUP_MEMBERSHIP_ROLE = 'Faculty';
    public static final String MEMBER_AFFINITY_GROUP_MEMBERSHIP_ROLE = 'Member';
    public static final String ACTIVE_AFFINITY_GROUP_MEMBERSHIP_STATUS = 'Active';
    public static final String INACTIVE_AFFINITY_GROUP_MEMBERSHIP_STATUS = 'Inactive';


    //Northeastern Team Info Constants
    public static final String TEAM_INFO_KEY_ID = 'Id';
    public static final String TEAM_INFO_KEY_NAME = 'Name';
    public static final String TEAM_INFO_KEY_TITLE = 'Title';
    public static final String TEAM_INFO_KEY_PRIMARY_EMPLOYMENT_PLACE = 'PrimaryPlaceOfEmployment';
    public static final String TEAM_INFO_KEY_PHOTO_URL = 'PhotoUrl';
    public static final String TEAM_INFO_KEY_ROLE = 'Role';
    public static final String TEAM_INFO_KEY_BIO = 'Bio';
    public static final String TEAM_INFO_KEY_PHONE = 'Phone';
    public static final String TEAM_INFO_KEY_EMAIL = 'Email';
    public static final String TEAM_INFO_LONG_BIO = 'ReadMore';

    //Discussion Group
    public static final String DISCUSSION_GROUP_ACCESS_TYPE_PRIVATE = 'Private';
    public static final String DISCUSSION_NOTIFICATION_FREQUENCY_WEEKLY = 'W';
    public static final String DISCUSSION_NOTIFICATION_FREQUENCY_NEVER = 'N';
    public static final String DISCUSSION_GROUP_TEXT = 'Discussion Group';
    public static final String COLLABORATION_GROUP_MEMBER_ROLE_STANDARD = 'Standard';
    public static final Map<String, String> COLLABORATION_GROUP_MEMBER_NOTIFICATION_FREQUENCIES = new Map<String, String>{
        'N' => System.Label.cfg_affinityGroupNotifications_Limited,
        'W' => System.Label.cfg_affinityGroupNotifications_WeeklyDigest,
        'P' => System.Label.cfg_affinityGroupNotifications_EveryPost,
        'D' => System.Label.cfg_affinityGroupNotifications_DailyDigest
    };

    //Affinity Group Roster Section
    public static final String ID_PARAM = 'id';

    //Affinity Portal
    public static final String HUSKY_PORTAL_NETWORK_NAME = 'Husky Portal';

    //Affinity Group Resources
    public static final String RESOURCES_UTILITY_LINK_ICON  = 'utility:link';
    public static final String RESOURCES_UTILITY_DOWNLOAD_ICON  = 'utility:download';
    public static final Integer RESOURCES_DESCRIPTION_OVERFLOW_COUNT = 200;
    public static final String RESOURCES_TYPE_SEPARATOR  = ' - ';



    //Content Document
    public static final String CDL_FILE_URL_SUFFIX  = '/sfc/servlet.shepherd/version/download/';
    public static final String CDL_FILE_EXTENSION_PPTX  = 'pptx';
    public static final String CDL_FILE_EXTENSION_PPT  = 'ppt';
    public static final String CDL_FILE_EXTENSION_FILETYPE_POWERPOINT  = 'PowerPoint';
    public static final String CDL_FILE_EXTENSION_PDF  = 'pdf';
    public static final String CDL_FILE_EXTENSION_FILETYPE_PDF  = 'PDF';
    public static final String CDL_FILE_EXTENSION_XLSX  = 'xlsx';
    public static final String CDL_FILE_EXTENSION_XLS  = 'xls';
    public static final String CDL_FILE_EXTENSION_FILETYPE_EXCEL  = 'Excel';
    public static final String CDL_FILE_EXTENSION_DOCX  = 'docx';
    public static final String CDL_FILE_EXTENSION_DOC  = 'doc';
    public static final String CDL_FILE_EXTENSION_FILETYPE_WORD_DOCUMENT  = 'Word Document';
    public static final String CDL_FILE_EXTENSION_ZIP  = 'zip';
    public static final String CDL_FILE_EXTENSION_FILETYPE_ZIP  = 'Zip/Compressed';
    public static final String CDL_SHARE_TYPE_V  = 'V';
    public static final String CDL_FILE_EXTENSION_SEPARATOR  = '.';

    public static final Map<String, String> CDL_FILE_EXTENSION_MAP = new Map<String, String>{
            CDL_FILE_EXTENSION_PPTX => CDL_FILE_EXTENSION_FILETYPE_POWERPOINT,
            CDL_FILE_EXTENSION_PPT => CDL_FILE_EXTENSION_FILETYPE_POWERPOINT,
            CDL_FILE_EXTENSION_PDF => CDL_FILE_EXTENSION_FILETYPE_PDF,
            CDL_FILE_EXTENSION_XLSX => CDL_FILE_EXTENSION_FILETYPE_EXCEL,
            CDL_FILE_EXTENSION_XLS => CDL_FILE_EXTENSION_FILETYPE_EXCEL,
            CDL_FILE_EXTENSION_DOCX => CDL_FILE_EXTENSION_FILETYPE_WORD_DOCUMENT,
            CDL_FILE_EXTENSION_DOC => CDL_FILE_EXTENSION_FILETYPE_WORD_DOCUMENT,
            CDL_FILE_EXTENSION_ZIP => CDL_FILE_EXTENSION_FILETYPE_ZIP
    };


    //Customer Record Sync Related 
    public static final String STATUS_CODE_INTERNAL_ERROR = '500';

    //Error Related
    public static final String RELATED_SYSTEM_COMMERCE_CLOUD = 'Salesforce Commerce Cloud';
    public static final String URL_LIGHTNING = '/lightning/r/';
	public static final String URL_SLASH = '/';
	public static final String URL_VIEW = 'view';






}