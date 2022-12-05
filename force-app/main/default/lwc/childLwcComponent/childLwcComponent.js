import { api, LightningElement } from 'lwc';

export default class ChildLwcComponent extends LightningElement {
   // @api message
    @api fName;

    changeName(event)
    {
        this.fName=event.target.value;
    }

    
   /* @api display(event)
    {
        
    }*/

}