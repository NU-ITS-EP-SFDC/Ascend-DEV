@isTest
public class ADVQReportControllerTest {
    private static final String INDIVIDUAL_ACCT_ID = 'Constituent Details';    
    private static final String NU_INDIVIDUAL_RECTYPE = 'Constituent Details';
    private static final String INDIVIDUAL_PROPOSAL_RECTYPE =  NEURecordTypeUtil.retrieveRecordTypeId('Opportunity',ADVOpportunityConstants.RT_OPP_PROPOSAL);
    private static final String INDIVIDUAL_POTENTIAL_GIFT_RECTYPE =  NEURecordTypeUtil.retrieveRecordTypeId('Opportunity',ADVOpportunityConstants.RT_OPP_GIFT);
    private static final String INDIVIDUAL_MG_RECTYPE =  NEURecordTypeUtil.retrieveRecordTypeId('Opportunity',ADVOpportunityConstants.RT_OPP_MATCHING_GIFT);

    private static Profile p1 = [select id,name from Profile where name= 'Advancement User' limit 1];
    //public static integer year = System.Today().year();
    public static Date testDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddDays(20);
    public static Date q2testDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddDays(120);
    public static Date q3testDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddDays(260);
    public static Date q4testDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddDays(320);
    public static Date quarterEndDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddDays(340);
    
