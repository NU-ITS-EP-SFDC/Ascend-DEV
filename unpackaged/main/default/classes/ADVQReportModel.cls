public class ADVQReportModel
{    
    public class OpportunityModel
    {  
        public string Name {get;set;}
        public decimal Amount { get;set;}
        //public date Closedate {get;set;}
        public date Creditdate {get;set;}
        public date Fundeddate {get;set;}
        public decimal FundedAmount { get;set;}
        public string Stage {get;set;}
        public boolean Q1  {get;set;}
        public boolean Q2  {get;set;} 
        public boolean Q3  {get;set;}
        public boolean Q4  {get;set;}
    }
    
    public class QReportModel
    {       
        public date AsOfDate {get;set;}
        public date QuarterStartDate {get;set;}
        public date QuarterEndDate {get;set;}        
        public integer SelectedFiscalYear {get;set;}
        public date  SelectedFiscalYearEndDate {get;set;}
        public date  SelectedFiscalYearStartDate {get;set;}
        public ucinn_ascendv2__Work_Plan__c developmentOfficer { get; set;}        
        public integer assignedProspectCount { get; set;}
        public integer assignedSecondaryProspectCount  { get; set;}
        public integer ProspectCount { get; set;}
		public integer QualificationsCount { get; set;}
        public integer CultivationsCount { get; set;}
        public integer SolicitationsStageCount { get; set;}
        public integer IdentificationsCount { get; set;}
        public integer StewardshipCount { get; set;}
        public integer PermanentStewardshipCount { get; set;}
        public Set<ID> countedOppIDs = new Set<ID>();
        
        public List<Opportunity> individualOppManagerOpenWaitingForClearanceOpps { get; set;}
        public List<Opportunity> individualOppManagerOpenClearanceGrantedOpps { get; set;}
        public List<Opportunity> individualOppManagerOpenClearanceDeniedOpps { get; set;}
        public List<Opportunity> individualOppManagerOpenPendingOpps { get; set;}
        public List<Opportunity> individualOppManagerDeclinedOpps { get; set;}
        public List<Opportunity> individualOppManagerWithdrawnOpps { get; set;}
        public List<Opportunity> individualOppManagerBookedOpps { get; set;}
        public integer individualOppManagerOpenOppCount { get; set;}
        public decimal individualOppManagerOpenOppCost { get;set;}
        public integer individualOppManagerDeclinedOppCount { get; set;}
        public decimal individualOppManagerDeclinedOppCost { get;set;}
        public integer individualOppManagerClosedOppCount { get; set;}
        public decimal individualOppManagerClosedOppCost { get;set;}
        
        public List<OpportunityTeamMember> sharedOpportunitiesOpenWaitingForClearanceOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesOpenClearanceGrantedOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesOpenClearanceDeniedOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesOpenPendingOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesDeclinedOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesWithdrawnOpps { get; set;}
        public List<OpportunityTeamMember> sharedOpportunitiesBookedOpps { get; set;} 
        public integer sharedOpportunitiesOpenOppCount { get; set;}
        public decimal sharedOpportunitiesOpenOppCost { get;set;}
        public integer sharedOpportunitiesDeclinedOppCount { get; set;}
        public decimal sharedOpportunitiesDeclinedOppCost { get;set;}
        public integer sharedOpportunitiesClosedOppCount { get; set;}
        public decimal sharedOpportunitiesClosedOppCost { get;set;} 
        
        public List<Opportunity> otherSolicitedOpenWaitingForClearanceOpps { get; set;}
        public List<Opportunity> otherSolicitedOpenClearanceGrantedOpps { get; set;}
        public List<Opportunity> otherSolicitedOpenClearanceDeniedOpps { get; set;}
        public List<Opportunity> otherSolicitedOpenPendingOpps { get; set;}
        public List<Opportunity> otherSolicitedDeclinedOpps { get; set;}
        public List<Opportunity> otherSolicitedWithdrawnOpps { get; set;}
        public List<Opportunity> otherSolicitedBookedOpps { get; set;} 
        public integer othersolicitedOpenOppCount { get; set;}
        public decimal othersolicitedOpenOppCost { get;set;}
        public integer othersolicitedDeclinedOppCount { get; set;}
        public decimal othersolicitedDeclinedOppCost { get;set;}
        public integer othersolicitedClosedOppCount { get; set;}
        public decimal othersolicitedClosedOppCost { get;set;}
        public List<OpportunityModel> allOpps {get;set;}
        
        public List<ucinn_ascendv2__Hard_and_Soft_Credit__c> ThirdPartyOpportunities{ get; set; }
        public integer thirdPartyClosedOppCount { get; set;}
        public decimal thirdPartyClosedOppCost { get;set;}
        
        public List<ucinn_ascendv2__Hard_and_Soft_Credit__c> MGOpportunities{ get; set; }
        public integer MGClosedOppCount { get; set;}
        public decimal MGClosedOppCost { get;set;}
        
        public List<Opportunity> UnsolicitedOpportunities{ get; set; }  
        public integer unsolicitedClosedOppCount { get; set;}
        public decimal unsolicitedClosedOppCost { get;set;}
        
        public decimal dollarsRaised { get; set;}
        public integer giftsClosedCount{ get; set;}
        public integer personalVisitsCount{ get; set;}
        public integer discoveryPersonalVisitsCount{ get; set;}
        public integer discoveryPhoneMeetingsCount{ get; set;}
        public integer solicitationsCount{ get; set;}
        public integer legacyDiscussionsCount{ get; set;}
        //public integer reviewedVisitsCount { get; set;}
        public integer otherSubstantiveContacts{ get; set;}
        public integer phoneMeetingsCount{ get; set;}
        public integer videoMeetingsCount{ get; set;}

        public decimal dollarsToBeRaised { get; set;}
        public decimal Q1Q2Goal { get; set;}
        public decimal Q3Q4Goal { get; set;}
        public decimal Q1Q2dollarsRaised { get; set;}
        public decimal Q3Q4dollarsRaised { get; set;}
        public decimal Q1Q2dollarsToBeRaised { get; set;}
        public decimal Q3Q4dollarsToBeRaised { get; set;}
        public integer giftsToBeClosedCount{ get; set;}
        public integer personalVisitsToBeMadeCount{ get; set;}
        public integer discoveryPersonalVisitsToBeMadeCount{ get; set;}
        public integer discoveryPhoneMeetingsToBeMadeCount{ get; set;}
        public integer solicitationsToBeMadeCount{ get; set;}
        public integer legacyDiscussionsToBeMadeCount{ get; set;}
        public integer phoneMeetingsToBeMadeCount{ get; set;}
        public integer videoMeetingsToBeMadeCount{ get; set;}

        //Details
        public List<ucinn_ascendv2__Assignment__c> ProspectList{ get; set; }
        public List<ucinn_ascendv2__Assignment__c> SecondaryProspectList{ get; set; }
        public List<ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c > PersonalVisits{ get; set; }
        public List<ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c > PhoneMeetings{ get; set; }
        public List<ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c > VideoMeetings{ get; set; }
        public List<ucinn_ascendv2__Fundraiser_Contact_Report_Relation__c > Solicitations{ get; set; }

        //public List<Event> PersonalVisits{ get; set; }
        //public List<Event> PhoneMeetings { get; set; }
        //public List<Event> Solicitations{ get; set; }
        //public List<Event> SolicitationEvents{ get; set; }
        //public List<Task> SolicitationTasks{ get; set; }
        //List<Opportunity> UnsolicitedOpportunities{ get; set; }  
    }   
    
  
    
    //IndividualOppManagerOpportunities 
    public static void addIndividualOppManagerOpenOpportunity(QReportModel model,Opportunity opp) 
    {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.NU_ADV_Expected_Amount__c;
        oppModel.Creditdate = opp.ucinn_ascendv2__Expected_Close_Date__c;
        oppModel.Stage = opp.StageName;
        if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        
        //open
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE)) 
        {
            model.individualOppManagerOpenWaitingForClearanceOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED )) 
        {
            model.individualOppManagerOpenClearanceGrantedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_DENIED )) 
        {
            model.individualOppManagerOpenClearanceDeniedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_PENDING )) 
        {
            model.individualOppManagerOpenPendingOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        
        model.individualOppManagerOpenOppCount++;
        model.individualOppManagerOpenOppCost = model.individualOppManagerOpenOppCost + opp.NU_ADV_Expected_Amount__c;
        model.countedOppIds.add(opp.Id);
    }      
    public static void addIndividualOppManagerClosedAndDeclinedOpportunity(QReportModel model,Opportunity opp) 
    {    
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.NU_ADV_Expected_Amount__c;
        oppModel.Creditdate = opp.ucinn_ascendv2__Expected_Close_Date__c;
        oppModel.Stage = opp.StageName;

          if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }

          //declined 
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_DECLINED)) 
        {
            model.individualOppManagerDeclinedOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.individualOppManagerDeclinedOppCount++;
            model.individualOppManagerDeclinedOppCost = model.individualOppManagerDeclinedOppCost + opp.NU_ADV_Expected_Amount__c;
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_WITHDRAWN)) 
        {
            model.individualOppManagerWithdrawnOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.individualOppManagerDeclinedOppCount++;
            model.individualOppManagerDeclinedOppCost = model.individualOppManagerDeclinedOppCost + opp.NU_ADV_Expected_Amount__c;
        }            
       
        
        model.countedOppIds.add(opp.Id);
    }
    public static void addIndividualOppManagerBookedOpportunity(QReportModel model,Opportunity opp) 
    {    
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.ucinn_ascendv2__Funded_Amount__c;
        oppModel.Fundeddate = opp.ucinn_ascendv2__Funded_Date__c;
        oppModel.Stage = opp.StageName;

          if((opp.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }

            if((opp.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }

             
        //booked
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
        {

            model.individualOppManagerBookedOpps.Add(opp);
            //model.allOpps.add(oppModel);
            model.individualOppManagerClosedOppCount++;
            model.individualOppManagerClosedOppCost = model.individualOppManagerClosedOppCost + opp.ucinn_ascendv2__Funded_Amount__c;
        }
        model.countedOppIds.add(opp.Id);
    }
     //SharedOpportunitiesOpportunities
    public static void addSharedOpenOpportunity(QReportModel model,OpportunityTeamMember opp) 
    {
        if(opp.TeamMemberRole == 'Primary')
           {
              addIndividualOppManagerOpenOpportunity(model, opp.opportunity); 
           }
        else
        {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.opportunity.Name;
        oppModel.Amount = opp.opportunity.NU_ADV_Expected_Amount__c;
        oppModel.Creditdate = opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c;
        oppModel.Stage = opp.opportunity.StageName;
         
        if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        
        //open                
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE )) 
        {
            model.sharedOpportunitiesOpenWaitingForClearanceOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED )) 
        {
            model.sharedOpportunitiesOpenClearanceGrantedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_DENIED )) 
        {
            model.sharedOpportunitiesOpenClearanceDeniedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_PENDING )) 
        {
            model.sharedOpportunitiesOpenPendingOpps.Add(opp); 
            model.allOpps.add(oppModel);
        }
        
        model.sharedOpportunitiesOpenOppCount++;
        model.sharedOpportunitiesOpenOppCost = model.sharedOpportunitiesOpenOppCost + opp.opportunity.NU_ADV_Expected_Amount__c;
        model.countedOppIds.add(opp.opportunity.Id);
        }
    }
    public static void addSharedClosedAndDeclinedOpportunity(QReportModel model,OpportunityTeamMember opp) 
    {   
        if(opp.TeamMemberRole == 'Primary')
           {
              addIndividualOppManagerClosedAndDeclinedOpportunity(model, opp.opportunity); 
           }
        else
        {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.opportunity.Name;
        oppModel.Amount = opp.opportunity.NU_ADV_Expected_Amount__c;
        oppModel.Creditdate = opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c;
        oppModel.Stage = opp.opportunity.StageName;
        
         if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.opportunity.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
          
        //declined
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_DECLINED)) 
        {
            model.sharedOpportunitiesDeclinedOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.sharedOpportunitiesDeclinedOppCount++;
            model.sharedOpportunitiesDeclinedOppCost = model.sharedOpportunitiesDeclinedOppCost + opp.opportunity.NU_ADV_Expected_Amount__c;
        }
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_WITHDRAWN)) 
        {
            model.sharedOpportunitiesWithdrawnOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.sharedOpportunitiesDeclinedOppCount++;
            model.sharedOpportunitiesDeclinedOppCost = model.sharedOpportunitiesDeclinedOppCost + opp.opportunity.NU_ADV_Expected_Amount__c;
        }            
        
        model.countedOppIds.add(opp.opportunity.Id);
        }
    }       
     public static void addSharedBookedOpportunity(QReportModel model,OpportunityTeamMember opp) 
    {   
        if(opp.TeamMemberRole == 'Primary')
           {
              addIndividualOppManagerBookedOpportunity(model, opp.opportunity); 
           }
        else
        {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.opportunity.Name;
        oppModel.Amount = opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
        oppModel.Fundeddate = opp.opportunity.ucinn_ascendv2__Funded_Date__c;
        oppModel.Stage = opp.opportunity.StageName;
        
         if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        
        
        if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
            if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
            if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.opportunity.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
            if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
            }
        }
                 
        //closed
        if(opp.opportunity.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
        {
            model.sharedOpportunitiesBookedOpps.Add(opp); 
            //model.allOpps.add(oppModel);
            model.sharedOpportunitiesClosedOppCount++;
            model.sharedOpportunitiesClosedOppCost = model.sharedOpportunitiesClosedOppCost + opp.opportunity.ucinn_ascendv2__Funded_Amount__c;
        } 
        
        model.countedOppIds.add(opp.opportunity.Id);
        }
    } 
          
    //OtherSolicitedOpportunities
    public static void addOtherSolicitedOpenOpportunity(QReportModel model,Opportunity opp) 
    {     
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.NU_ADV_Expected_Amount__c;
        oppModel.CreditDate = opp.ucinn_ascendv2__Expected_Close_Date__c;
        oppModel.Stage = opp.StageName;

        if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        //open
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_WAITING_FOR_CLEARANCE )) 
        {
            model.otherSolicitedOpenWaitingForClearanceOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_GRANTED )) 
        {
            model.otherSolicitedOpenClearanceGrantedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_CLEARANCE_DENIED )) 
        {
            model.otherSolicitedOpenClearanceDeniedOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_PENDING )) 
        {
            model.otherSolicitedOpenPendingOpps.Add(opp);
            model.allOpps.add(oppModel);
        }
        
        model.otherSolicitedOpenOppCount++;
        model.otherSolicitedOpenOppCost = model.otherSolicitedOpenOppCost + opp.NU_ADV_Expected_Amount__c;
        model.countedOppIds.add(opp.Id);
    }
    public static void addOtherSolicitedClosedandDeclinedOpportunity(QReportModel model,Opportunity opp) 
    {    
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.NU_ADV_Expected_Amount__c;
        oppModel.Creditdate = opp.ucinn_ascendv2__Credit_Date__c;
        oppModel.Stage = opp.StageName;

          if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==1) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==2)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==4) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==5)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==7) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==8)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Expected_Close_Date__c.month()==10) || (opp.ucinn_ascendv2__Expected_Close_Date__c.month()==11)||(opp.ucinn_ascendv2__Expected_Close_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        
       //declined
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_DECLINED)) 
        {
            model.otherSolicitedDeclinedOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.otherSolicitedDeclinedOppCount++;
            model.otherSolicitedDeclinedOppCost = model.otherSolicitedDeclinedOppCost + opp.NU_ADV_Expected_Amount__c;
        }
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_WITHDRAWN)) 
        {
            model.otherSolicitedWithdrawnOpps.Add(opp);
            model.allOpps.add(oppModel);
            model.otherSolicitedDeclinedOppCount++;
            model.otherSolicitedDeclinedOppCost = model.otherSolicitedDeclinedOppCost + opp.NU_ADV_Expected_Amount__c;
        }   
        model.countedOppIds.add(opp.Id);
    }
    public static void addOtherSolicitedBookedOpportunity(QReportModel model,Opportunity opp) 
    {    
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
        oppModel.Amount = opp.ucinn_ascendv2__Funded_Amount__c;
        oppModel.Fundeddate = opp.ucinn_ascendv2__Funded_Date__c;
        oppModel.Stage = opp.StageName;

          if((opp.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
           oppModel.Q3 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            oppModel.Q4 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
           oppModel.Q1 = true;
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
          oppModel.Q2 = true;
        }
        
   if((opp.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
             
        //closed
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
        {
            model.otherSolicitedBookedOpps.Add(opp);  
            //model.allOpps.add(oppModel);
            model.otherSolicitedClosedOppCount++;
            model.otherSolicitedClosedOppCost = model.otherSolicitedClosedOppCost + opp.ucinn_ascendv2__Funded_Amount__c;
        }
        model.countedOppIds.add(opp.Id);
    }
    
    //UnsolictedOpportunities
    public static void addUnsolictedClosedOpportunity(QReportModel model,Opportunity opp) 
    {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = opp.Name;
         if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
        oppModel.Amount = opp.Amount;
        oppModel.Creditdate = opp.ucinn_ascendv2__Credit_Date__c;

            }
         if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
         oppModel.Amount = opp.ucinn_ascendv2__Funded_Amount__c;
         oppModel.Fundeddate = opp.ucinn_ascendv2__Funded_Date__c;

            }
        oppModel.Stage = opp.StageName;
        if(opp.ucinn_ascendv2__Funded_Date__c != null)
            {
          if((opp.ucinn_ascendv2__Funded_Date__c.month()==1) || (opp.ucinn_ascendv2__Funded_Date__c.month()==2)||(opp.ucinn_ascendv2__Funded_Date__c.month()==3))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                oppModel.Q3 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==4) || (opp.ucinn_ascendv2__Funded_Date__c.month()==5)||(opp.ucinn_ascendv2__Funded_Date__c.month()==6))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                oppModel.Q4 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==7) || (opp.ucinn_ascendv2__Funded_Date__c.month()==8)||(opp.ucinn_ascendv2__Funded_Date__c.month()==9))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                oppModel.Q1 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
        else if((opp.ucinn_ascendv2__Funded_Date__c.month()==10) || (opp.ucinn_ascendv2__Funded_Date__c.month()==11)||(opp.ucinn_ascendv2__Funded_Date__c.month()==12))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED)) 
            {
                oppModel.Q2 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.ucinn_ascendv2__Funded_Amount__c;
            }
        }
            }
        if(opp.ucinn_ascendv2__Credit_Date__c != null)
        {
         if((opp.ucinn_ascendv2__Credit_Date__c.month()==1) || (opp.ucinn_ascendv2__Credit_Date__c.month()==2)||(opp.ucinn_ascendv2__Credit_Date__c.month()==3))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q3 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.Amount;
            }
        }
        else if((opp.ucinn_ascendv2__Credit_Date__c.month()==4) || (opp.ucinn_ascendv2__Credit_Date__c.month()==5)||(opp.ucinn_ascendv2__Credit_Date__c.month()==6))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q4 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + opp.Amount;
            }
        }
        else if((opp.ucinn_ascendv2__Credit_Date__c.month()==7) || (opp.ucinn_ascendv2__Credit_Date__c.month()==8)||(opp.ucinn_ascendv2__Credit_Date__c.month()==9))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q1 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.Amount;
            }
        }
        else if((opp.ucinn_ascendv2__Credit_Date__c.month()==10) || (opp.ucinn_ascendv2__Credit_Date__c.month()==11)||(opp.ucinn_ascendv2__Credit_Date__c.month()==12))
        {
            if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q2 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + opp.Amount;
            }
        }
        }
        model.UnsolicitedOpportunities.Add(opp);
        model.unsolicitedClosedOppCount++;
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED))
        model.unsolicitedClosedOppCost = model.unsolicitedClosedOppCost + opp.AMount; 
        if(opp.StageName.equals(ADVOpportunityConstants.STAGE_BOOKED))
        model.unsolicitedClosedOppCost = model.unsolicitedClosedOppCost + opp.ucinn_ascendv2__Funded_Amount__c; 

    }
    
     //third party Opportunities
    public static void addThirdPartyClosedOpportunity(QReportModel model,ucinn_ascendv2__Hard_and_Soft_Credit__c hc) 
    {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = hc.ucinn_ascendv2__Opportunity__r.Name;
         if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
        oppModel.Amount = hc.ucinn_ascendv2__Credit_Amount__c;
        oppModel.Creditdate = hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c;

            }
         
        oppModel.Stage = hc.ucinn_ascendv2__Opportunity__r.StageName;
       
        if(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c != null)
        {
         if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==1) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==2)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==3))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q3 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==4) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==5)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==6))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q4 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==7) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==8)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==9))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q1 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
             }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==10) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==11)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==12))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q2 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        }
        model.ThirdPartyOpportunities.Add(hc);
        model.thirdPartyClosedOppCount++;
        if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED))
        model.thirdPartyClosedOppCost = model.thirdPartyClosedOppCost + hc.ucinn_ascendv2__Credit_Amount__c; 
       

    }
    
     //MG Opportunities
    public static void addMGClosedOpportunity(QReportModel model,ucinn_ascendv2__Hard_and_Soft_Credit__c hc) 
    {
        OpportunityModel oppModel = new OpportunityModel();
        oppModel.Name = hc.ucinn_ascendv2__Opportunity__r.Name;
         if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
         {
        oppModel.Amount = hc.ucinn_ascendv2__Credit_Amount__c;
        oppModel.Creditdate = hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c;
         }
        
        oppModel.Stage = hc.ucinn_ascendv2__Opportunity__r.StageName;
        if(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c != null)
        {
         if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==1) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==2)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==3))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q3 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==4) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==5)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==6))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q4 = true;
                model.Q3Q4dollarsRaised = model.Q3Q4dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==7) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==8)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==9))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q1 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
             }
        }
        else if((hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==10) || (hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==11)||(hc.ucinn_ascendv2__Opportunity__r.ucinn_ascendv2__Credit_Date__c.month()==12))
        {
            if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED)) 
            {
                oppModel.Q2 = true;
                model.Q1Q2dollarsRaised = model.Q1Q2dollarsRaised + hc.ucinn_ascendv2__Credit_Amount__c;
            }
        }
        }
        
        model.MGOpportunities.Add(hc);
        model.MGClosedOppCount++;
        if(hc.ucinn_ascendv2__Opportunity__r.StageName.equals(ADVOpportunityConstants.STAGE_FUNDED))
        model.MGClosedOppCost = model.MGClosedOppCost + hc.ucinn_ascendv2__Credit_Amount__c; 
        

    }
}