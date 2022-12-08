public with sharing class LeadCountDisplay {
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
    return [SELECT Id, Name,Company, Phone,Email,Product__c,Quantity__c,Score__c FROM Lead LIMIT 5];
    }
    @AuraEnabled(cacheable=true)
    public static integer getLead() {
    return [SELECT count() FROM Lead];
    }
     
    @AuraEnabled
    public static void deleteSelectedContacts(List<Lead> leadLst) {
        delete leadLst;
    }
    // @AuraEnabled(cacheable=true)
    // public static List<Lead> count() {
    // Lead ls=[SELECT COUNT() from Lead];
    // return ls;
    // }
  }