     static testMethod void summaryTestController() 
    { 
        List<ucinn_ascendv2__Work_Plan__c> selectedGiftOfficers  = [SELECT  ucinn_ascendv2__Development_Officer__c FROM ucinn_ascendv2__Work_Plan__c Limit 1];
        System.assertNotEquals(null, selectedGiftOfficers);
        ucinn_ascendv2__Work_Plan__c selectedGiftOfficer = selectedGiftOfficers [0];  
        selectedGiftOfficer.NU_ADV_Exp_No_of_Phone_Meetings__c =null;
        System.assertNotEquals(null, selectedGiftOfficer);
        ADVQReportController controller= new ADVQReportController(); 
        System.assertNotEquals(null, controller);
        List<SelectOption> giftOfficers = controller.getGiftOfficers();
        System.assertNotEquals(null, giftOfficers);
        System.assertEquals(3, giftOfficers.size());
        List<SelectOption> listOfQuarters = controller.getListOfQuarters();
        System.assertNotEquals(null, listOfQuarters);
        System.assertEquals(4, listOfQuarters.size());
        List<SelectOption> listOfFY = controller.getListOfFY();
        System.assertNotEquals(null, listOfFY);
        System.assertEquals(2, listOfFY.size());
        String chooserender = controller.getChooserender();
        controller.showPdf = true;
        chooserender = controller.getChooserender();
        System.assertEquals('advanced_pdf', chooserender);        
        controller.selectedGiftOfficer = selectedGiftOfficer.ucinn_ascendv2__Development_Officer__c;   
        System.assertNotEquals(null, controller.selectedGiftOfficer);
        controller.selectedFY =   String.valueof(NEUOrganizationHelper.getCurrentFiscalYear());

        Test.StartTest();
        controller.QuarterStartDate = testDate;
        controller.QuarterEndDate = testDate.addDays(40);
        controller.CurrentFiscalYearEndDate = quarterEndDate;
        controller.selectedQuarter = 'Q2';
        controller.getQReportModel();
         System.assertNotEquals(null, controller.model);   
        controller.runSummaryReport();

        System.assertNotEquals(null, controller.model.ProspectList); 
        System.assertEquals(1,  controller.model.ProspectList.size() + controller.model.SecondaryProspectList.size());
        System.assertEquals(70000,  controller.model.dollarsRaised);
        System.assertEquals(1530000,  controller.model.dollarsToBeRaised);
        System.assertEquals(0,  controller.model.assignedProspectCount);
        System.assertEquals(1,  controller.model.assignedSecondaryProspectCount);
        System.assertEquals(3,  controller.model.giftsClosedCount);
        System.assertEquals(17,  controller.model.giftsToBeClosedCount);
        System.assertEquals(2,  controller.model.individualOppManagerOpenWaitingForClearanceOpps.size());
        System.assertEquals(1,  controller.model.individualOppManagerOpenClearanceGrantedOpps.size());
        System.assertEquals(1,  controller.model.individualOppManagerOpenClearanceDeniedOpps.size());  
        System.assertEquals(1,  controller.model.individualOppManagerOpenPendingOpps.size());
        System.assertEquals(50000,  controller.model.individualOppManagerOpenOppCost);
                
        controller.runSummaryPDFReport();  
        Test.StopTest();
        controller.getSelectedQuarter(date.newInstance(ADVQReportConstants.Year, 01, 10));
        controller.getSelectedQuarter(date.newInstance(ADVQReportConstants.Year, 04, 10));
        controller.getSelectedQuarter(date.newInstance(ADVQReportConstants.Year, 07, 10));
        controller.getSelectedQuarter(date.newInstance(ADVQReportConstants.Year, 10, 10));
        
        controller.changeTerm(); 
        controller.changeFY();
    }
      static testMethod void detailsTestController() 
    { 
        List<ucinn_ascendv2__Work_Plan__c> selectedGiftOfficers  = [SELECT ucinn_ascendv2__Development_Officer__c FROM ucinn_ascendv2__Work_Plan__c Limit 1]; 
        System.assertNotEquals(null, selectedGiftOfficers);
        ucinn_ascendv2__Work_Plan__c selectedGiftOfficer = selectedGiftOfficers [0];
        System.assertNotEquals(null, selectedGiftOfficer);
        ADVQReportController controller= new ADVQReportController(); 
        System.assertNotEquals(null, controller);
        List<SelectOption> giftOfficers = controller.getGiftOfficers();
        System.assertNotEquals(null, giftOfficers);
        System.assertEquals(3, giftOfficers.size());
        List<SelectOption> listOfQuarters = controller.getListOfQuarters();
        System.assertNotEquals(null, listOfQuarters);
        System.assertEquals(4, listOfQuarters.size());
        List<SelectOption> listOfFY = controller.getListOfFY();
        System.assertNotEquals(null, listOfFY);
        System.assertEquals(2, listOfFY.size());
        String chooserender = controller.getChooserender();
        controller.showPdf = true;
        chooserender = controller.getChooserender();
        System.assertEquals('advanced_pdf', chooserender);        
        controller.selectedGiftOfficer = selectedGiftOfficer.ucinn_ascendv2__Development_Officer__c;   
        System.assertNotEquals(null, controller.selectedGiftOfficer); 
        controller.selectedFY =   String.valueof(NEUOrganizationHelper.getCurrentFiscalYear());
        Test.StartTest();
		controller.QuarterStartDate = testDate;
        controller.QuarterEndDate = testDate.addDays(40);
        controller.CurrentFiscalYearEndDate = quarterEndDate;
        controller.selectedQuarter = 'Q1';
        controller.getQReportModel();
        System.assertNotEquals(null, controller.model);  
       

        System.assertNotEquals(null, controller.model.ProspectList); 
        System.assertEquals(1,  controller.model.ProspectList.size() + controller.model.SecondaryProspectList.size());
        System.assertEquals(70000,  controller.model.dollarsRaised);
        System.assertEquals(1530000,  controller.model.dollarsToBeRaised);
        System.assertEquals(0,  controller.model.assignedProspectCount);
        System.assertEquals(1,  controller.model.assignedSecondaryProspectCount);
        System.assertEquals(3,  controller.model.giftsClosedCount);
        System.assertEquals(17,  controller.model.giftsToBeClosedCount);

        System.assertEquals(1,  controller.model.individualOppManagerOpenClearanceGrantedOpps.size());
        System.assertEquals(1,  controller.model.individualOppManagerOpenClearanceDeniedOpps.size());
        System.assertEquals(1,  controller.model.individualOppManagerOpenPendingOpps.size());
        System.assertEquals(50000,  controller.model.individualOppManagerOpenOppCost);
        controller.runDetailsReport();            
        controller.runDetailsPDFReport();  
        Test.StopTest();
        
    }
    
