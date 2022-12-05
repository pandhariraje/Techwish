public class NetBalanceClass {
    public string accno{get;set;}
     public string accountName{get;set;}
     public decimal currentbal{get;set;}
     public decimal trasactionbal{get;set;}
     public decimal netbalance{get;set;}
        
       public void depositAmount(){
        netbalance=currentbal+trasactionbal;
         currentbal=netbalance;
    }
     public void withdraw(){
        netbalance=currentbal-trasactionbal;
        currentbal=netbalance;
    }
 
}