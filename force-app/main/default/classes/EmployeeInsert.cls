public class EmployeeInsert {
    
    public String ename, city;
    public decimal esal;
    public static Id insertRecord(String ename, String city, decimal esal){
       // List<Employee__c> lemp=new List<Employee__c>();
        
        Employee__c emp=new Employee__c();
        emp.EmpName__c=ename;
        emp.City__c=city;
        emp.Salary__c=esal;
        insert emp;
        return emp.Id;      
    }

}