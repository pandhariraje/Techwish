public class SupplierRecordClass {
    public string sn{get;set;}
    public String sphone{get;set;}
    public string sid{get;set;}
    public string semail{get;set;}
    public string sadd{get;set;}
    public Supplier__c scc{get;set;}
    public list<Supplier__c> slist{get;set;}
    public String msg{get;set;}
    
    
    public void  SupplierRecord(){
        scc= [SELECT Id, Name, Supplier_name__c, mno__c, email_Id__c, Address__c FROM Supplier__c where Name=:sn];
    }
    public  void Insertrecord(){
        
        slist = new list<Supplier__c>();
        
        
        Supplier__c a = new Supplier__c();
        
        a.Supplier_name__c = sn;
        a.mno__c = sphone;
        a.email_Id__c = semail;
        a.Address__c = sadd;
        slist.add(a);
        insert slist;
        msg='record insert sucessfully';
    }
}