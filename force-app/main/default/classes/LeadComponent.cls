public with sharing class LeadComponent {
        @AuraEnabled
        public static Lead leadData(String cname,String cphone,String cemail, String lcompany,Integer cproduct,Integer cquantity){
            Lead lobj=new Lead();
            lobj.LastName=cname;
           // lobj.Name=sname;
            lobj.Phone=cphone;
            lobj.Email=cemail;
            lobj.Company=lcompany;
            lobj.Product__c=cproduct;
            lobj.Quantity__c=cquantity;


          insert lobj;
          return lobj;
        }
    
 }
 