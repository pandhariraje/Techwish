public with sharing class EmployeePage {
    @AuraEnabled//Get Account Records
    public static String getEmployeeList(Integer pageSize, Integer pageNumber){
        String jsonDT = '';
         
        //Offset for SOQL
        Integer offset = (pageNumber - 1) * pageSize;
         
        //Total Records
        Integer totalRecords = [SELECT COUNT() FROM Employee__c];
        Integer recordEnd = pageSize * pageNumber;
       // Employee__c emp=new Employee__c();
        EmployeeWrapper objDT =  new EmployeeWrapper();  
        objDT.pageSize = pageSize;
        objDT.pageNumber = pageNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        objDT.employees = [SELECT Id, Name FROM Employee__c LIMIT :pageSize OFFSET :offset];
        jsonDT = JSON.serialize(objDT);
        return jsonDT;
    }
     
    public class EmployeeWrapper {
        public Integer pageSize {get;set;}
        public Integer pageNumber {get;set;}
        public Integer totalRecords {get;set;}
        public Integer recordStart {get;set;}
        public Integer recordEnd {get;set;}
        public List<Employee__c> employees {get;set;}
    }
}