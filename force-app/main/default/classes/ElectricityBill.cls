public class ElectricityBill {
    
    public decimal unit{get;set;}
    public decimal bill{get;set;}
    public void calculateBill(decimal unit)
    {
        if(unit<=50)
        {
            bill=unit*0.50;
        }
        else if(unit>51 && unit<=150)
        {
            bill=(50*0.50)+((unit-50)*0.75);
            
        }
        else if(unit>151 && unit<=250)
        {
            bill=((50*0.50)+(100*0.75))+((unit-150)*1.20);
        }
        else if(unit>250)
        {
            bill=((50*0.50)+(100*0.75)+(100*1.20))+((unit-250)*1.50);
        }
       double totalBill=bill+(bill*0.20);
       // double bills=bill/100;
        System.debug('total bill of electricity '+totalBill);
      
    }

}