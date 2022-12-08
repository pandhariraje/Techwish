public with sharing class LeadComponent {
        @AuraEnabled
        public static Lead leadData(String score,String sname,String sphone,String semail, String scompany,Integer sproduct,Integer squantity,Integer lscore){
            Lead lobj=new Lead();
           // lobj.Name=sname;
            lobj.Phone=sphone;
            lobj.Email=semail;
            lobj.Company=scompany;
            lobj.Product__c=sproduct;
            lobj.Quantity__c=squantity;


          insert lobj;
          return lobj;
        }
    
 }
 