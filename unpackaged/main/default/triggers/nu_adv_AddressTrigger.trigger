trigger nu_adv_AddressTrigger on ucinn_ascendv2__Address__c (before insert, before update) {
    
    if(trigger.isInsert || trigger.isupdate ){
        nu_adv_AddressTriggerHandler.updatePreferredCountryName(Trigger.New);
    }
}