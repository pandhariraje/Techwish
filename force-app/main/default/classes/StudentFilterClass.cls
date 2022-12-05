public class StudentFilterClass 
{
    List<Student__c> stuList=new List<Student__c>();
    public StudentFilterClass(){
          stuList = [SELECT Id, Student_Name__c, Marks__c, Email_ID__c FROM Student__c];
    }
    Public void studentFilteredData(){
    for(Student__c sc : stuList){
        if((sc.Student_Name__c.startsWith('v') || sc.Marks__c >= 70 ) && (sc.Email_ID__c.endsWith('yahoo.com'))){
            system.debug('Filted'+sc);
        }
    }
}
}