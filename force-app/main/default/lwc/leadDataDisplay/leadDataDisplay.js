    import { LightningElement, wire, api } from 'lwc';

    import lccRecords from '@salesforce/apex/LeadDataDisplay.insertLead';
    export default class LeadDataDisplay extends LightningElement {
        
     
      @wire(lccRecords,{clsName:'$lName',clsEmail:'$lEmail',clsCompany:'$lCompany',clsPhone:'$lPhone',clsProduct:'$lProduct',clsQuantity:'$lQuantity'}) lccData;
    //   totScore;
    //   handleScore(event){
    //       this.totScore=event.target.value;
    //   }
      lName;
      handleName(event){
        this.lName=event.target.value;
    }
    lEmail;
    handleEmail(event){
        this.lEmail=event.target.value;
    }
    lCompany;
    handleCompany(event){
        this.Company=event.target.value;
    }
    lPhone;
    handlePhone(event){
        this.lPhone=event.target.value;
    }
    lProduct;
    handleProduct(event){
        this.lProduct=event.target.value;
    }
    lQuantity;
    handleQuantity(event){
        this.lQuantity=event.target.value;
    }

    
      createLead(){
            this.status=true;
      }
    
      @api recordId;
        handleSubmit(event) {
            console.log('onsubmit event recordEditForm'+ event.detail.fields);

    
        }
        handleSuccess(event) {
            console.log('onsuccess event recordEditForm'+ event.detail.id);
        }
    
      
    
    
       
}