    @testSetup
    private static void setupData() 
    {         
    Profile p1 = [select id,name from Profile where name= 'Advancement User' limit 1];
 //Users  
        User u1 = new User(FirstName = 'Carla', LastName = 'Kindt',
                           Alias='u1', Email='u1@neu.edu',
                           Username='u1@neu.edu', ProfileId=p1.Id, TimeZoneSidKey='GMT',
                           LocaleSidKey='en_US', EmailEncodingKey='ISO-8859-1',
                           LanguageLocaleKey='en_US');         
        User u2 = new User(FirstName = 'Owen', LastName = 'Devine', 
                           Alias='u2', Email='u2@neu.edu',
                           Username='u2@neu.edu', ProfileId=p1.Id, TimeZoneSidKey='GMT',
                           LocaleSidKey='en_US', EmailEncodingKey='ISO-8859-1',
                           LanguageLocaleKey='en_US'); 
        
        User u3 = new User(FirstName = 'Luanne', LastName = 'Kirwin', 
                           Alias='u3', Email='u3@neu.edu',
                           Username='u3@neu.edu', ProfileId=p1.Id, TimeZoneSidKey='GMT',
                           LocaleSidKey='en_US', EmailEncodingKey='ISO-8859-1',
                           LanguageLocaleKey='en_US');         
        User u4 = new User(FirstName = 'Paul', LastName = 'Zernicke', 
                           Alias='u4', Email='u4@neu.edu',
                           Username='u4@neu.edu', ProfileId=p1.Id, TimeZoneSidKey='GMT',
                           LocaleSidKey='en_US', EmailEncodingKey='ISO-8859-1',
                           LanguageLocaleKey='en_US'); 
        User u5 = new User(FirstName = 'Pamela', LastName = 'McCarthy', 
                           Alias='u5', Email='u5@neu.edu',
                           Username='u5@neu.edu', ProfileId=p1.Id, TimeZoneSidKey='GMT',
                           LocaleSidKey='en_US', EmailEncodingKey='ISO-8859-1',
                           LanguageLocaleKey='en_US');
        insert new list<User>{u1, u2, u3, u4, u5};
        System.assertNotEquals(null, u1.ID);            
        System.assertNotEquals(null, u2.ID); 
        System.assertNotEquals(null, u3.ID);        
        System.assertNotEquals(null, u4.ID);
        System.assertNotEquals(null, u5.ID);       
        
        ucinn_ascendv2__Work_Plan_Unit__c unit1 = new ucinn_ascendv2__Work_Plan_Unit__c(Name='Athletics');
        ucinn_ascendv2__Work_Plan_Unit__c unit2 = new ucinn_ascendv2__Work_Plan_Unit__c(Name='Library');
 		insert new list<ucinn_ascendv2__Work_Plan_Unit__c>{unit1, unit2};
        System.assertNotEquals(null, unit1.ID);            
        System.assertNotEquals(null, unit2.ID); 
        
        ucinn_ascendv2__Work_Plan_Unit_Officer_Assignment__c  officer1 = new ucinn_ascendv2__Work_Plan_Unit_Officer_Assignment__c (Name='test1',ucinn_ascendv2__Work_Plan_Unit__c =unit1.Id);
        ucinn_ascendv2__Work_Plan_Unit_Officer_Assignment__c  officer2 = new ucinn_ascendv2__Work_Plan_Unit_Officer_Assignment__c (Name='test2',ucinn_ascendv2__Work_Plan_Unit__c=unit2.Id);
        insert new list<ucinn_ascendv2__Work_Plan_Unit_Officer_Assignment__c>{officer1, officer2};
        System.assertNotEquals(null, officer1.ID);
        System.assertNotEquals(null, officer2.ID); 

        //Gift Officers
         ucinn_ascendv2__Work_Plan__c employee1  =  new ucinn_ascendv2__Work_Plan__c (ucinn_ascendv2__Development_Officer__c = u1.Id,NU_ADV_Title__c ='Director of Development, Special Programs',
                                                                           //College__c ='CAMD, CPS, Libraries',
                                                                           ucinn_ascendv2__Work_Plan_Unit__c = unit1.Id,
                                                                           NU_ADV_Supervisor__c = u3.Id,NU_ADV_Hire_Date__c =Date.newInstance(2006, 11, 01),
                                                                           NU_ADV_Annual_Fundraising_Goal__c = 1600000,
                                                                           NU_ADV_Exp_No_of_Closed_Opps__c=20,
                                                                           NU_ADV_Exp_No_Disc_Visits__c=0,
                                                                           NU_ADV_Exp_No_of_Personal_Visits__c=80,
                                                                           NU_ADV_Exp_No_of_Legacy_Disc__c=8,
                                                                           NU_ADV_Exp_No_of_Phone_Meetings__c=null,
                                                                                      ucinn_ascendv2__Fiscal_Year__c ='FY26',
                                                                           NU_ADV_Exp_No_of_Solicitations__c=15,NU_ADV_Work_Plan_Unit_Officer_Assignment__c=officer1.Id,
                                                                                     ucinn_ascendv2__Effective_Date__c =Date.newInstance(2023, 07, 01)); 
         ucinn_ascendv2__Work_Plan__c employee2  =  new ucinn_ascendv2__Work_Plan__c (ucinn_ascendv2__Development_Officer__c = u2.Id,NU_ADV_Title__c ='Director of Development Athletics',
                                                                           //College__c ='CAMD, CPS, Libraries',
                                                                           ucinn_ascendv2__Work_Plan_Unit__c = unit2.Id,
                                                                           NU_ADV_Supervisor__c = u4.Id,NU_ADV_Hire_Date__c =Date.newInstance(2019, 08, 21),
                                                                           NU_ADV_Exp_No_of_Phone_Meetings__c=null,  ucinn_ascendv2__Fiscal_Year__c ='FY26',

                                                                                     ucinn_ascendv2__Effective_Date__c =Date.newInstance(2023, 07, 01)
                                                                                     ,NU_ADV_Work_Plan_Unit_Officer_Assignment__c=officer2.Id); 
         insert new list<ucinn_ascendv2__Work_Plan__c>{employee1,employee2};
        System.assertNotEquals(null, employee1.ID); 
        System.assertNotEquals(null, employee2.ID);   
        
        //CONTACTS
       // Contact c1 = new Contact(FirstName ='fn1',LastName ='ln1',ucinn_ascendv2__PRM__c =u1.Id);
        Contact c1 = new Contact();
		c1.FirstName = 'Test Q Report fn';
		c1.LastName = 'Test Q Report ln';
		c1.ucinn_ascendv2__PRM__c = u1.Id;
		//Insert c1;
        Contact c2 = new Contact(FirstName ='fn2',LastName ='ln2',ucinn_ascendv2__PRM__c =u1.Id);
        Contact c3 = new Contact(FirstName ='fn3',LastName ='ln3',ucinn_ascendv2__PRM__c =u2.Id);
        Contact c4 = new Contact(FirstName ='fn4',LastName ='ln4',ucinn_ascendv2__PRM__c =u3.Id);

        insert new list<Contact>{c1,c2,c3, c4};
        //System.assertNotEquals(null, c.Id); 
        System.assertNotEquals(null, c1.Id); 
        System.assertNotEquals(null, c2.Id);  
        System.assertNotEquals(null, c3.Id);
        System.assertNotEquals(null, c4.Id);

        Account a1 = new Account(Name ='fn2',ucinn_ascendv2__PRM__c =u1.Id,ucinn_ascendv2__Primary_Contact__c=c1.Id );
                insert new list<Account>{a1};

        System.assertNotEquals(null, a1.Id); 
        //Opportunities
        Date closeDate = ADVQReportConstants.CurrentFiscalYearEndDate;

        Opportunity oppOM1 = new Opportunity(Name = 'oppOM1', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE,
                                             CloseDate = testDate.addDays(-10),
                                             ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM2 = new Opportunity(Name = 'oppOM2', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED,
                                             ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM3 = new Opportunity(Name = 'oppOM3', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_DENIED,
                                             ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM4 = new Opportunity(Name = 'oppOM4', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_PENDING,
                                             ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM5 = new Opportunity(Name = 'oppOM5', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_WITHDRAWN,
                                             ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000);
        Opportunity oppOM6 = new Opportunity(Name = 'oppOM6', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_DECLINED,
                                              ucinn_ascendv2__Expected_Close_Date__c =  testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM7 = new Opportunity(Name = 'oppOM7', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                              ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                             ucinn_ascendv2__Funded_Date__c =  testDate.addDays(-10),
                                             CloseDate = testDate.addDays(-10),Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
         Opportunity oppOM8 = new Opportunity(Name = 'oppOM8', ucinn_ascendv2__Contact__c = c4.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                             ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE,
                                             ucinn_ascendv2__Expected_Close_Date__c = closeDate,
                                              CloseDate = closeDate,Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppOM9 = new Opportunity(Name = 'oppOM9', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                              ucinn_ascendv2__Credit_Date__c =  q2testDate,ucinn_ascendv2__Funded_Date__c = q2testDate,
                                             CloseDate =  q2testDate, Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
          Opportunity oppOM10 = new Opportunity(Name = 'oppOM10', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_PROPOSAL_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                              ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),ucinn_ascendv2__Funded_Date__c = testDate.addDays(10),
                                                 CloseDate =  testDate.addDays(-10),Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
          Opportunity oppOM11 = new Opportunity(Name = 'oppOM11', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u1.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                              ucinn_ascendv2__Credit_Date__c =  q4testDate,ucinn_ascendv2__Funded_Date__c = q4testDate,
                                                 CloseDate =  q4testDate, Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
         //Shared
        Opportunity oppSHARED1 = new Opportunity(Name = 'oppSHARED1', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE ,
                                                 ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),NU_ADV_Expected_Amount__c=10000,
                                                  CloseDate =   testDate.addDays(-10), Amount = 10000);
        Opportunity oppSHARED2 = new Opportunity(Name = 'oppSHARED2', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED ,
                                                  ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                                 CloseDate =   testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSHARED3 = new Opportunity(Name = 'oppSHARED3', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_DENIED ,
                                                  ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                                 CloseDate =   testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSHARED4 = new Opportunity(Name = 'oppSHARED4', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_PENDING ,
                                                  ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                                 CloseDate =   testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
    
        Opportunity oppSHARED9 = new Opportunity(Name = 'oppSHARED9', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_WITHDRAWN,
                                                 ucinn_ascendv2__Expected_Close_Date__c =  testDate.addDays(-10),
                                                 CloseDate =   testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSHARED10 = new Opportunity(Name = 'oppSHARED10', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                  ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_DECLINED,
                                                  ucinn_ascendv2__Expected_Close_Date__c =  testDate.addDays(-10),
                                                  CloseDate =   testDate.addDays(-10),Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSHARED11 = new Opportunity(Name = 'oppSHARED11', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                  ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                  ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                                  CloseDate =   testDate.addDays(-10),Amount = 10000); 
            Opportunity oppSHARED12 = new Opportunity(Name = 'oppSHARED12', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u5.ID, StageName = ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE ,
                                                 ucinn_ascendv2__Expected_Close_Date__c = closeDate,
                                                      CloseDate =   closeDate,Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSHARED13 = new Opportunity(Name = 'oppSHARED13', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_PROPOSAL_RECTYPE,
                                                 ucinn_ascendv2__Responsible_Person__c = u5.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                 ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),ucinn_ascendv2__Funded_Date__c =testDate.addDays(10),
                                                  CloseDate =   testDate.addDays(-10),Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
          Opportunity oppSHARED14 = new Opportunity(Name = 'oppSHARED14', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_PROPOSAL_RECTYPE,
                                                  ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                  ucinn_ascendv2__Credit_Date__c =  q2testDate,ucinn_ascendv2__Funded_Date__c=testDate.addDays(10),
                                                    CloseDate =  q2testDate,Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);  
          Opportunity oppSHARED15 = new Opportunity(Name = 'oppSHARED15', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                  ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                  ucinn_ascendv2__Credit_Date__c =  q3testDate, ucinn_ascendv2__Funded_Date__c =  q3testDate,
                                                     CloseDate =  q3testDate,Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);  
          Opportunity oppSHARED16 = new Opportunity(Name = 'oppSHARED16', ucinn_ascendv2__Contact__c = c1.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                  ucinn_ascendv2__Responsible_Person__c = u2.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                  ucinn_ascendv2__Credit_Date__c =  q4testDate, ucinn_ascendv2__Funded_Date__c =  q4testDate,
                                                     CloseDate =  q4testDate,Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);
        
        Opportunity oppSOL1 = new Opportunity(Name = 'oppSOL1',  AccountId=a1.Id,RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE,
                                              ucinn_ascendv2__Expected_Close_Date__c = testDate.addDays(-10),
                                               CloseDate =   testDate.addDays(-10),Amount = 600,NU_ADV_Expected_Amount__c=600);
        Opportunity oppSOL2 = new Opportunity(Name = 'oppSOL2', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED ,
                                              ucinn_ascendv2__Expected_Close_Date__c = q2testDate,NU_ADV_Expected_Amount__c=700,
                                              CloseDate =  q2testDate,Amount = 700);
        Opportunity oppSOL3 = new Opportunity(Name = 'oppSOL3', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_CLEARANCE_DENIED ,
                                              ucinn_ascendv2__Expected_Close_Date__c = q3testDate, 
                                              CloseDate =  q3testDate,Amount = 10000,NU_ADV_Expected_Amount__c=10000);
        Opportunity oppSOL4 = new Opportunity(Name = 'oppSOL4', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_PENDING ,
                                              ucinn_ascendv2__Expected_Close_Date__c = q4testDate,NU_ADV_Expected_Amount__c=10000,
                                              CloseDate =  q4testDate,Amount = 10000);
       
        Opportunity oppSOL9 = new Opportunity(Name = 'oppSOL9', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                              ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_WITHDRAWN,
                                              ucinn_ascendv2__Expected_Close_Date__c =  testDate.addDays(-10),NU_ADV_Expected_Amount__c=10000,
                                              CloseDate =   testDate.addDays(-10),Amount = 10000);
        Opportunity oppSOL10 = new Opportunity(Name = 'oppSOL10', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                               ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_DECLINED,
                                               ucinn_ascendv2__Expected_Close_Date__c =  testDate.addDays(-10),NU_ADV_Expected_Amount__c=10000,
                                               CloseDate =   testDate.addDays(-10),Amount = 10000);
        Opportunity oppSOL11 = new Opportunity(Name = 'oppSOL11', AccountId=a1.Id, RecordTypeID = INDIVIDUAL_PROPOSAL_RECTYPE,
                                               ucinn_ascendv2__Responsible_Person__c = u3.ID, StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                               ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10), ucinn_ascendv2__Funded_Date__c =  testDate.addDays(10),
                                               CloseDate =   testDate.addDays(-10),Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000);          
        
        Opportunity oppUNSOL1 = new Opportunity(Name = 'oppUNSOL1', ucinn_ascendv2__Contact__c = c2.ID, RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                StageName = ADVOpportunityConstants.STAGE_FUNDED,
                                                ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                                CloseDate =   testDate.addDays(-10),Amount = 10000); 
         Opportunity oppThird1 = new Opportunity(Name = 'oppThird1',  RecordTypeID = INDIVIDUAL_POTENTIAL_GIFT_RECTYPE,
                                                StageName = ADVOpportunityConstants.STAGE_FUNDED,
                                                ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                                CloseDate =   testDate.addDays(-10),Amount = 10000); 
         Opportunity oppThird2 = new Opportunity(Name = 'oppThird2', RecordTypeID = INDIVIDUAL_MG_RECTYPE,
                                                StageName = ADVOpportunityConstants.STAGE_FUNDED,
                                                ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),
                                                CloseDate =   testDate.addDays(-10),Amount = 10000); 
        Opportunity oppUNSOL2 = new Opportunity(Name = 'oppUNSOL1', ucinn_ascendv2__Contact__c = c2.ID, RecordTypeID = INDIVIDUAL_PROPOSAL_RECTYPE,
                                                StageName = ADVOpportunityConstants.STAGE_BOOKED,
                                                ucinn_ascendv2__Credit_Date__c =  testDate.addDays(-10),ucinn_ascendv2__Funded_Date__c= testDate.addDays(10),
                                                CloseDate =  testDate.addDays(10),Amount = 10000,ucinn_ascendv2__Funded_Amount__c=10000); 
        insert new list<Opportunity>{oppOM1,oppOM2,oppOM3,oppOM4,oppOM5,oppOM6,oppOM7,oppOM8,oppOM9,oppOM10,oppOM11,
             oppSHARED1,oppSHARED2,oppSHARED3,oppSHARED4,oppSHARED9,oppSHARED10,oppSHARED11, oppSHARED12,oppSHARED13,oppSHARED14,oppSHARED15,oppSHARED16,
              oppSOL1,oppSOL2,oppSOL3,oppSOL4,oppSOL9,oppSOL10,oppSOL11,
            oppUNSOL1,oppUNSOL2,oppThird1,oppThird2};
                         
        ucinn_ascendv2__Designation__c d1 = new ucinn_ascendv2__Designation__c(Name ='Desg 1'); 
        insert new list<ucinn_ascendv2__Designation__c> {d1};
        ucinn_ascendv2__Designation_Detail__c dd1 = new ucinn_ascendv2__Designation_Detail__c(ucinn_ascendv2__Designation__c = d1.Id,ucinn_ascendv2__Opportunity__c = oppUNSOL1.Id);
        insert new list<ucinn_ascendv2__Designation_Detail__c> {dd1};

        ucinn_ascendv2__Hard_and_Soft_Credit__c hc1 = new ucinn_ascendv2__Hard_and_Soft_Credit__c(ucinn_ascendv2__Opportunity__c = oppThird1.Id,ucinn_ascendv2__Contact__c=c1.Id,
                                                                                                  ucinn_ascendv2__Credit_Amount__c=10000,
                                                                                                  ucinn_ascendv2__Credit_Type__c ='Soft',ucinn_ascendv2__Designation_Detail__c=dd1.Id);
         ucinn_ascendv2__Hard_and_Soft_Credit__c hc2 = new ucinn_ascendv2__Hard_and_Soft_Credit__c(ucinn_ascendv2__Opportunity__c = oppThird1.Id,ucinn_ascendv2__Contact__c=c1.Id,
                                                                                          ucinn_ascendv2__Credit_Amount__c=10000,
                                                                                                  ucinn_ascendv2__Credit_Type__c ='Soft',ucinn_ascendv2__Designation_Detail__c=dd1.Id);
        
        ucinn_ascendv2__Hard_and_Soft_Credit__c hc3 = new ucinn_ascendv2__Hard_and_Soft_Credit__c(ucinn_ascendv2__Opportunity__c = oppThird2.Id,ucinn_ascendv2__Contact__c=c1.Id,
                                                                                                  ucinn_ascendv2__Credit_Amount__c=12000,ucinn_ascendv2__Source__c='Payment',
                                                                                                  ucinn_ascendv2__Credit_Type__c ='Soft',ucinn_ascendv2__Designation_Detail__c=dd1.Id);
         ucinn_ascendv2__Hard_and_Soft_Credit__c hc4 = new ucinn_ascendv2__Hard_and_Soft_Credit__c(ucinn_ascendv2__Opportunity__c = oppThird2.Id,ucinn_ascendv2__Contact__c=c1.Id,
                                                                                          ucinn_ascendv2__Credit_Amount__c=13000,ucinn_ascendv2__Source__c='Payment',
                                                                                                  ucinn_ascendv2__Credit_Type__c ='Soft',ucinn_ascendv2__Designation_Detail__c=dd1.Id);
        insert new list<ucinn_ascendv2__Hard_and_Soft_Credit__c>{hc1,hc2,hc3,hc4};
        System.assertNotEquals(null, oppOM1.id);
        System.assertNotEquals(null, oppOM2.id);
        System.assertNotEquals(null, oppOM3.id);
        System.assertNotEquals(null, oppOM4.id);
        System.assertNotEquals(null, oppOM5.id);
        System.assertNotEquals(null, oppOM6.id);
        System.assertNotEquals(null, oppOM7.id);
		System.assertNotEquals(null, oppOM8.id);
        System.assertNotEquals(null, oppOM9.id);
        System.assertNotEquals(null, oppOM10.id);
        System.assertNotEquals(null, oppOM10.ucinn_ascendv2__Funded_Date__c);

        System.assertNotEquals(null, oppOM11.id); 
        System.assertNotEquals(null, oppSHARED1.id);
        System.assertNotEquals(null, oppSHARED2.id);
        System.assertNotEquals(null, oppSHARED3.id);
        System.assertNotEquals(null, oppSHARED4.id);       
        System.assertNotEquals(null, oppSHARED9.id);
        System.assertNotEquals(null, oppSHARED10.id);
        System.assertNotEquals(null, oppSHARED11.id);
        System.assertNotEquals(null, oppSHARED12.id);
        System.assertNotEquals(null, oppSHARED13.id);
        System.assertNotEquals(null, oppSHARED14.id);
        System.assertNotEquals(null, oppSHARED15.id);
        System.assertNotEquals(null, oppSHARED16.id);
           System.assertNotEquals(null, oppSOL1.id);
        System.assertNotEquals(null, oppSOL2.id);
        System.assertNotEquals(null, oppSOL3.id);
        System.assertNotEquals(null, oppSOL4.id);
       
        System.assertNotEquals(null, oppSOL9.id);
        System.assertNotEquals(null, oppSOL10.id);
        System.assertNotEquals(null, oppSOL11.id);
        
        System.assertNotEquals(null, oppUNSOL1.id);
        System.assertNotEquals(null, oppUNSOL2.id);

         System.assertNotEquals(null, hc1.id);
        System.assertNotEquals(null, hc2.id);
        System.assertNotEquals(null, hc3.id);
        System.assertNotEquals(null, hc4.id);
        ucinn_ascendv2__Assignment__c assign1 = new ucinn_ascendv2__Assignment__c(ucinn_ascendv2__Assignment_Type__c ='Secondary Relationship Manager',
                                  ucinn_ascendv2__Assigned_Relationship_Manager_User__c = u1.Id,ucinn_ascendv2__Contact__c =c1.Id);
         ucinn_ascendv2__Assignment__c assign2 = new ucinn_ascendv2__Assignment__c(ucinn_ascendv2__Assignment_Type__c ='Secondary Relationship Manager',
                                  ucinn_ascendv2__Assigned_Relationship_Manager_User__c = u1.Id,ucinn_ascendv2__Contact__c =c4.Id);
        insert new list<ucinn_ascendv2__Assignment__c>{assign1,assign2};
        System.assertNotEquals(null, assign1.id);
        System.assertNotEquals(null, assign2.id);
        OpportunityTeamMember ot1 = NEW OpportunityTeamMember(OpportunityId = oppSHARED1.Id,UserId= u1.Id);
        OpportunityTeamMember ot2 = NEW OpportunityTeamMember(OpportunityId= oppSHARED2.Id,UserId= u1.Id);
        OpportunityTeamMember ot3 = NEW OpportunityTeamMember(OpportunityId = oppSHARED3.Id,UserId= u1.Id);
        OpportunityTeamMember ot4 = NEW OpportunityTeamMember(OpportunityId = oppSHARED4.Id,UserId= u1.Id);
        OpportunityTeamMember ot9 = NEW OpportunityTeamMember(OpportunityId = oppSHARED9.Id,UserId= u1.Id);
        OpportunityTeamMember ot10 = NEW OpportunityTeamMember(OpportunityId = oppSHARED10.Id,UserId= u1.Id);
        OpportunityTeamMember ot11 = NEW OpportunityTeamMember(OpportunityId = oppSHARED11.Id,UserId= u1.Id);
        OpportunityTeamMember ot12 = NEW OpportunityTeamMember(OpportunityId = oppSHARED12.Id,UserId= u1.Id);
        OpportunityTeamMember ot13 = NEW OpportunityTeamMember(OpportunityId = oppSHARED13.Id,UserId= u1.Id);

         insert new list<OpportunityTeamMember>{ot1,ot2,ot3,ot4,ot9,ot10,ot11,ot12,ot13};
                System.assertNotEquals(null, ot1.ID);
        System.assertNotEquals(null, ot2.ID);
        System.assertNotEquals(null, ot3.ID);
        System.assertNotEquals(null, ot4.ID);
        
        System.assertNotEquals(null, ot9.ID);
        System.assertNotEquals(null, ot10.ID);
        System.assertNotEquals(null, ot11.ID);
        System.assertNotEquals(null, ot12.ID);
        System.assertNotEquals(null, ot13.ID);
    }
}