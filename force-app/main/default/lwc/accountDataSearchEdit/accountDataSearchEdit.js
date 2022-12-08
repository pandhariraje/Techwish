    import { LightningElement, track, wire } from 'lwc';
    import getAccounts from '@salesforce/apex/AccountDataEditSearch.searchAccountNameMethod';
    import { createRecord } from 'lightning/uiRecordApi';

    const DELAY = 100;
    

    export default class AccountDataSearchEdit extends LightningElement {

        accountName = '';
        accountPhone = '';
        accountWebsite = '';
        accountIndustry = '';
        accountDescription = '';
      @track accountList= [];
      @wire (getAccounts,{
            accStrName:'$accountName',
            accStrPhone:'$accountPhone',
            accStrWebsite:'$accountWebsite',
            accStrIndustry:'$accountIndustry',
            accStrDescription:'$accountDescription'
         })
      retrieveAccounts({error, data}){
          if(data){
              this.accountList=data;          
          }
          else if(error){
    
          }
          
      }
    
    
      searchAccountAction(event){
          //this.accountName = event.target.value;
          const searchString = event.target.value;
          window.clearTimeout(this.delayTimeout);
          this.delayTimeout = setTimeout(() => {
              this.accountName = searchString; 
          }, DELAY);
      }
    

}