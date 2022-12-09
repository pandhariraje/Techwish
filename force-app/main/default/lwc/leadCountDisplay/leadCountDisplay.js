import { LightningElement, track, wire, api } from 'lwc';
import getLeads from '@salesforce/apex/LeadCountDisplay.getLeads'
import {NavigationMixin} from 'lightning/navigation';
export default class LeadCountDisplay extends NavigationMixin (LightningElement) {
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id'}
    ];
 
    @track scoreRecoreId;
    @track leadList;
    count;
    
    @wire (getLeads) lccdata
    ({data,error}){
        if (data) {
             this.leadList = data;
            this.count=[...this.leadList].lenght;
          
        console.log(data); 
        } 
   }      
}