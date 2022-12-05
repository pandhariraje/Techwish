public class InsertSupplierClass {

    public String sName{get;set;}
    public String email{get;set;}
    public String mobile{get;set;}
        public String addre{get;set;}
    public Supplier__c sp{get;set;}
    public List<Supplier__c> lsp{get;set;}
    public String msg{get;set;}
    
    
    
    public void insertSupplierRecord()
    {

     Supplier__c sp=new Supplier__c();
        sp.Supplier_name__c=sName;
        sp.email_Id__c=email;
        sp.mno__c=mobile;
        sp.Address__c=addre;
        insert sp;
           msg='record insert sucessfully';
        
    }
    public void displaySupplier()
    {
        
    }
}