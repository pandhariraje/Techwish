trigger RestrictDuplicatePhoneAndEmailOnContactTrigger on Contact (before insert,before update) {
  if(trigger.isBefore){
        system.debug('Event before trigger');
        if(trigger.isInsert){
            RestrictDuplicatePhoneAndEmailHandler.checkDuplicatePhone(Trigger.new);
        }
        else if(trigger.isUpdate){
            RestrictDuplicatePhoneAndEmailHandler.checkDuplicatePhone(Trigger.new);
        }
    }
    else if(trigger.isAfter){
        system.debug('trigger after event');   
        
    }  
}