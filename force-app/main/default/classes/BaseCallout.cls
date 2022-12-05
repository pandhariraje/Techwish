public with sharing class BaseCallout {
    public  string endPointurl {get;set;}
    public  string httpMethod {get;set;}
    public  string userName {get;set;}
    public  string userPassword {get;set;}
    public  boolean setCalloutHeaders {get;set;}
    public  string authorizationKey {get;set;}
    public  string namedCredential {get;set;}
    
    private void setHeaders(HttpRequest httpRequest)
    {
        if(string.isNotBlank(namedCredential))
        {  
            httpRequest.setHeader('UserName', '{!$Credential.UserName}');
            httpRequest.setHeader('Password', '{!$Credential.Password}');
        }
        else if(!String.isBlank(authorizationKey)){
            httpRequest.setHeader('Authorization', 'OAuth ' + authorizationKey);        
            httpRequest.setHeader('Authorization', 'Bearer ' + authorizationKey); 
        }
        else if(!String.isBlank(userName) && !String.isBlank(userPassword)){
            httpRequest.setHeader('UserName', userName);
            httpRequest.setHeader('Password', userPassword);
        }
    }
    public HttpResponse callExternalAPI(string body)
    {
        HttpRequest httpRequest = new HttpRequest();
        
        httpRequest.setMethod('GET');
        if(String.isNotBlank(httpMethod))
            httpRequest.setMethod(httpMethod);
        
        httpRequest.setEndpoint(endPointurl);   
        
        if(setCalloutHeaders)
        {
            setHeaders(httpRequest);
        }        
        if(string.isNotBlank(body)){
            httpRequest.setBody(body);
            httpRequest.setHeader('Content-Length',string.valueOf(body.length()));
        }        
        httpRequest.setTimeout(120000);       
        httpRequest.setHeader('Accept-Encoding','gzip, deflate');        
        httpRequest.setCompressed(true);        
        HttpResponse httpResponse = new Http().send(httpRequest);      
        return httpResponse;
    }
}