import { LightningElement, track, wire } from 'lwc';

import fetchData from '@salesforce/apex/RefreshDataAccount.fetchAccountRecords';

const COLO = [{label:"name", fieldName:"name", type:"text"},
              {label:"AnnualRevenue", fieldName:"AnnualRevenue", type:"text"},
              {label:"Amount", fieldName:"Amount", type:"text"}];
 export default class RefreshDataAccount extends LightningElement {
   clm  =COLO;
   @track selectedRecord;
   @track wiredAccounts= [];
   @track accountList= [];
   @track error;
   
   //@wire(getAccounts) accList(result) {
    @wire(fetchData) accList(result){
      this.wiredAccountList = result;

      if (result.data) {
        this.accountList = result.data;
        this.error = undefined;
      } else if (result.error) {
        this.error = result.error;
        this.accountList = [];
      }
    }

    handelSelection(event) {
      if (event.detail.selectedRows.length > 0) {
        this.selectedRecord = event.detail.selectedRows[0].Id;
      }
    }

    deleteRecord() {
      deleteRecord(this.selectedRecord)
        .then(() => {
          refreshApex(this.wiredAccountList);
        })
        .catch(error => {
        })
    }
}