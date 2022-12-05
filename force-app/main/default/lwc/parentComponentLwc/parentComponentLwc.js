import { api, LightningElement } from 'lwc';

export default class ParentComponentLwc extends LightningElement {
    
    constructor(){
        super()
        console.log("constructor callback called");
        
    }
    connectedCallback(){
        console.log("connected callback is called");
       
    
    }
    renderedCallback()
    {
        console.log("rendered callback is called");

    }
    isChildVisible=false;
    handleClick(event){
        this.isChildVisible=!this.isChildVisible;

    }

}