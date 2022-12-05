import { LightningElement } from 'lwc';

export default class ChildComponentLwc extends LightningElement {
    constructor(){
        super()
        console.log("this is child component callback");

    }
    connectedCallback(){ 
        console.log("Child connectedCallback called")        
    }
    renderedCallback(){ 
        console.log("Child renderedCallback called")
    }
    disconnectedCallback(){
        console.log("this is disconnected callback!!");
        alert("this is disconnected callback");
    }
}