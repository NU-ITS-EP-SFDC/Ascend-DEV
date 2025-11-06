global class ADVQReportController
{
 public string selectedGiftOfficer { get; set;} 
 public string selectedFY { get; set;} 
 public string selectedQuarter { get; set;} 
 public date QuarterStartDate {get;set;} 
 public date QuarterEndDate {get;set;}
 public date CurrentFiscalYearEndDate {get;set;}     
 public List<ucinn_ascendv2__Work_Plan__c> giftOfficers = new List<ucinn_ascendv2__Work_Plan__c>();   
 Public ADVQReportModel.QReportModel model { get; set;}  

 public Boolean showPdf { get; set; }  
 public Boolean showSummaryReport { get; set; }
 public Boolean showDetailReport { get; set; } 
 public integer SelectedFiscalYear {get;set;}
 public date  SelectedFiscalYearEndDate {get;set;}
 public date  SelectedFiscalYearStartDate {get;set;}
 public date Quarter_StartDate {get;set;}
 public Decimal elideDec(Decimal input) { return (input == null) ? 0 : input; }
 public Integer elideInt(Integer input) { return (input == null) ? 0 : input; }

 //Public ADVQReportModel.QReportModel model { get; set;}  

 public List<QReportDetailsModel> details { get; set; }    
 public class QReportDetailsModel
  {  
        public Loop.ProcessDdpParameters params { get; set; }
  }
   public void getQReportModel()
    {              
        if(selectedQuarter == 'Q1')
        {
            QuarterEndDate =  Date.newInstance(Integer.valueOf(SelectedFY)-1, 09, 30);
        }
        else if( selectedQuarter == 'Q2')
        {
            QuarterEndDate =  Date.newInstance(Integer.valueOf(SelectedFY)-1, 12, 31);
        }
        else if( selectedQuarter == 'Q3')
        {     
            QuarterEndDate =  Date.newInstance(Integer.valueOf(SelectedFY), 03, 31);
        }
        else if(selectedQuarter == 'Q4')
        {
            QuarterEndDate =  Date.newInstance(Integer.valueOf(SelectedFY), 06, 30);
        }
     if(selectedFY == String.valueof(NEUOrganizationHelper.getCurrentFiscalYear()))
        {
            SelectedFiscalYearStartDate = ADVQReportConstants.CurrentFiscalYearStartDate;
            SelectedFiscalYearEndDate = ADVQReportConstants.CurrentFiscalYearEndDate; 
            SelectedFiscalYear = NEUOrganizationHelper.getCurrentFiscalYear();
            Quarter_StartDate = NEUOrganizationHelper.getCurrentFiscalYearStartDate();
        }
        else
        {
            SelectedFiscalYearStartDate = ADVQReportConstants.CurrentFiscalYearStartDate.AddYears(-1);
            SelectedFiscalYearEndDate = ADVQReportConstants.CurrentFiscalYearEndDate.AddYears(-1); 
            SelectedFiscalYear =  NEUOrganizationHelper.getCurrentFiscalYear()-1;
            Quarter_StartDate = NEUOrganizationHelper.getCurrentFiscalYearStartDate().AddYears(-1);
        }
        if(model == null)
        {
            model = new ADVQReportModel.QReportModel(); 
             model.SelectedFiscalYearStartDate = SelectedFiscalYearStartDate;
            model.SelectedFiscalYearEndDate = SelectedFiscalYearEndDate; 
            model.SelectedFiscalYear = SelectedFiscalYear;
            QuarterStartDate = Quarter_StartDate;
            CurrentFiscalYearEndDate =  Date.newInstance( model.SelectedFiscalYear, 06, 30);           
            QuarterStartDate = Quarter_StartDate;
      model.QuarterStartDate = QuarterStartDate;
            model.QuarterEndDate = QuarterEndDate;
            
            model.developmentOfficer = getAnnualGoalsDetails(); 
            model = getProspectList(model);
            model = getSecondaryProspectList(model);
            model.ProspectCount = model.assignedProspectCount + model.assignedSecondaryProspectCount;
            model = getPersonalVisits(model);
            model = getPhoneMeetings(model);
            model = getVideoMeetings(model);
            //model = getSolicitations(model);
            
            integer legacyDiscussionsCount = [SELECT count()  from
                                                   ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                                   where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c in ('Call','Personal Visit','Phone Meeting')
                                                   and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer 
                                                   and ucinn_ascendv2__Contact_Report__r.Legacy_or_DAF_Discussions__c =true
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate 
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <=:QuarterEndDate];
             model.legacyDiscussionsCount = legacyDiscussionsCount;
            
            if(model.developmentOfficer.NU_ADV_Exp_No_of_Legacy_Disc__c == null)
                model.developmentOfficer.NU_ADV_Exp_No_of_Legacy_Disc__c = 0;
            model.legacyDiscussionsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Legacy_Disc__c) -  model.legacyDiscussionsCount  ; 
            
             integer discoveryVisitsCount = [SELECT count()  from
                                                   ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                                   where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c in ('Personal Visit')
                                                   and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer 
                                                   and ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose__c in ('Discovery')
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate 
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <=:QuarterEndDate];
             model.discoveryPersonalVisitsCount = discoveryVisitsCount;
            
             integer discoveryPhoneMeetingsCount = [SELECT count()  from
                                                   ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                                   where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c in ('Phone Meeting')
                                                   and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer 
                                                   and ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose__c in ('Discovery')
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate 
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <=:QuarterEndDate];
             model.discoveryPhoneMeetingsCount = discoveryPhoneMeetingsCount;
            
             if(model.developmentOfficer.NU_ADV_Exp_No_Disc_Visits__c == null)
                model.developmentOfficer.NU_ADV_Exp_No_Disc_Visits__c = 0;
            model.discoveryPersonalVisitsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_Disc_Visits__c) 
                -  model.discoveryPersonalVisitsCount;
            
            if(model.developmentOfficer.NU_ADV_Exp_No_of_Disc_Phone_Mtgs__c == null)
                model.developmentOfficer.NU_ADV_Exp_No_of_Disc_Phone_Mtgs__c = 0;
            model.discoveryPhoneMeetingsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Disc_Phone_Mtgs__c)
                -  model.discoveryPhoneMeetingsCount;
            
            integer substantiveContactsCount = [SELECT count()  from
                                                   ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                                   where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c in
                                                ('Email','Call','Social Media Message','Letter','Text Message')
                                                   and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer 
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate 
                                                   and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <=:QuarterEndDate];
           model.otherSubstantiveContacts = substantiveContactsCount;

            
             if(model.Q1Q2dollarsRaised == null)
                model.Q1Q2dollarsRaised = 0;
            if(model.Q3Q4dollarsRaised == null)
                model.Q3Q4dollarsRaised = 0;
            if(model.Q1Q2dollarsToBeRaised == null)
                model.Q1Q2dollarsToBeRaised = 0;
            if(model.Q3Q4dollarsToBeRaised == null)
                model.Q3Q4dollarsToBeRaised = 0;
            model = getIndividualOppManagerOpportunities(model);
            model = getSharedOpportunitiesOpportunities(model);
            model = getOtherSolicitedOpportunities(model);
            model = getUnsolictedOpportunities(model);
            model = getThirdPartyOpportunities(model);
			model = getMGOpportunities(model);
             if(model.developmentOfficer.NU_ADV_Mid_Year_Goals_Percentage__c == null)
                model.developmentOfficer.NU_ADV_Mid_Year_Goals_Percentage__c = 50;
            
            model.Q1Q2Goal = model.developmentOfficer.NU_ADV_Annual_Fundraising_Goal__c * model.developmentOfficer.NU_ADV_Mid_Year_Goals_Percentage__c/100;
            model.Q3Q4Goal = model.developmentOfficer.NU_ADV_Annual_Fundraising_Goal__c * (100-model.developmentOfficer.NU_ADV_Mid_Year_Goals_Percentage__c)/100;
            model.Q1Q2dollarsToBeRaised = model.Q1Q2Goal - model.Q1Q2dollarsRaised;
            model.Q3Q4dollarsToBeRaised = model.Q3Q4Goal - model.Q3Q4dollarsRaised;
            
             model.dollarsRaised =  (elideDec(model.individualOppManagerClosedOppCost) + elideDec(model.sharedOpportunitiesClosedOppCost) 
                                    + elideDec(model.othersolicitedClosedOppCost)+ elideDec(model.unsolicitedClosedOppCost)+ elideDec(model.thirdPartyClosedOppCost)) ;
            if(model.developmentOfficer.NU_ADV_Annual_Fundraising_Goal__c == null)
                model.developmentOfficer.NU_ADV_Annual_Fundraising_Goal__c = 0;
            model.dollarsToBeRaised = model.developmentOfficer.NU_ADV_Annual_Fundraising_Goal__c -  model.dollarsRaised;
            
             model.giftsClosedCount =  (elideInt(model.individualOppManagerClosedOppCount) +
                                        elideInt( model.sharedOpportunitiesClosedOppCount) + 
                                        elideInt(model.othersolicitedClosedOppCount) );             
                                        //elideInt(model.unsolicitedClosedOppCount) +  
                                        //elideInt(model.thirdPartyClosedOppCount)) ;   
            if(model.developmentOfficer.NU_ADV_Exp_No_of_Closed_Opps__c == null)
                model.developmentOfficer.NU_ADV_Exp_No_of_Closed_Opps__c = 0;
            model.giftsToBeClosedCount =  integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Closed_Opps__c) -  model.giftsClosedCount;
            
            model.solicitationsCount =  (elideInt(model.individualOppManagerOpenOppCount) +
                                        elideInt( model.individualOppManagerDeclinedOppCount) + 
                                        elideInt(model.individualOppManagerClosedOppCount) +                                         
                                        elideInt(model.sharedOpportunitiesOpenOppCount) +
                                        elideInt( model.sharedOpportunitiesDeclinedOppCount) + 
                                        elideInt(model.sharedOpportunitiesClosedOppCount)+                                         
                                         elideInt(model.othersolicitedOpenOppCount) +
                                        elideInt( model.othersolicitedDeclinedOppCount) + 
                                        elideInt(model.othersolicitedClosedOppCount)); 
        if(model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c == null)
            model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c = 0;               
        model.solicitationsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c) -  model.SolicitationsCount ;
      

        }
    }
    
    //Annual Goals
    public ucinn_ascendv2__Work_Plan__c getAnnualGoalsDetails()
    {
         string fy = 'FY'+String.valueof(NEUOrganizationHelper.getCurrentFiscalYear()).right(2);
        ucinn_ascendv2__Work_Plan__c developmentOfficer = [select Id,Name,ucinn_ascendv2__Development_Officer__r.Name,NU_ADV_Title__c,NU_ADV_Supervisor__r.Name,NU_ADV_Hire_Date__c, NU_ADV_Annual_Fundraising_Goal__c, 
                                            NU_ADV_Exp_No_of_Closed_Opps__c, NU_ADV_Exp_No_of_Disc_Visits__c, NU_ADV_Exp_No_of_Personal_Visits__c, NU_ADV_Exp_No_of_Legacy_Disc__c, 
                                            NU_ADV_Exp_No_of_Solicitations__c, NU_ADV_Exp_No_of_Phone_Meetings__c, NU_ADV_Exp_No_of_Pure_Parent_Visits__c, NU_ADV_Exp_No_of_Disc_Phone_Mtgs__c, NU_ADV_Mid_Year_Goals_Percentage__c, 
                                            NU_ADV_Exp_No_Disc_Visits__c,ucinn_ascendv2__Development_Officer__c,ucinn_ascendv2__Work_Plan_Unit__r.Name,NU_ADV_Exp_No_of_Video_Meetings__c,ucinn_ascendv2__Role__c
                                            from ucinn_ascendv2__Work_Plan__c
                                            where ucinn_ascendv2__Development_Officer__c =: selectedGiftOfficer 
                                                           and ucinn_ascendv2__Fiscal_Year__c =: fy limit 1 ];
        return developmentOfficer; 
    }   
    //Get ProspectList
    public ADVQReportModel.QReportModel getProspectList(ADVQReportModel.QReportModel model)
    {
       // List<Contact> Prospects = //[select ucinn_ascendv2__PRM_No_Trustee_Formula__c, ucinn_ascendv2__Is_Deceased__c,
                                 //NU_ADV_NU_ID__c,ucinn_ascendv2__Donor_ID__c,Name,ucinn_ascendv2__Contact_Type__c from contact 
                                //WHERE (ucinn_ascendv2__PRM__c=:selectedGiftOfficer) 
                               // order by Name limit 1000];
        List<ucinn_ascendv2__Assignment__c> Prospects = [select Name,ucinn_ascendv2__Assigned_Relationship_Manager_User__c ,NU_ADV_Unit_or_Area__c, NU_ADV_Active__c, 
                Id, ucinn_ascendv2__Stage_of_Readiness_Formula__c,ucinn_ascendv2__Assignment_Type__c, ucinn_ascendv2__PRM_Formula__c,
                ucinn_ascendv2__Account__r.ucinn_ascendv2__PRM__r.Name, ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Is_Deceased__c,ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Donor_ID__c, ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.Name,
                ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Primary_Contact_Type__c,
                                                         ucinn_ascendv2__Account__r.ucinn_ascendv2__PRM__c,
                                                         ucinn_ascendv2__Account__r.Name,ucinn_ascendv2__Account__r.ucinn_ascendv2__Donor_ID__c

                from ucinn_ascendv2__Assignment__c 
                where
                ucinn_ascendv2__Assignment_Type__c in ('Primary Relationship Manager') and NU_ADV_Active__c = true and
               // ucinn_ascendv2__Account__r.RecordType.name='Household' and
                ucinn_ascendv2__Assigned_Relationship_Manager_User__c =:selectedGiftOfficer order by ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.Name ];
        model.ProspectList = Prospects;
        model.assignedProspectCount = Prospects.size();
        model.PermanentStewardshipCount=0;
        model.QualificationsCount=0;
        model.CultivationsCount=0;
        model.SolicitationsStageCount =0;
        model.StewardshipCount=0;
        model.IdentificationsCount=0;
        for(ucinn_ascendv2__Assignment__c assignment: Prospects) 
        {     
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Stewardship - Permanent')
            {model.PermanentStewardshipCount = model.PermanentStewardshipCount + 1;}
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Qualification')
            {model.QualificationsCount = model.QualificationsCount + 1;}
       if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Cultivation')
            {model.CultivationsCount = model.CultivationsCount + 1;}
      if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Solicitation')
            {model.SolicitationsStageCount = model.SolicitationsStageCount + 1;}
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Stewardship')
            {model.StewardshipCount = model.StewardshipCount + 1;} 
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Identification')
            {model.IdentificationsCount = model.IdentificationsCount + 1;}
        }
        
        return model;
        
    }
     //Get Secondary ProspectList
    public ADVQReportModel.QReportModel getSecondaryProspectList(ADVQReportModel.QReportModel model)
    {
        List<ucinn_ascendv2__Assignment__c> secondaryProspectlist = new List<ucinn_ascendv2__Assignment__c>();
        List<ucinn_ascendv2__Assignment__c> SecondaryProspects = [select ucinn_ascendv2__Assigned_Relationship_Mngr_Name_Formula__c, ucinn_ascendv2__Assignment_Type__c,ucinn_ascendv2__PRM_Formula__c,
                                                                  ucinn_ascendv2__Contact__c,ucinn_ascendv2__Account__c,ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.name,
                  ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Donor_ID__c,
                                                                  ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                                  ucinn_ascendv2__Stage_of_Readiness_Formula__c,
                  ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Is_Deceased__c,
                                                                  ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.Id,
                                                                  ucinn_ascendv2__Account__r.Name,ucinn_ascendv2__Account__r.ucinn_ascendv2__Donor_ID__c

                  from ucinn_ascendv2__Assignment__c
                                  where ucinn_ascendv2__Assignment_Type__c ='Secondary Relationship Manager' and NU_ADV_Active__c = true 
                                  and (ucinn_ascendv2__Assigned_Relationship_Manager_User__c =:selectedGiftOfficer ) 
                                  order by ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.LastName limit 1000];
        Set<ID> primaryContactIDs = new Set<ID>();        
       for(ucinn_ascendv2__Assignment__c c: SecondaryProspects) {
      if(!primaryContactIDs.contains(c.ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.Id))
      {            
                primaryContactIDs.add(c.ucinn_ascendv2__Account__r.ucinn_ascendv2__Primary_Contact__r.Id);
                secondaryProspectlist.Add(c); 
      }
        }

        model.SecondaryProspectList = secondaryProspectlist;
        model.assignedSecondaryProspectCount = secondaryProspectlist.size();
        
        for(ucinn_ascendv2__Assignment__c assignment: secondaryProspectlist) 
        {     
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Stewardship - Permanent')
            {model.PermanentStewardshipCount = model.PermanentStewardshipCount + 1;}
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Qualification')
            {model.QualificationsCount = model.QualificationsCount + 1;}
       if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Cultivation')
            {model.CultivationsCount = model.CultivationsCount + 1;}
      if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Solicitation')
            {model.SolicitationsStageCount = model.SolicitationsStageCount + 1;}
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Stewardship')
            {model.StewardshipCount = model.StewardshipCount + 1;}
            if(assignment.ucinn_ascendv2__Stage_of_Readiness_Formula__c == 'Identification')
            {model.IdentificationsCount = model.IdentificationsCount + 1;}
        }
        return model;
        
    }    
    //Get Personal Visits
    public ADVQReportModel.QReportModel getPersonalVisits(AdvQReportModel.QReportModel model)
    {
        model.personalVisits = [select ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Reviewed_by_Prospect_Management__c, 
                                ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose_2__c,
                                ucinn_ascendv2__Fundraiser__r.Name, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM_No_Trustee_Formula__c,
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c,
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Degree_Year__c
                                , 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Academic_Unit__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c, 
                                ucinn_ascendv2__Contact_Report__r.Location__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Description__c
                                 from
                                ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c ='Personal Visit' and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <= :QuarterEndDate
                                order by ucinn_ascendv2__Fundraiser__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name];   
        model.personalVisitsCount = model.personalVisits.size();
        if(model.developmentOfficer.NU_ADV_Exp_No_of_Personal_Visits__c == null)
            model.developmentOfficer.NU_ADV_Exp_No_of_Personal_Visits__c  = 0;               
        model.personalVisitsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Personal_Visits__c) -  model.personalVisitsCount ;
        return model;
    }
    //Get Phone Meetings
    public ADVQReportModel.QReportModel getPhoneMeetings(AdvQReportModel.QReportModel model)
    {
        model.phoneMeetings = [select ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Reviewed_by_Prospect_Management__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose_2__c,
                                ucinn_ascendv2__Fundraiser__r.Name, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM_No_Trustee_Formula__c, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c,
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Degree_Year__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Academic_Unit__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c,  ucinn_ascendv2__Contact_Report__r.Location__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Description__c
                                 from
                                ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c ='Phone Meeting' and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <= :QuarterEndDate
                                order by ucinn_ascendv2__Fundraiser__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name];   
        model.phoneMeetingsCount = model.phoneMeetings.size();
        if(model.developmentOfficer.NU_ADV_Exp_No_of_Phone_Meetings__c == null)
            model.developmentOfficer.NU_ADV_Exp_No_of_Phone_Meetings__c = 0;               
        model.phoneMeetingsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Phone_Meetings__c) -  model.phoneMeetingsCount ;
        return model;
    }
    //Get Video Meetings
    public ADVQReportModel.QReportModel getVideoMeetings(AdvQReportModel.QReportModel model)
    {
        model.videoMeetings = [select ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Reviewed_by_Prospect_Management__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose_2__c,
                                ucinn_ascendv2__Fundraiser__r.Name, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM_No_Trustee_Formula__c, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c,
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Degree_Year__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Academic_Unit__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c,  ucinn_ascendv2__Contact_Report__r.Location__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Description__c
                                 from
                                ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                where ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c ='Video Meeting' and  ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <= :QuarterEndDate
                                order by ucinn_ascendv2__Fundraiser__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name];   
        model.videoMeetingsCount = model.videoMeetings.size();
        if(model.developmentOfficer.NU_ADV_Exp_No_of_Video_Meetings__c == null)
            model.developmentOfficer.NU_ADV_Exp_No_of_Video_Meetings__c = 0;               
        model.videoMeetingsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Video_Meetings__c) -  model.videoMeetingsCount ;
        return model;
    }
    //Get Solicitations
    public ADVQReportModel.QReportModel getSolicitations(AdvQReportModel.QReportModel model)
    {
        model.solicitations = [select ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Reviewed_by_Prospect_Management__c, ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose_2__c,
                                ucinn_ascendv2__Fundraiser__r.Name, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM_No_Trustee_Formula__c, ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c,
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Degree_Year__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.NU_ADV_Primary_Academic_Unit__c,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c,  ucinn_ascendv2__Contact_Report__r.Location__c, 
                                ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Description__c
                                 from
                                ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c 
                                where ucinn_ascendv2__Contact_Report__r.NU_ADV_Contact_Purpose_2__c = 'Solicitation'  
                and  ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact_Method__c in 
                               ('Phone Meeting','Video Meeting','Personal Visit') 
                                and ucinn_ascendv2__Fundraiser__c=:selectedGiftOfficer
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c  >= :QuarterStartDate
                                and ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Date__c <= :QuarterEndDate

                                order by ucinn_ascendv2__Fundraiser__r.Name,ucinn_ascendv2__Contact_Report__r.ucinn_ascendv2__Contact__r.Name];   
        model.SolicitationsCount = model.Solicitations.size();
        if(model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c == null)
            model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c = 0;               
        model.solicitationsToBeMadeCount = integer.valueof(model.developmentOfficer.NU_ADV_Exp_No_of_Solicitations__c) -  model.SolicitationsCount ;
        return model;
    }
    //IndividualOppManagerOpportunities
    public ADVQReportModel.QReportModel getIndividualOppManagerOpportunities(ADVQReportModel.QReportModel model)
    {    
        model.allOpps = new List<ADVQReportModel.OpportunityModel>(); 
        model.individualOppManagerOpenWaitingForClearanceOpps  = new List<Opportunity>();
        model.individualOppManagerOpenClearanceGrantedOpps  = new List<Opportunity>();
        model.individualOppManagerOpenClearanceDeniedOpps  = new List<Opportunity>();      
        model.individualOppManagerOpenPendingOpps  = new List<Opportunity>();              
        model.individualOppManagerOpenOppCount = 0;
        model.individualOppManagerOpenOppCost = 0; 
        model.individualOppManagerDeclinedOpps = new List<Opportunity>();
        model.individualOppManagerWithdrawnOpps = new List<Opportunity>();
        model.individualOppManagerBookedOpps = new List<Opportunity>(); 
        model.individualOppManagerDeclinedOppCount = 0;
        model.individualOppManagerDeclinedOppCost = 0;
        model.individualOppManagerClosedOppCount = 0;
        model.individualOppManagerClosedOppCost = 0; 
        
        List<Opportunity> individualOppManagerOpenOpps = [select StageName, Name, Id,Probability, NU_ADV_Expected_Amount__c,ucinn_ascendv2__Expected_Close_Date__c,
                                                          CloseDate, Amount, ucinn_ascendv2__Is_Planned_Gift__c, Type, ucinn_ascendv2__Credit_Date__c,
                                                          ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Responsible_Person__r.Name,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c
                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c = :selectedGiftOfficer 
                                                        and Type not in ('Matching Gift','Pledge Payment')                                                           
                                                        and stagename in ('Waiting for Clearance','Clearance Granted', 'Clearance Denied','Pending')
                                                        and ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and ucinn_ascendv2__Expected_Close_Date__c <= :CurrentFiscalYearEndDate
                                                        and Id not in : model.countedOppIDs
                                                        order by StageName asc];        

        for(Opportunity opp: individualOppManagerOpenOpps) 
        {  
            //open
            ADVQReportModel.addIndividualOppManagerOpenOpportunity(model,opp);            
        }
        List<Opportunity> individualOppManagerClosedAndDeclinedOpps = [select StageName, Name, Id,Probability, 
                                                                       CloseDate, Amount,NU_ADV_Expected_Amount__c,ucinn_ascendv2__Expected_Close_Date__c,
                                                                       ucinn_ascendv2__Is_Planned_Gift__c, Type, ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                                      Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, ucinn_ascendv2__Credit_Date__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                                       ucinn_ascendv2__Responsible_Person__r.Name,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c
                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c = :selectedGiftOfficer 
                                                                      and Type not in ('Matching Gift','Pledge Payment') 
                                                                       and stagename in ('Declined', 'Withdrawn')
                                                                       and ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and ucinn_ascendv2__Expected_Close_Date__c <= :QuarterEndDate
                                                                       and Id not in :model.countedOppIDs
                                                                       order by StageName asc]; 

        for(Opportunity opp: individualOppManagerClosedAndDeclinedOpps) 
        {     
            //closed and declined    
            ADVQReportModel.addIndividualOppManagerClosedAndDeclinedOpportunity(model,opp);
        }
        
        List<Opportunity> individualOppManagerBookedOpps = [select StageName, Name, Id,Probability, CloseDate, Amount,
                                                            ucinn_ascendv2__Is_Planned_Gift__c, Type, ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                                      Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, ucinn_ascendv2__Credit_Date__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                                       ucinn_ascendv2__Responsible_Person__r.Name,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c
                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c = :selectedGiftOfficer 
                                                                      and Type not in ('Matching Gift','Pledge Payment') 
                                                                       and stagename in ('Booked')
                                                                       and ucinn_ascendv2__Funded_Date__c >= :QuarterStartDate and ucinn_ascendv2__Funded_Date__c <= :QuarterEndDate
                                                                       and Id not in :model.countedOppIDs
                                                                       order by StageName asc]; 

        for(Opportunity opp: individualOppManagerBookedOpps) 
        {     
            //closed and declined    
            ADVQReportModel.addIndividualOppManagerBookedOpportunity(model,opp);
        }
        return model;
    }
    //SharedOpportunitiesOpportunities
    public ADVQReportModel.QReportModel getSharedOpportunitiesOpportunities(ADVQReportModel.QReportModel model)
    {            
        model.sharedOpportunitiesOpenWaitingForClearanceOpps  = new List<OpportunityTeamMember>();
        model.sharedOpportunitiesOpenClearanceGrantedOpps  = new List<OpportunityTeamMember>();
        model.sharedOpportunitiesOpenClearanceDeniedOpps  = new List<OpportunityTeamMember>();      
        model.sharedOpportunitiesOpenPendingOpps  = new List<OpportunityTeamMember>();
        
        model.sharedOpportunitiesOpenOppCount = 0;
        model.sharedOpportunitiesOpenOppCost = 0;
        model.sharedOpportunitiesDeclinedOpps = new List<OpportunityTeamMember>();
        model.sharedOpportunitiesWithdrawnOpps = new List<OpportunityTeamMember>();
        model.sharedOpportunitiesBookedOpps = new List<OpportunityTeamMember>();  
        model.sharedOpportunitiesDeclinedOppCount = 0;
        model.sharedOpportunitiesDeclinedOppCost = 0;
        model.sharedOpportunitiesClosedOppCount = 0;
        model.sharedOpportunitiesClosedOppCost = 0;
       
        List<OpportunityTeamMember> sharedOpportunitiesOpenOpps = new List<OpportunityTeamMember>();
        List<OpportunityTeamMember> sharedOpportunitiesClosedAndDeclinedOpps = new List<OpportunityTeamMember>();
        List<OpportunityTeamMember> sharedOpportunitiesBookedOpps = new List<OpportunityTeamMember>();
      
        sharedOpportunitiesOpenOpps = [select Opportunity.StageName,Opportunity.Name,Opportunity.Id,Opportunity.Probability,Opportunity.ucinn_ascendv2__Credit_Date__c,
                                            Opportunity.CloseDate, Opportunity.Amount, 
                                       Opportunity.NU_ADV_Expected_Amount__c,Opportunity.ucinn_ascendv2__Expected_Close_Date__c,
                                       Opportunity.ucinn_ascendv2__Is_Planned_Gift__c,TeamMemberRole, 
                                           Opportunity.Type, Opportunity.ucinn_ascendv2__Payment_Type__c,Opportunity.NU_ADV_Solicit_Code__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                           Opportunity.ucinn_ascendv2__Responsible_Person__r.Name,Opportunity.ucinn_ascendv2__Funded_Date__c,Opportunity.ucinn_ascendv2__Funded_Amount__c
                                           from OpportunityTeamMember   
                                           where Opportunity.Type not in ('Matching Gift','Pledge Payment')
                                           and Opportunity.stagename in ('Waiting for Clearance','Clearance Granted', 'Clearance Denied','Pending')
                                           and UserId =:selectedGiftOfficer
                                           and Opportunity.ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and Opportunity.ucinn_ascendv2__Expected_Close_Date__c <= :CurrentFiscalYearEndDate
                                           and Opportunity.Id not in :model.countedOppIDs
                                           order by Opportunity.StageName asc];
            
            sharedOpportunitiesClosedAndDeclinedOpps = [select Opportunity.StageName,Opportunity.Name,Opportunity.Id,Opportunity.Probability,Opportunity.ucinn_ascendv2__Credit_Date__c,
                                            Opportunity.CloseDate, Opportunity.Amount,
                                            Opportunity.NU_ADV_Expected_Amount__c,Opportunity.ucinn_ascendv2__Expected_Close_Date__c,
                      Opportunity.ucinn_ascendv2__Is_Planned_Gift__c, TeamMemberRole,
                                           Opportunity.Type, Opportunity.ucinn_ascendv2__Payment_Type__c,Opportunity.NU_ADV_Solicit_Code__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                           Opportunity.ucinn_ascendv2__Responsible_Person__r.Name,Opportunity.ucinn_ascendv2__Funded_Date__c,Opportunity.ucinn_ascendv2__Funded_Amount__c
                                           from OpportunityTeamMember   
                                           where Opportunity.Type not in ('Matching Gift','Pledge Payment')
                                           and Opportunity.stagename in ('Declined', 'Withdrawn','Funded')
                                           and UserId =:selectedGiftOfficer
                                           and Opportunity.ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and Opportunity.ucinn_ascendv2__Expected_Close_Date__c <= :QuarterEndDate
                                           and Opportunity.Id not in :model.countedOppIDs
                                           order by Opportunity.StageName asc];
        sharedOpportunitiesBookedOpps = [select Opportunity.StageName,Opportunity.Name,Opportunity.Id,Opportunity.Probability,Opportunity.ucinn_ascendv2__Credit_Date__c,
                                            Opportunity.CloseDate, Opportunity.Amount, Opportunity.ucinn_ascendv2__Is_Planned_Gift__c, TeamMemberRole,
                                           Opportunity.Type, Opportunity.ucinn_ascendv2__Payment_Type__c,Opportunity.NU_ADV_Solicit_Code__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                           Opportunity.Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                           Opportunity.ucinn_ascendv2__Responsible_Person__r.Name,Opportunity.ucinn_ascendv2__Funded_Date__c,Opportunity.ucinn_ascendv2__Funded_Amount__c
                                           from OpportunityTeamMember   
                                           where Opportunity.Type not in ('Matching Gift','Pledge Payment')
                                           and Opportunity.stagename in ('Booked')
                                           and UserId =:selectedGiftOfficer
                                           and Opportunity.ucinn_ascendv2__Funded_Date__c >= :QuarterStartDate and Opportunity.ucinn_ascendv2__Funded_Date__c <= :QuarterEndDate
                                           and Opportunity.Id not in :model.countedOppIDs
                                           order by Opportunity.StageName asc];
       
        
        for(OpportunityTeamMember opp: sharedOpportunitiesOpenOpps) 
        {
            //open
            ADVQReportModel.addSharedOpenOpportunity(model,opp);
            
        }
        for(OpportunityTeamMember opp: sharedOpportunitiesClosedAndDeclinedOpps) 
        {
            //closed and declined
            ADVQReportModel.addSharedClosedAndDeclinedOpportunity(model,opp);
        }
        for(OpportunityTeamMember opp: sharedOpportunitiesBookedOpps) 
        {
            //closed and declined
            ADVQReportModel.addSharedBookedOpportunity(model,opp);
        }
        
        return model;
    }
    //OtherSolicitedOpportunities - Account Teams
    public ADVQReportModel.QReportModel getOtherSolicitedOpportunities(ADVQReportModel.QReportModel model)
    {               
        model.otherSolicitedOpenWaitingForClearanceOpps  = new List<Opportunity>();
        model.otherSolicitedOpenClearanceGrantedOpps  = new List<Opportunity>();
        model.otherSolicitedOpenClearanceDeniedOpps  = new List<Opportunity>();      
        model.otherSolicitedOpenPendingOpps  = new List<Opportunity>(); 
        model.otherSolicitedOpenOppCount = 0;
        model.otherSolicitedOpenOppCost = 0;
        model.otherSolicitedDeclinedOpps = new List<Opportunity>();
        model.otherSolicitedWithdrawnOpps = new List<Opportunity>();
        model.otherSolicitedBookedOpps = new List<Opportunity>(); 
        model.otherSolicitedDeclinedOppCount = 0;
        model.otherSolicitedDeclinedOppCost = 0;
        model.otherSolicitedClosedOppCount = 0;
        model.otherSolicitedClosedOppCost = 0;

        Set<ID> primaryAccountIDs = new Set<ID>(); 
        for(List<Account> theAccounts: [select ID, RecordTypeID, Name,ucinn_ascendv2__PRM__r.Name from Account 
                                        where ucinn_ascendv2__PRM__c = :selectedGiftOfficer]) 
        {
            for(Account anAccount:theAccounts) {
                primaryAccountIDs.add(anAccount.ID); 
            }
        } 
             
        List<Opportunity> otherSolicitedOpenOpps = [select StageName, Name, Id,Probability, 
                                                          CloseDate, Amount, ucinn_ascendv2__Is_Planned_Gift__c, Type, ucinn_ascendv2__Credit_Date__c,
                                                          ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Responsible_Person__r.Name,Account.Name, AccountId,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c,
                                                        NU_ADV_Expected_Amount__c,ucinn_ascendv2__Expected_Close_Date__c

                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c != ''
                                                    and ucinn_ascendv2__Responsible_Person__c != :selectedGiftOfficer
                                                    //and (Account.ucinn_ascendv2__PRM__c =:selectedGiftOfficer)
                                                    and AccountId in :primaryAccountIDs
                          and stagename in ('Waiting for Clearance','Clearance Granted', 'Clearance Denied','Pending')
                                                    and ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and ucinn_ascendv2__Expected_Close_Date__c <= :CurrentFiscalYearEndDate                                       
                                                    and Id not in :model.countedOppIDs
                                                    order by StageName asc]; 
        for(Opportunity opp: otherSolicitedOpenOpps) 
        {                                                   
            ADVQReportModel.addOtherSolicitedOpenOpportunity(model,opp);
        }
        
        List<Opportunity> otherSolicitedClosedAndDeclinedOpps = [select StageName, Name, Id,Probability, ucinn_ascendv2__Credit_Date__c,
                                                          CloseDate, Amount, ucinn_ascendv2__Is_Planned_Gift__c, Type, 
                                                          ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Responsible_Person__r.Name,Account.Name, AccountId,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c,
                                                        NU_ADV_Expected_Amount__c,ucinn_ascendv2__Expected_Close_Date__c

                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c != ''
                                                    and ucinn_ascendv2__Responsible_Person__c != :selectedGiftOfficer
                                                    and AccountId in :primaryAccountIDs
                                                    //and (Account.ucinn_ascendv2__PRM__c =:selectedGiftOfficer)
                                                                 and stagename in ('Declined', 'Withdrawn','Funded')
                                                    and ucinn_ascendv2__Expected_Close_Date__c >= :QuarterStartDate and ucinn_ascendv2__Expected_Close_Date__c <= :QuarterEndDate                                       
                                                    and Id not in :model.countedOppIDs
                                                    order by StageName asc]; 
                     
        for(Opportunity opp: otherSolicitedClosedAndDeclinedOpps) 
        {           
            ADVQReportModel.addOtherSolicitedClosedandDeclinedOpportunity(model,opp);
        }
        
        List<Opportunity> otherSolicitedBookedOpps = [select StageName, Name, Id,Probability, ucinn_ascendv2__Credit_Date__c,
                                                          CloseDate, Amount, ucinn_ascendv2__Is_Planned_Gift__c, Type, 
                                                          ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.NU_ADV_NU_ID__c, 
                                                        Account.ucinn_ascendv2__Primary_Contact__r.Name,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        Account.ucinn_ascendv2__Primary_Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Responsible_Person__r.Name,Account.Name, AccountId,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c
                                                        from Opportunity 
                                                        where ucinn_ascendv2__Responsible_Person__c != ''
                                                    and ucinn_ascendv2__Responsible_Person__c != :selectedGiftOfficer
                                                    and AccountId in :primaryAccountIDs
                                                    //and (Account.ucinn_ascendv2__PRM__c =:selectedGiftOfficer)
                                                                 and stagename in ('Booked')
                                                    and ucinn_ascendv2__Funded_Date__c >= :QuarterStartDate and ucinn_ascendv2__Funded_Date__c <= :QuarterEndDate                                       
                                                    and Id not in :model.countedOppIDs
                                                    order by StageName asc]; 
         for(Opportunity opp: otherSolicitedBookedOpps) 
        {           
            ADVQReportModel.addOtherSolicitedBookedOpportunity(model,opp);
        }
        
        return model;
    }
    //UnsolictedOpportunities
    public ADVQReportModel.QReportModel getUnsolictedOpportunities(ADVQReportModel.QReportModel model)
    {       
        model.unsolicitedClosedOppCost = 0; 
        model.unsolicitedClosedOppCount = 0;
        model.UnsolicitedOpportunities = new List<Opportunity>();
        
        Set<ID> primaryContactIDs = new Set<ID>(); 
        for(List<Contact> theContacts: [select ID, RecordTypeID, Name, FirstName, LastName, ucinn_ascendv2__PRM__c from Contact 
                                        where ucinn_ascendv2__PRM__c = :selectedGiftOfficer]) 
        {
            for(Contact con:theContacts) {
                primaryContactIDs.add(con.ID);                   
            }
        } 
        List<Opportunity> closedUnsolicitedOpps = [select StageName, Name, Id,Probability, ucinn_ascendv2__Credit_Date__c,
                                                          CloseDate, Amount, ucinn_ascendv2__Is_Planned_Gift__c, Type, 
                                                          ucinn_ascendv2__Payment_Type__c,NU_ADV_Solicit_Code__c,
                                                        ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c, 
                                                        ucinn_ascendv2__Contact__r.Name,
                                                        ucinn_ascendv2__Contact__r.FirstName,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Responsible_Person__r.Name,ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Funded_Amount__c
                                                        from Opportunity 
                                                   where ucinn_ascendv2__Responsible_Person__c = ''
                                                   and ucinn_ascendv2__Contact__c in :primaryContactIDs
                                                   and Type not in ('Matching Gift','Pledge Payment')
                                                   and stagename in ('Booked','Funded')
                                                   and Id not in :model.countedOppIDs and ucinn_ascendv2__Proposal__c not in :model.countedOppIDs
                                                   and ucinn_ascendv2__Credit_Date__c >= :QuarterStartDate and ucinn_ascendv2__Credit_Date__c <= :QuarterEndDate];

      for(Opportunity opp : closedUnsolicitedOpps)
        {
            ADVQReportModel.addUnsolictedClosedOpportunity(model,opp); 
        }    
        
        return model;
    }    
    //third party
    public ADVQReportModel.QReportModel getThirdPartyOpportunities(ADVQReportModel.QReportModel model)
    { 
         model.thirdPartyClosedOppCost = 0; 
        model.thirdPartyClosedOppCount = 0;
        model.ThirdPartyOpportunities = new List<ucinn_ascendv2__Hard_and_Soft_Credit__c>();
         Set<ID> primaryContactIDs = new Set<ID>(); 
        for(List<account> theAccounts: [select ucinn_ascendv2__Primary_Contact__c,Name,ucinn_ascendv2__Primary_Contact__r.Name  from Account 
                                        where ucinn_ascendv2__PRM__c = :selectedGiftOfficer and ucinn_ascendv2__Primary_Contact__c !=null ]) 
        {
            for(Account theAccount:theAccounts) {
            primaryContactIDs.add(theAccount.ucinn_ascendv2__Primary_Contact__c); 
            }
        } 

         Set<ID> oppIds = new Set<ID>(); 
        List<ucinn_ascendv2__Hard_and_Soft_Credit__c> thehardcredits= [select ucinn_ascendv2__Opportunity__r.StageName,ucinn_ascendv2__Opportunity__r.Name, ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c,
                                                                           ucinn_ascendv2__Opportunity__r.Id, ucinn_ascendv2__Opportunity__r.Probability,
                                                                           ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c ,
                                                                           ucinn_ascendv2__Opportunity__r.CloseDate, ucinn_ascendv2__Credit_Amount__c, ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Is_Planned_Gift__c, ucinn_ascendv2__Opportunity__r.Type, 
                                                          ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Payment_Type__c,ucinn_ascendv2__Opportunity__r.NU_ADV_Solicit_Code__c,
                                                        ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c, Name,
                                                        ucinn_ascendv2__Contact__r.Name,
                                                        ucinn_ascendv2__Contact__r.FirstName,ucinn_ascendv2__Credit_Type__c,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Responsible_Person__r.Name,
                                                        ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Funded_Amount__c
                                                                                                                                                     
                                                                           from ucinn_ascendv2__Hard_and_Soft_Credit__c  
                                                                           
                                        where ucinn_ascendv2__Contact__c in :primaryContactIDs and ucinn_ascendv2__Credit_Type__c ='Soft'
                                        and ucinn_ascendv2__Opportunity__r.StageName ='Funded' //and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c =''
                                       and ucinn_ascendv2__Opportunity__r.Type not in ('Matching','Pledge Payment')
									   and ucinn_ascendv2__Opportunity__r.NU_ADV_Related_Pledge__c =''
                                       and ucinn_ascendv2__Opportunity__r.Id not in :model.countedOppIDs and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Proposal__c 
                                      not in :model.countedOppIDs and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c >= :QuarterStartDate and 
                                                                           ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c <= :QuarterEndDate];

           for(ucinn_ascendv2__Hard_and_Soft_Credit__c theHardCredit:thehardcredits) {

               if(String.isBlank(theHardCredit.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c))
               {
                //oppIds.add(theHardCredit.ucinn_ascendv2__Opportunity__c ); 
                ADVQReportModel.addThirdPartyClosedOpportunity(model,theHardCredit); 
               }
            
           }
        
        
        return model;
    }
    
    //MG OPP HC
    public ADVQReportModel.QReportModel getMGOpportunities(ADVQReportModel.QReportModel model)
    { 
        model.MGClosedOppCost = 0; 
        model.MGClosedOppCount = 0;
        model.MGOpportunities = new List<ucinn_ascendv2__Hard_and_Soft_Credit__c>();
         Set<ID> primaryContactIDs = new Set<ID>(); 
        for(List<account> theAccounts: [select ucinn_ascendv2__Primary_Contact__c,Name,ucinn_ascendv2__Primary_Contact__r.Name  from Account 
                                        where ucinn_ascendv2__PRM__c = :selectedGiftOfficer and ucinn_ascendv2__Primary_Contact__c !=null ]) 
        {
            for(Account theAccount:theAccounts) {
            primaryContactIDs.add(theAccount.ucinn_ascendv2__Primary_Contact__c); 
            }
        } 
         Set<ID> oppIds = new Set<ID>(); 
        List<ucinn_ascendv2__Hard_and_Soft_Credit__c> thehardcredits= [select ucinn_ascendv2__Opportunity__r.StageName,ucinn_ascendv2__Opportunity__r.Name, ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c,
                                                                           ucinn_ascendv2__Opportunity__r.Id, ucinn_ascendv2__Opportunity__r.Probability,
                                                                           ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c ,
                                                                           ucinn_ascendv2__Opportunity__r.CloseDate, ucinn_ascendv2__Credit_Amount__c, ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Is_Planned_Gift__c, ucinn_ascendv2__Opportunity__r.Type, 
                                                          ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Payment_Type__c,ucinn_ascendv2__Opportunity__r.NU_ADV_Solicit_Code__c,
                                                        ucinn_ascendv2__Contact__r.NU_ADV_NU_ID__c, Name,
                                                        ucinn_ascendv2__Contact__r.Name,
                                                        ucinn_ascendv2__Contact__r.FirstName,ucinn_ascendv2__Credit_Type__c,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__Contact_Type__c,
                                                        ucinn_ascendv2__Contact__r.ucinn_ascendv2__PRM__r.Name,
                                                        ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Responsible_Person__r.Name,
                                                        ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Funded_Date__c,ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Funded_Amount__c
                                                                                                                                                     
                                                         from ucinn_ascendv2__Hard_and_Soft_Credit__c  
                                                                           
                                        where ucinn_ascendv2__Contact__c in :primaryContactIDs and ucinn_ascendv2__Credit_Type__c ='Soft'
                                        and ucinn_ascendv2__Opportunity__r.StageName ='Funded' //and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c =''
                                       and ucinn_ascendv2__Opportunity__r.Type  in ('Matching')
                                       and ucinn_ascendv2__Source__c = 'Payment'
									   and ucinn_ascendv2__Opportunity__r.NU_ADV_Related_Pledge__c =''
                                       and ucinn_ascendv2__Opportunity__r.Id not in :model.countedOppIDs and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Proposal__c 
                                      not in :model.countedOppIDs and ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c >= :QuarterStartDate and 
                                                                           ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c <= :QuarterEndDate];

           for(ucinn_ascendv2__Hard_and_Soft_Credit__c theHardCredit:thehardcredits) {
               
               if(String.isBlank(theHardCredit.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Contact__c))
               {
                ADVQReportModel.addMGClosedOpportunity(model,theHardCredit); 
               }
            
           }
        
        
        return model;
    }
    
    
   //changeGiftOfficer
    public void changeGiftOfficer()
    {
        model =null; 
        showDetailReport = false; 
        showSummaryReport = false;
    }
    //changeTerm
    public void changeTerm()
    {
        model =null; 
        showDetailReport = false; 
        showSummaryReport = false;
    }
    //changeFY
    public void changeFY()
    {
        model =null; 
        showDetailReport = false; 
        showSummaryReport = false;
    }
    public String getChooserender() 
    {
        if(showPdf == true)
            ApexPages.currentPage().getParameters().put('p','p');              
        if (ApexPages.currentPage().getParameters().get('p') != null)
            return 'advanced_pdf';
        else
            return null;
    }
    public string getDDPId()
    {
        string ddpId = '';
        List<Loop__DDP__c> loopDDPs = [SELECT Id FROM Loop__DDP__c WHERE Name = 'ADVQReport'];
        for (Loop__DDP__c ddp : loopDDPs) 
        {
            ddpId = ddp.Id;
        }
        return ddpId;
    }
     public void runSummaryReport() 
    {
        if(String.isBlank(selectedGiftOfficer))
        {           
        }
        else
        {
            getGiftOfficers();
            showSummaryReport = true;
            showDetailReport = false;     
            getQReportModel();  
        }
        
    }    
    public pageReference runSummaryPDFReport()
    {         
        PageReference pageRef = Page.ADVQReportSummary;
        if(String.isBlank(selectedGiftOfficer))
        {
        }
        else
        {        
            showPdf = true;
            pageRef.getParameters().put('p','p');        
            getQReportModel(); 
        }       
        return pageRef;
    }    
    public void runDetailsReport() 
    {
        if(String.isBlank(selectedGiftOfficer))
        {    
        }
        else
        {
            getGiftOfficers();
            showSummaryReport = false;
            showDetailReport = true;         
            showPdf = false;       
            getQReportModel(); 
        }
        details = null;
    }     
    public void runDetailsPDFReport() 
    {          
        showSummaryReport = false;
        showDetailReport = true;  
        string ddpId = getDDPId();//'a0Pq00000058cpR';
        string deliveryOptionId = getDeliveryOptionId(ddpId);//'a0Nq0000003vYHPEA2';
        Cache.Session.put('local.ADVSession.model', model);
        details = new List<QReportDetailsModel>();
        QReportDetailsModel d = new QReportDetailsModel();     
        Loop.ExternalData.QueryResultSet queryResultSet = new Loop.ExternalData.QueryResultSet();              
        //Loop.ProcessDdpParameters params = new Loop.ProcessDdpParameters(ddpId, deliveryOptionId, selectedGiftOfficer ,new List<Id>());       
       // params.theme = Loop.ProcessDdpParameters.ThemeStyle.Bootstrap_3_2;                      
        //d.params = params; 
        //details.add(d);
    }  
    //Draw Loop DeliveryOptionId
    public string getDeliveryOptionId(string DDPId)
    {
        string deliveryOptionId = '';
        List<Loop__DDP_Integration_Option__c> loopDDPIntegrations = [SELECT Id FROM Loop__DDP_Integration_Option__c WHERE Loop__DDP__c =: DDPId];
        for (Loop__DDP_Integration_Option__c loopDDPIntegration : loopDDPIntegrations) 
        {
            deliveryOptionId = loopDDPIntegration.Id;
        }
        return deliveryOptionId;
    }
    //Gift Officers List
    public List<SelectOption> getGiftOfficers()
    {
        List<SelectOption> options = new List<SelectOption>();
        List<AggregateResult>  giftOfficers1  = new List<AggregateResult>();
        string fy = 'FY'+String.valueof(NEUOrganizationHelper.getCurrentFiscalYear()).right(2);
        if(giftOfficers.Size()==0)
        {
            giftOfficers1 = [select ucinn_ascendv2__Development_Officer__c, ucinn_ascendv2__Development_Officer__r.Name 
                            from ucinn_ascendv2__Work_Plan__c   
                             where ucinn_ascendv2__Fiscal_Year__c =: fy
                            group by ucinn_ascendv2__Development_Officer__c,ucinn_ascendv2__Development_Officer__r.Name
                            Order by ucinn_ascendv2__Development_Officer__r.Name];
        }
                    
        options.add(new SelectOption('', ''));
        for (AggregateResult   c : giftOfficers1)
        {
            options.add(new SelectOption((String)c.get('ucinn_ascendv2__Development_Officer__c'), (String)c.get('Name')));
        }
        return options;
    } 

    //FY List
    public List<SelectOption> getListOfFY() 
    {
        List<SelectOption> options = new List<SelectOption>();
        string currentFY = string.valueOf(NEUOrganizationHelper.getCurrentFiscalYear());
        string previousFY = string.valueOf(NEUOrganizationHelper.getCurrentFiscalYear()-1);
        options.add(new SelectOption(currentFY, currentFY));    
        options.add(new SelectOption(previousFY, previousFY));    
        return options;
    } 
    //Quarters List
    public List<SelectOption> getListOfQuarters() 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Q1','Q1'));
        options.add(new SelectOption('Q2','Q2'));
        options.add(new SelectOption('Q3','Q3'));
        options.add(new SelectOption('Q4','Q4'));
        
        return options;
    }     
     //getSelectedQuarter
    public string getSelectedQuarter(Date CurrentDate)
    {
        string selectedQuarter;
        if((CurrentDate.month()==1) || (CurrentDate.month()==2)||(CurrentDate.month()==3))
        {
            selectedQuarter = 'Q3';
        }
        else if((CurrentDate.month()==4) || (CurrentDate.month()==5)||(CurrentDate.month()==6))
        {
            selectedQuarter = 'Q4';
        }
        else if((CurrentDate.month()==7) || (CurrentDate.month()==8)||(CurrentDate.month()==9))
        {
            selectedQuarter = 'Q1';
        }
        else if((CurrentDate.month()==10) || (CurrentDate.month()==11)||(CurrentDate.month()==12))
        {
            selectedQuarter = 'Q2';
        }
        return selectedQuarter;
    } 

}