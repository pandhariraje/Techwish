@isTest
private class CalCulateAnnualRevenueClsTest {

    @isTest
    private static void testCalculate()
    {
        Account address=new Account();
        address.AnnualRevenue=90000000;
        insert address;
     
        CalCulateAnnualRevenueCls cd=new CalCulateAnnualRevenueCls();
        Id jobId=Database.executeBatch(cd, 5);
        System.assert(address.AnnualRevenue!=null, 'msg');
    }
}