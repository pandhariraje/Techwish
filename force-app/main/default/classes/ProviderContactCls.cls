@RestResource(urlMapping='/getcontact')
global class ProviderContactCls 
{
    global class ContactData{
        public String LastName;
    public String Email;
    public String Phone;
    public String MailingCity;
    }
    @HttpGet
    global static List<Contact> getContactData(){
        List<Contact> conl=[SELECT Id, LastName, Name, Email, Phone, MailingCity FROM Contact];
      /*  List<ContactData> con=new List<ContactData>();
        for(Contact c:conl){
            Contact ct=new Contact();
            ct.LastName=c.lName;
            ct.Email=c.cEmail;
            ct.Phone=c.cMobile;
            ct.MailingCity=c.millingCity;
            con.add(ct);}*/     
        
        return conl;
        
    }
    @HttpPost
    global static Id insertContact(){
        RestRequest req=RestContext.request;
        String body=req.requestBody.toString();
       ContactData con=(ContactData)JSON.deserialize(body, ContactData.class);
        
        Contact co=new Contact();
        co.LastName=con.LastName;
        co.Email=con.Email;
        co.Phone=con.Phone;
        co.MailingCity=con.MailingCity;
        insert co;
        return co.Id;
        
    }

}