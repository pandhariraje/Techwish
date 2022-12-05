@isTest
private class EmployeeProviderClassTest {
        
    /*@isTest
    private static void getEmployeeRecordsTest(){
        Id recordId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestUri = 'https://antra14-dev-ed.my.salesforce.com/services/apexrest/empdata/'+recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        employee__c em = new employee__c();
        employee__c[] emList = new list<employee__C>();
        emlist .add(em);
        // test.startTest();
        EmployeeProviderClass.getEmployeeRecord();
        // test.stopTest();
        // Verify results
        System.assert(emList != null);
        System.assertEquals(emlist, emlist);
    }
    
    
    @isTest
    static void insertEmployeeTest()
    {
        EmployeeProviderClass.Emp1 empObj=new EmployeeProviderClass.Emp1();
        empObj.empName='Pandhari';
        empObj.empCity='Pune';
        empObj.empSal=50000.22;
        String sbody =JSON.serialize(empObj);
        RestRequest request = new RestRequest();
        request.requestUri = '/services/apexrest/empdata/';
        request.httpMethod = 'Post';
        request.requestBody=Blob.valueOf(sbody);
        RestContext.request = request;
        EmployeeProviderClass.insertEmployeeRecord();
    }*/
    
    /*
   @isTest(seeAllData=true)
    private static void deleteEmployeeTest()
    {
        try{
        EmployeeProviderClass.Emp1 empObj=new EmployeeProviderClass.Emp1();
        empObj.empName='rajesh';
        
        String sbody =JSON.serialize(empObj);
        RestRequest request = new RestRequest();
        request.requestUri = '/services/apexrest/empdata/';
        request.httpMethod = 'DELETE';
        request.requestBody=Blob.valueOf(sbody);
        RestContext.request = request;
        //Test.startTest();
        EmployeeProviderClass.deleteEmployee();
        //Test.stopTest();
        List<Employee__c> emps=[select Id from Employee__c where EmpName__c =:empObj.empName];
        system.assert(emps.size()!=0, 'success');
        }
        catch(Exception e){
        
        }
    }*/
    /*@isTest
  Private static void upsertEmployeeTest()
    {
   
        RestRequest request = new RestRequest();
        request.requestUri = '/services/apexrest/empdata/';
        request.httpMethod = 'PUT';
        RestContext.request = request;
          EmployeeProviderClass.Emp1 empObj=new EmployeeProviderClass.Emp1();
        empObj.empId='a065g00000HZQAyAAP';
        
       		empObj.empName='ravi';
        String sbody =JSON.serialize(empObj);
        request.requestBody=Blob.valueOf(sbody);
      //   integer count = [select count() from Employee__c ];
        integer count = [select count() from Employee__c where Id=:empObj.empId];
        boolean b=true;
        if(count>0){
            Employee__c emplc=[SELECT Name, Mobile__c, EmpName__c, City__c, Salary__c FROM Employee__c where Id=:empObj.empId limit 1];
            
            emplc.EmpName__c='Shahid';
            emplc.City__c='Pune';
        }else{
             Employee__c emplc=new Employee__c();
            emplc.EmpName__c='Bharat';
            emplc.City__c='latur';

            
            
        }
      List<Employee__c> emps=[select Id from Employee__c where EmpName__c =:empObj.empName];
        
               EmployeeProviderClass.upsertEmployee(); 
       System.assert(emps.size()!=0, 'success');
       
    }
*/
    @isTest
    private static void upsertRecord(){        
          EmployeeProviderClass.Emp1 e1=new EmployeeProviderClass.Emp1();
        e1.empId='a025i000007wVMPAA2';
        e1.empName='aaaa';
    
        e1.empSal=85698;
        
        string bd = JSON.serialize(e1);
        RestRequest request = new RestRequest();
        request.requestUri = 'services/apexrest/employeedata';
        request.httpMethod = 'PUT'; 
        request.requestBody = Blob.valueOf(bd);
        RestContext.request = request;
        //Test.startTest();
        
        // Test.stopTest();
        /*EmployeeProviders.emp1 emp=new EmployeeProviders.emp1();
        integer count=[Select count() from Employee__c where Name=:emp.Name];
        //if(count>0)            
            // integer count = [select count() from Employee__c where Id=:e1.eid];
            boolean b=true;
            if(count>0||b==true){
                //Employee__c em = new Employee__c();                
                Employee__c empss = [SELECT Id, Employee_Id__c, Mobile__c, Name, City__c, State__c FROM Employee__c where Id='a025i000006C3GdAAK' limit 1];
                //em.Id ='a025i000006C3GdAAK';
                empss.Name = 'pawan';
                empss.City__c = 'ngp';
                empss.State__c = 'mh';
                empss.Mobile__c = '222222222'; 
                upsert empss;                
            } 
        	if(b==true){
                Employee__c ems = new Employee__c();
                ems.Name = 'pawan';
                ems.City__c = 'ngp';
                ems.State__c = 'mh';
                ems.Mobile__c = '222222222'; 
                upsert ems;
                //
            }
        //  Employee__c empss = [SELECT Id, Employee_Id__c, Mobile__c, Name, City__c, State__c FROM Employee__c where Id=: em.Id];
        //upsert empss;*/
      //  Test.startTest();
        
        EmployeeProviderClass.updateMethod();
       // Test.stopTest();
        
    }
    
    /*
    //Helper Method
    public static Id createTestRecord(){
        Employee__c emp=new Employee__c();
        emp.EmpName__c='Navin';
        emp.City__c='Hyderabad';
        emp.Mobile__c='9158040972';
        insert emp;
        return emp.Id;
    }
    */
    
}