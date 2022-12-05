public class DemoClass {
   integer basicSalary=20000;
    integer providentFund=1800;
    integer professionalTax=200;
    
  public void displayCalCulate()
    {
        double hra=basicSalary*0.25;
        double da=basicSalary*0.10;
        double grossSalary=basicSalary+hra+da;
        System.debug('gross Salary of employee '+grossSalary);
        double incometax=basicSalary*0.15;
        double netSalary=grossSalary-(providentFund+professionalTax+incometax);
        System.debug('net salary of employee '+netSalary);
        
        
    }

}