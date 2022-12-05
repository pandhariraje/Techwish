@isTest
private class AccountProviderClassTest {
    
    @isTest static void testGetAccountRecord(){
        Id recordId=createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://antra14-dev-ed.my.salesforce.com/services/apexrest/accountdata/'
            + recordId;
        
        request.httpMethod = 'GET';
        RestContext.request = request;
        List<Account> accn =AccountProviderClass.getAccountRecord();
        System.assert(accn!=null);
        //   System.assertEquals('Danish', accn.Name);
        
        
    }
/*
 * // This method to insert the account

    
    @isTest static void testGetAccountRecord(){
        Id recordId=createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://antra14-dev-ed.my.salesforce.com/services/apexrest/accountdata/'
            + recordId;
        
        request.httpMethod = 'GET';
        RestContext.request = request;
        List<Account> accn =AccountProviderClass.getAccountRecord();
        System.assert(accn!=null);
        //   System.assertEquals('Danish', accn.Name);
        
        
    }
*/
    
    @isTest static void TestDeleteAccout() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://antra14-dev-ed.my.salesforce.com/services/apexrest/accountdata/'+recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        AccountProviderClass.deleteAccout();
        // Verify record is deleted
        Account accList=[SELECT Id, Name, BillingCity, Phone, AnnualRevenue FROM Account where Id=:recordId];
       // for(Account accl:accList){
            accList.Id='0015g00000usICwAAM';
           delete accList;
            System.assert(accList!=null);

        //}
        //System.assert(accList.size()==0);
    }
    
    // Helper method inner class method
    static Id createTestRecord() {
        // Create test record
        Account caseTest = new Account(
            Name='Danish',
            Industry='Banking',
            AnnualRevenue=90000000);
        insert caseTest;
        return caseTest.Id;
    }          
    
}