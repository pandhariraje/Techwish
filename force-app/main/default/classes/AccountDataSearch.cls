public with sharing class AccountDataSearch {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpps( String searchKey, String sortBy, String sortDirection) {
       
        String query = 'SELECT Id, Name,Phone from Account';
        system.debug('query---'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
        if ( sortBy != null && sortDirection != null ) {
            query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
        }
        query = query + ' LIMIT 10';
        return Database.query( query );
    }
}
