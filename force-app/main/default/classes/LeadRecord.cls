public with sharing class LeadRecord {
    @AuraEnabled(cacheable = true)
    public static List<Lead> fetchLeads() {
        return [ SELECT Id, Name, Email, Phone FROM Lead order by Name asc limit 15];    
    }
    @AuraEnabled
    public static void deleteSelectedContacts(List<Lead> leadLst) {
        delete leadLst;
    }
}
