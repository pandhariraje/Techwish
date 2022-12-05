public class InsertRecordStudentClass {
    
    public Student__c scc{get;set;}
    public String sName{get;set;}
    public decimal marks{get;set;}
    
    public String emailEmp{get;set;}
    public String msg{get;set;}
    
  
    
    public void insertStudentRecord()
    { 
        // scc=[SELECT Id, Name, Student_Name__c, Marks__c, Email_Id__c FROM Student__c];
 			Student__c scc=new Student__c();
        
        scc.Student_Name__c=sName;
        scc.Marks__c=marks;
        scc.Email_Id__c=emailEmp;
        insert scc;
        msg='record insert sucessfully';
    }
    
}