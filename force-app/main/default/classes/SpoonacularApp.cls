public with sharing class SpoonacularApp {
    @AuraEnabled(cacheable=true)
    public static string getRecipe(string prot,string carb)
    {
        // string prot;
        // string carb;
        string msg='';
        Http h = new Http();
        HttpRequest hreq=new HttpRequest();
        hreq.setEndpoint('https://api.spoonacular.com/recipes/findByNutrients?apiKey=50b55b2fbaff4aff89fa0995de37adc4&minCarbs='+carb+'&minProtein='+prot);
        hreq.setMethod('GET');
        HttpResponse hres=h.send(hreq);
        integer rescode=hres.getStatusCode();
        
        If(rescode==200)
        {
            msg = hres.getBody();
        }
        return msg;
    }
}