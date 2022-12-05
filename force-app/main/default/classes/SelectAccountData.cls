public with sharing class SelectAccountData {
    @AuraEnabled(cacheable=true)
    public static  List<Account> selectRecord(){
      List<Account> acc=[select Id, Name, AnnualRevenue,BillingCity from Account WITH SECURITY_ENFORCED];
      return acc;
    }
   
}