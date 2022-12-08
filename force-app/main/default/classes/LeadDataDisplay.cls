public with sharing class LeadDataDisplay {
    // public LeadDataDisplay(){

    //     Integer count=[Select COUNT() from Lead limit 5];
    // }
    

    public static void insertLead(Integer score,Integer scoreValue,string clsName,string clsEmail,string clsCompany,string clsPhone,integer clsProduct,integer clsQuantity){

        
 
       Lead leadata = new Lead();
       //leadata.Name=clsName;
        leadata.Email=clsEmail;
        leadata.Company=clsCompany;
        leadata.Product__c=clsProduct;
        leadata.Quantity__c=clsQuantity;
        
        insert leadata;
        
        Lead lstLead=[SELECT Id, Name, Company, Phone, Email, Product__c, Quantity__c,scoreValue__c, Score__c FROM Lead Where Id=:leadata.id];

/*   
 if(lstLead.Score__c>1 && lstLead.Score__c<200)
 {
    scoreValue__c='D';
 }
 else  if(lstLead.Score__c<201 && lstLead.Score__c>500)
 {
    scoreValue__c='C';
 }
 else  if(lstLead.Score__c<501 && lstLead.Score__c>700)
 {
    scoreValue__c='B';
 }
 else  if(lstLead.Score__c<701 && lstLead.Score__c>1000)
 {
    scoreValue__c='A';
 }
 */
 //return lstLead;

    }
}
