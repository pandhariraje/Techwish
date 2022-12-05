@RestResource(urlMapping='/studentdata/*')
global class StudentProviderClass {
    
    global class Stud{
        public String sname;
        public String mobile;
        public String email;
        public String gender;
    }
    @HttpGet
    global static List<Stud> getStudent()
    {
        List<Student__c> stu=[SELECT Id, Name, Email_Id__c, Mobile__c, Gender__c, Student_Name__c FROM Student__c];
        List<Stud> student=new List<Stud>(); 
        for(Student__c s: stu)
        {
            Stud sd=new Stud();
            sd.sname=s.Student_Name__c;
            sd.mobile=s.Mobile__c;
            sd.email=s.Email_Id__c;
            sd.gender=s.Gender__c;
            student.add(sd);
           
        }
        
        return student;
    }
    
    @HttpPost
    global static Id insertRecord()
    {
        RestRequest req=RestContext.request;
        String body=req.requestBody.toString();
        Stud st=(Stud)JSON.deserialize(body, Stud.class);
        Student__c std=new Student__c();
        std.Student_Name__c=st.sname;
        std.Email_Id__c=st.email;
        std.Mobile__c=st.mobile;
        std.Gender__c=st.gender;
        insert std;
        return std.Id;
        
        
    }
    
}