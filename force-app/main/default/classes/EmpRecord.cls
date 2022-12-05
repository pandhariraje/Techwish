@RestResource(urlMapping='/getemp/*')
global class EmpRecord 
{
    global class Emp
    {
        public String empId;
        public String ename;
        public String mobile;
        public String ecity;
        public decimal esal;
        
    }
   
    
   @HttpGet
    global static List<Emp> getEmpData()
    {
        List<Employee__c> empList=[SELECT Id, Name, EmpName__c, Mobile__c, City__c, Salary__c FROM Employee__c];
        List<Emp> emp=new List<Emp>();
        for(Employee__c emt:empList)
        {
            Emp em=new Emp();//new object for comapring the data to custon object Employee__c 
            em.ename=emt.EmpName__c;
            em.mobile=emt.Mobile__c;
            em.ecity=emt.City__c;
            em.esal=emt.Salary__c;
            emp.add(em);
        }
        return emp;
        
    }  
    
    @HttpDelete
    global static Id deleteEmployeeRecord(){
        RestRequest req=RestContext.request;
        String body=req.requestBody.toString();
        Emp e1=(Emp)JSON.deserialize(body, Emp.class);
        
        Employee__c emd=new Employee__c();
        emd.Id=e1.empId;
        emd.EmpName__c=e1.ename;
        emd.Mobile__c=e1.mobile;
        emd.City__c=e1.ecity;
        emd.Salary__c=e1.esal;
        Employee__c emps=[SELECT Id, Name, EmpName__c, Mobile__c, City__c, Salary__c FROM Employee__c where EmpName__c=:e1.ename];
        
        
        delete emps;
        return emps.Id;
        
        
    }
    //inserting the data into employee object
    @HttpPost
    global static Id insertEmployeeRecord(){
        RestRequest hreq=RestContext.request;
        String ebody= hreq.requestBody.toString();
        Emp em=(Emp)JSON.deserialize(ebody, Emp.class);
        //create the object to mapping the vriable
        Employee__c employee=new Employee__c();
        employee.EmpName__c=em.ename;
        employee.Mobile__c=em.mobile;
        employee.City__c=em.ecity;
        employee.Salary__c=em.esal;
        insert employee;
        
        return employee.Id;
        
    }
    
    
    //update and inserting the data in object
    
    @HttpPut
    global static String upsertEmployeeRecord()
    {
        RestRequest req=RestContext.request;
        String eBody=req.requestBody.toString();
        Emp e2=(Emp)JSON.deserialize(eBody, Emp.class);
        
        
        //create the object to retrive data
        integer count = [select count() from Employee__c where Id=:e2.empId];
        if(count>0){
            Employee__c employeeLi=[SELECT Id, Name, EmpName__c, Mobile__c, City__c, Salary__c FROM Employee__c where Id=:e2.empId];
            employeeLi.EmpName__c=e2.ename;
            employeeLi.Mobile__c=e2.mobile;
            employeeLi.City__c=e2.ecity;
            employeeLi.Salary__c=e2.esal;
            upsert employeeLi;             
            
        }
        else{
            Employee__c emp2=new Employee__c();
            emp2.EmpName__c=e2.ename;
            emp2.Mobile__c=e2.mobile;
            emp2.City__c=e2.ecity;
            emp2.Salary__c=e2.esal;
            upsert emp2;   
            
        }
        
        return 'operation successfully';
    }
}