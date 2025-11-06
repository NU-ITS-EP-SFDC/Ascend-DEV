public class ScheduleToSetStageOfReadiness implements Schedulable{
    public void execute(SchedulableContext SC) {
        try{
            Date olderThan12Months = system.today().addMonths(-12);
            Date olderThan6Months = system.today().addMonths(-6);
            String propStageName = 'Booked';
            String accRecordtype = 'Household';
            String stageOfReadiness = 'Stewardship';
            List<Opportunity> bookedOppList = [Select id, ucinn_ascendv2__Proposal__c, ucinn_ascendv2__Proposal__r.AccountId from Opportunity where ((RecordType.DeveloperName = 'Gift' AND ucinn_ascendv2__Credit_Date__c =: olderThan12Months) OR (RecordType.DeveloperName = 'Pledge' AND ucinn_ascendv2__Last_Payment_Date_Roll_Up__c =: olderThan6Months AND ucinn_ascendv2__Remaining_Amount_Due_Formula__c = 0)) AND ucinn_ascendv2__Proposal__c != null];
            List<Account> accListToUpdate = new List<Account>();
            Set<Id> accountIds = new Set<Id>();
            Set<Id> proposalIds = new Set<Id>();
            for(Opportunity opp : bookedOppList){
                proposalIds.add(opp.ucinn_ascendv2__Proposal__c);
            }
            System.debug('bookedOppList=>'+bookedOppList);
            for(Opportunity prop : [Select id, AccountId from Opportunity where id IN: proposalIds AND StageName =: propStageName AND Amount >= 50000 AND Account.RecordType.DeveloperName =: accRecordType AND Account.ucinn_ascendv2__Stage_of_Readiness__c =: stageOfReadiness AND Account.ucinn_ascendv2__PRM__c != null AND Account.ucinn_ascendv2__Stage_of_Readiness_LastModifiedDate__c	<=: olderThan6Months]){
                if([Select COUNT() from Opportunity where RecordType.DeveloperName = 'Proposal' AND AccountId =: prop.AccountId AND CreatedDate >: prop.CreatedDate AND Amount >= 50000] == 0){
                	accListToUpdate.add(new Account(Id=prop.AccountId, ucinn_ascendv2__Stage_of_Readiness__c='Cultivation', ucinn_ascendv2__Stage_of_Readiness_LastModifiedDate__c = system.today()));
                	accountIds.add(prop.AccountId);                    
                }
            }
            System.debug('accountIds => '+accountIds);
            update accListToUpdate;
        }catch(Exception ex){
            System.debug('Exception : '+ex.getMessage());
        }
    }

}