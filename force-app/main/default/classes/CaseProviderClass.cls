@RestResource(urlMapping='/casedata/*')
global class CaseProviderClass {
    @HttpGet
    global static Case getRecordById()
    {
        RestRequest reRq=RestContext.request;
        
        return null;
    }

}