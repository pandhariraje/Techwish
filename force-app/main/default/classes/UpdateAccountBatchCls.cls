public class UpdateAccountBatchCls implements Database.Batchable<Sobject>{
   
   Public Database.QueryLocator start(Database.BatchableContext bc)
   {
      return Database.getQueryLocator('Select Type, Industry from Account');
   }

   Public void execute(Database.BatchableContext bc, List<Account> AccList)
   {
      for(Account a : AccList){
         if(a.Type =='Personal'){
            a.Industry = 'Household';
         }
      }
     update AccList;
   }

  Public void finish(Database.BatchableContext bc){

  }
}