@RestResource(urlMapping='/accountdata/*')
global class AccountProviderClass {

    global class AccountWraper{
        public String name;
    public String BillingCity;
    public String Phone;
    
    }
    
    @HttpGet
    global static List<Account> getAccountRecord()
    {
        List<Account> emp=[SELECT Name, LastName, Type, BillingCity, Phone FROM Account];
        
        return emp;
    }
    @httpDelete
    global static void deleteAccout(){
        
         RestRequest request = RestContext.request;
        String accId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        AccountWraper aw=(AccountWraper)JSON.deserialize(accId, AccountWraper.class);
        Account aw1=new Account();
        aw1.Name=aw.name;
        aw1.BillingCity=aw.BillingCity;
        Account thisAcc = [SELECT Id FROM Account WHERE Name=:aw.name];
        delete thisAcc;
    }
     @HttpPut
    global static Id upsertEmployeeRecord(String id, String name, String BillingCity, String Phone)
    {
       RestRequest restReq=RestContext.request;
       String s=restReq.requestBody.toString();
        
      //  Emp1 e=(Emp1)JSON.deserialize(s, Emp1.class);
        Account acc=new Account(Name=name,Id=id,
                                BillingCity=BillingCity,
                                Phone=Phone);  
      
        
            upsert acc;
           return acc.Id;
    }
    
    
    
    
}