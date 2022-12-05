@isTest
private class EmployeeInsertTest {
    @isTest
    private static void insertRecordTest(){
        /*Employee__c emp=new Employee__c();
        emp.EmpName__c ='jaya';
        emp.City__c = 'HYD';
        emp.Salary__c = 20.044;
        insert emp;*/
        Id i=EmployeeInsert.insertRecord('anil', 'pune', 90.0);
        system.assert(i != null, 'Invalid');
          
    }
}