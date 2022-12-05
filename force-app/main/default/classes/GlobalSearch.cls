public class GlobalSearch {
        public List<Account> accl{get;set;}
    public List<Contact> conl{get;set;}
    public List<Opportunity> opl{get;set;}
    Public static void accConOppoSearch(){
        
        list<Sobject[]> ObjList =[FIND 'Test*' IN ALL FIELDS RETURNING account(ID, Name, Rating, Industry, Annualrevenue, Phone, fax), contact(Id, firstname, lastname, title, phone, fax, email), Opportunity(id, name, stagename, amount, closedate)];
     // List<List<sObject>> listOfSobjects = search.query(ObjList);
      //  account[]acclist =(account[])listOfSobjects[0];
      //  contact[]conlist =(contact[])listOfSobjects[1];
     //   Opportunity[]Oppolist =(Opportunity[])listOfSobjects[2];
       
    }
}