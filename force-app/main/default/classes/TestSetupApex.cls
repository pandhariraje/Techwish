@isTest
public class TestSetupApex {
    @testSetup
    private static void setup(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<2;i ++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
            accList.add(acc);
        }
        insert acclist;
     }
    
    @isTest
    private static void method1()
    {
        Account acc1 = [SELECT Id, Name, Phone FROM Account WHERE Name ='Test0'];
        acc1.Phone = '123456';
        update acc1;
        
        Account acc2 = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Test1'];
        delete acc2;
    }
    
    @isTest
    private static void method2()
    {
        Account acc1 = [SELECT Id, Name, Phone FROM Account WHERE Name ='Test0'];
        System.assertEquals(null, acc1.Phone);
    }
}