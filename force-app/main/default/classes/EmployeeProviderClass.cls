@RestResource(urlMapping='/empdata/*')
global class EmployeeProviderClass {
 
   
   global class Emp1//this is inner class
    {
        public String empId;
        public String empName;
        public double empSal;
       public String empCity;
    }
    /*
    @HttpGet//get the all record from this method
    global static List<Emp1> getEmployeeRecord()
    {
        List<Employee__c> emp=[SELECT Name, EmpName__c, Mobile__c, City__c, Salary__c FROM Employee__c];
        List<Emp1> emps=new List<Emp1>();
        for(Employee__c em: emp)
        {
            Emp1 e=new Emp1();
          // e.empId=em.Name;
            e.empName=em.EmpName__c;
            e.empSal=em.Salary__c;
            e.empCity=em.City__c;
            emps.add(e);
        }
        
        return emps;
    }
    @HttpPost
    global static Id insertEmployeeRecord()//inserting the record into object
    {
       RestRequest restReq=RestContext.request;
       String body=restReq.requestBody.toString();
      Object obj  =JSON.deserialize(body, Emp1.class);
      Emp1 e =(Emp1)obj;
      
       // Emp1 e=(Emp1)JSON.deserialize(s, Emp1.class);
        Employee__c emp=new Employee__c();  
        emp.EmpName__c=e.empName;
       
        emp.Salary__c=e.empSal;
        emp.City__c=e.empCity;
        
            insert emp;
           return emp.Id;
    }*/
    
    /*
     * @HttpDelete
    global static void deleteEmployee()//delete the record from object
    {
        RestRequest rreq = RestContext.request;
        string body=rreq.requestBody.toString();
       
        Emp1 e1 = (Emp1)JSON.deserialize(body , Emp1.class);
       
        Employee__c emps = [select Id from Employee__c where EmpName__c =:e1.empName];
        delete emps;
        //return ('Deleted Successfully');
        
    }*/
   /*  @HttpPut
    global static Id upsertEmployeeRecord(String id, String name, String city, double empSal)
    { 
        RestRequest restReq=RestContext.request;
       String s=restReq.requestBody.toString();
        
        Emp1 e=(Emp1)JSON.deserialize(s, Emp1.class);
        Employee__c emp=new Employee__c();  
        emp.EmpName__c=e.empName;
        //emp.Id=e.id;
       
        emp.Salary__c=e.empSal;
        emp.City__c=e.empCity;
        
            upsert emp;
           return emp.Id;
    }*/
  /* @HttpPut
    global static string upsertEmployee() 
    {
       RestRequest rreq = RestContext.request;
        string msg=rreq.requestBody.toString();
        
        Emp1 e1 = (Emp1)JSON.deserialize(msg , Emp1.class);
       
        integer count = [select count() from Employee__c where Id=:e1.empId];
        System.debug(count);
        boolean b=true;
        if(count>0){
            Employee__c em = [SELECT Name, Mobile__c, EmpName__c, City__c, Salary__c FROM Employee__c where Id=:e1.empId limit 1];
            em.EmpName__c = e1.empName;
            em.City__c = e1.empCity;
            
            em.Salary__c = e1.empSal;        
            upsert em;
        }
        else{
            Employee__c em =new Employee__c();
            em.EmpName__c = e1.empName;
            em.City__c = e1.empCity;
            em.Salary__c = e1.empSal;
                 
            upsert em;
        }
        return ('Operation Successfull');
    }
    */
    @HttpPut
    global static void updateMethod() 
    {
        RestRequest rreq = RestContext.request;
        string msg=rreq.requestBody.toString();        
        Emp1 e1 = (Emp1)JSON.deserialize(msg,Emp1.class);
        System.debug(e1.empId);
      
        integer count = [select count() from Employee__c where Id=:e1.empId];
        system.debug(count);
        boolean b=false;
        if(b==false){
            Employee__c em =new Employee__c();
            em.EmpName__c = e1.empName;
            em.City__c = e1.empCity;
            
            em.Salary__c = e1.empSal;        
            upsert em;
        }
        if(count>0||b==false){
            List<Employee__c> em = [SELECT Name, Mobile__c, EmpName__c, City__c, Salary__c FROM Employee__c where Id=:e1.empId];
            System.debug(em[0]);
            em[0].EmpName__c = e1.empName;
            em[0].Salary__c = e1.empSal;

            upsert em[0];
        }    
        //return 'already exsist';
    }
    /*@HttpPatch
    global Static String updateEmployee()
    {
        
        RestRequest request = RestContext.request;
    String empId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
        Account thisAcc = [SELECT Id FROM Account WHERE Id = :empId];

    Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());

    for(String fieldName : params.keySet()) {
    
        thisAcc.put(fieldName, params.get(fieldName));
    }
    update thisAcc;
    return thisAcc.Id;
         RestRequest rreq = RestContext.request;
        string msg=rreq.requestBody.toString();
        
        Emp1 e1 = (Emp1)JSON.deserialize(msg , Emp1.class);
      
        integer count = [select count() from Employee__c where Id=:e1.empId];
        if(count>0){
            employee__c em = [select Name,City__c,Mobile__c from Employee__c where Id=:e1.empId limit 1];
            em.EmpName__c = e1.empName;
            em.City__c = e1.empCity;
            em.Salary__c= e1.empSal;

            update em;
        } else{
            return ('Record Doesnt Exist');
        }
        return ('update Successfull');
       
    }*/
    
}