public class SOSLControllerCls {
    public List<Account> accl{get;set;}//assign
    public List<Contact> conl{get;set;}
    public List<Opportunity> opl{get;set;}
    public String searchString{get;set;}
    
    public SOSLControllerCls(){
        
    }

    public void displayRecord(){
        accl=new List<Account>();//object creation
        conl=new List<Contact>();
        opl=new List<Opportunity>();
        if(searchString.length() > 1){//condition checking record exit or not
            String searchString1='*'+searchString+'*';
           // String s=['Find \' '+searchString1+'\'in all fields returning Account(Id,name)'];
           String searchQuery='Find \''+searchString1+'\'in all fields returning Account (Id, Name, type), Contact(name, email), Opportunity(name, stagename)';
      		
            List<List<sObject>> searchList=search.query(searchQuery);
            accl=((List<Account>)searchList[0]);
            conl=((List<Contact>)searchList[1]);
            opl=((List<Opportunity>)searchList[2]);
            if(accl.size()==0 && conl.size()==0 && opl.size()==0)
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Sorry no result found'));
                return;
            }
        } else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'please enter at least two charactor'));
            return;
        }
       
    }
}