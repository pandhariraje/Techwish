public  class Calculate_Annual_Batch_cls implements Database.Batchable<sObject>,Database.Stateful  {
    decimal totalAnnualRevenue=0.0;
    
    public  Database.QueryLocator  start(Database.BatchableContext bc) {
               String accQuery='SELECT Id, Name, AnnualRevenue FROM Account where AnnualRevenue!=null';
            // String accQuery='SELECT Id, Name, AnnualRevenue FROM Account AnnualRevenue!=null';
        
      return Database.getQueryLocator(accQuery);
        
    }
    public void execute(Database.BatchableContext BC, List<sObject> accl){
        if(!accl.isEmpty())
        {
            for(sObject sc:accl)
            {
               Account acs =(Account)sc;
                totalAnnualRevenue+=acs.AnnualRevenue;
                  
            }
        }
        
    }
    public  void finish(Database.BatchableContext BC){
        System.debug('Batch calculate job id '+BC.getJobId());
         System.debug('total annual revenue ='+totalAnnualRevenue);
        
    }

}