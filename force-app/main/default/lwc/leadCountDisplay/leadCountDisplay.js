import { LightningElement, track, wire } from 'lwc';
import getLeads from '@salesforce/apex/LeadCountDisplay.getLeads'
export default class LeadCountDisplay extends LightningElement {
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id'}
    ];
 
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
   
   // @wire (count) countData;
       
}