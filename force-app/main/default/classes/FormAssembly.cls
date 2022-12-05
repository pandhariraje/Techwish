public class FormAssembly
{
    public string userName{get;set;}
    public string password{get;set;}
    public string msg{get;set;}
    public void formAssemblyInsert(){
        FormA__c fa = new FormA__c();
        fa.Username__c= userName;
        fa.Password__c =password;
        INSERT fa;
        system.debug(fa.Username__c);
        system.debug(fa.Password__c);
        msg ='Successfully Logged In';
    }
}