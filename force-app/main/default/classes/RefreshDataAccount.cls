public with sharing class RefreshDataAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccountRecords(){
        
            
            List<Account> accList=[SELECT Id, Name, BillingCity, AnnualRevenue, Rating FROM Account limit 10];
            return accList;
       
    }
   
 
}