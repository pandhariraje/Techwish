public class RestrictDuplicatePhoneAndEmailHandler {
      public static void checkDuplicatePhone(List<Contact> conObjItem){
        
        Map<String,String> conMapItem=new Map<String,String>();
        set<String> accStr=new set<String>();
        for(Contact con:conObjItem){
            if(con.AccountId!=null)
                accStr.add(con.AccountId);
        }
        
        for(Contact con:[select Id,Name,Phone,AccountId from Contact where AccountId=:accStr]){
            conMapItem.put(con.Phone,con.AccountId);
        }
        for(Contact con:conObjItem){
            if(!conMapItem.isEmpty() &&  conMapItem.containskey(con.Phone)){
                con.addError('Do not allow duplicate Phone number, this phone number is alread exist on related account');
            }
        }
        
    }
    
}