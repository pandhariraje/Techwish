import { api, LightningElement, wire } from 'lwc';
import getCount from '@salesforce/apex/LeadCountDisplay.getLead'
export default class LeadChild extends LightningElement {
    @wire(getCount) count;


    @api leadDataCount;

    sendChild()
    {
        this.leadDataCount=count;
        this.dispatchEvent(new CustomEvent('slead'));
    }

}