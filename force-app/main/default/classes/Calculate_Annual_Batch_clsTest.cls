@isTest
public class Calculate_Annual_Batch_clsTest {
    @isTest
    public Static void testBatchExecuteMethod(){
        Account a = new Account(Name = 'John Smith',AccountSource = 'Web',AnnualRevenue = 100000,Type = 'Personal');
        insert a;
     //   Test.startTest();
        Calculate_Annual_Batch_cls batchTest = new Calculate_Annual_Batch_cls ();
        Id jobid = Database.executeBatch(batchTest);
      //  Test.stopTest();
    }
}