public with sharing class LeadDataDisplay {
  
   @AuraEnabled()
    public static Lead displayLeadData(Decimal scValue){


      Lead ls=[SELECT Id, Name, Company, Phone, Email, Product__c, Quantity__c, Score__c,scoreValue__c FROM Lead WHERE scoreValue__c=:scValue];
     
      ls.scoreValue__c=scValue;
        
      if(ls.Score__c>1 && ls.Score__c<200) {
         scValue=10.0;
      
      } else if(ls.Score__c<201 && ls.Score__c>500){
         scValue=20.0;
      }
      else if(ls.Score__c<501 && ls.Score__c>700){
         scValue=30.0;
      }
      else if(ls.Score__c<701 && ls.Score__c>1000){
         scValue=40.0;
      }
      insert ls;
         
    
      return ls;

   }
    
}
