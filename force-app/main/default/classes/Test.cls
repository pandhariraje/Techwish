public class Test {
    public static integer i=20;
    public static integer j=20;
    public integer d;  
    public Test()//constructr
    {
        d=i+j;
    }
    public void display()//instance  method
    {
        d=i+j;
    }
     public Static void disp() //static method
    {
        Test t=new Test();//istance variable can not call in static method 
        //first we create the object and call instance by using object ref
        t.d=i+j;
        
    }
    public void calculate()
    {
        
    }
    

}