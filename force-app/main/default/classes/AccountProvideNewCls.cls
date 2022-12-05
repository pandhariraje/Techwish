@RestResource(urlMapping='/accdata/*')
global class AccountProvideNewCls {
    
    global class Acc
    {
        public String Name;
        public String accId;
        public String BillingCity;
        public String Phone;
        public decimal AnnualRevenue;
    }
    
    
    @HttpGet
    global static List<Account> getAccountRecord(){
        List<Account> accList=[SELECT Id, Name, BillingCity, Phone, Industry, AnnualRevenue FROM Account];
        return accList;
        
    }
    
    
    @HttpPost
    global static String insertAccountRecord(){
        RestRequest req=RestContext.request;
        String accBody=req.requestBody.toString();
        Acc ac =(Acc)JSON.deserialize(accBody, Acc.class);
        Account an=new Account();
        an.Name=ac.Name;
        an.BillingCity=ac.BillingCity;
        an.Phone=ac.Phone;
        an.AnnualRevenue=ac.AnnualRevenue;
        insert an;
        return an.Id;
        
    }
    
    @HttpDelete
    global static String deleteAccountRecord(){
        
        
        RestRequest req=RestContext.request;
        String abody=req.requestBody.toString();
        Acc c1=(Acc)JSON.deserialize(abody, Acc.class);
        
        
        Account lacc1=[SELECT Id, Name, BillingCity, Phone, Industry, AnnualRevenue FROM Account where Id=:c1.accId limit 1];
        delete lacc1;
        return 'delete successfully';
        
    }
    @HttpPut
    global static String upsertAccountRecord()
    {
        RestRequest reqw=RestContext.request;
        String sbody=reqw.requestBody.toString();
        
        Acc a1=(Acc)JSON.deserialize(sbody, Acc.class);
        
        integer count=[SELECT count() FROM Account where Id=:a1.accId];
        if(count>0)
        {
            
            Account acc=[SELECT Id, Name, BillingCity, Phone, Industry, AnnualRevenue FROM Account where Id=:a1.accId limit 1];
            acc.Name=a1.Name;
            acc.BillingCity=a1.BillingCity;
            acc.Phone=a1.Phone;
            acc.AnnualRevenue=a1.AnnualRevenue;
            upsert acc;
            
        }else{
            Account acc=new Account();
            acc.Name=a1.Name;
            acc.BillingCity=a1.BillingCity;
            acc.Phone=a1.Phone;
            acc.AnnualRevenue=a1.AnnualRevenue;
            upsert acc;
            
        }
        
        return 'upsert successfully';
    }
    
    @HttpPatch
    global static String updateAccRecord(){
        RestRequest req=RestContext.request;
       String sbody= req.requestBody.toString();
        Acc d1=(Acc)JSON.deserialize(sbody, Acc.class);
         integer count=[SELECT count() FROM Account where Id=:d1.accId];
        if(count>0)
        {
          Account acc=[SELECT Id, Name, BillingCity, Phone, Industry, AnnualRevenue FROM Account where Id=:d1.accId limit 1];
            acc.Name=d1.Name;
            acc.BillingCity=d1.BillingCity;
            acc.Phone=d1.Phone;
            acc.AnnualRevenue=d1.AnnualRevenue;
            upsert acc;
        }
        
        return 'update record';
        
    }
    
}