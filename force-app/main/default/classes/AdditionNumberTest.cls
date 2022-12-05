@isTest
private class AdditionNumberTest {
    @testVisible public integer i=20;

    @isTest
    private static integer getAdd(){
       //@testVisible public integer i=20;
        integer p=AdditionNumber.add(80,90);
        System.assert(p==170, 'invalid value is ');
        return p;
    }
    
}