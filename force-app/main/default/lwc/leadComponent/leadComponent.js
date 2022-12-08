import { LightningElement, track} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import saveLead from '@salesforce/apex/LeadComponent.leadData';
import {NavigationMixin} from 'lightning/navigation';
export default class LeadComponent extends NavigationMixin (LightningElement){
    

    @track scoreObjName;
    @track scoreObjPhone;
    @track scoreObjEmail;
   
    @track scoreObjCompany;
    @track scoreObjProduct;
    @track scoreObjQuantity;
   // @track scoreObjScore;
    @track scoreRecoreId;
    @track errorMsg;

   scoreHandleChange(event){
        if(event.target.name == 'sname'){
        this.scoreObName = event.target.value;  
        //window.console.log('scoreObName ##' + this.scoreObName);
        }
        
      if(event.target.name == 'sphone'){
        this.scoreObjPhone = event.target.value;  
      }
      if(event.target.name == 'semail'){
        this.scoreObjEmail = event.target.value;  
      }

      if(event.target.name == 'scoreCompany'){
        this.scoreObjCompany = event.target.value;  
      }
      if(event.target.name == 'sproduct'){
        this.scoreObjProduct = event.target.value;  
      }
      if(event.target.name == 'squantity'){
        this.scoreObjQuantity = event.target.value;  
      }
     


 }

 submitAction(){
  saveLead({sname:this.scoreObName,semail:this.scoreObjEmail,sphone:this.scoreObjPhone,scoreCompany:this.scoreObjPhone,sproduct:this.scoreObjProduct,scoreObjQuantity:this.squantity})
    .then(result=>{
        this.scoreRecoreId = result.Id;
        window.console.log('scoreRecoreId#Pandhari ' + this.scoreRecoreId);       
        const toastEvent = new ShowToastEvent({
            title:'Success!',
            message:'Record created successfully',
            variant:'success'
          });
          this.dispatchEvent(toastEvent);

          /*Start Navigation*/
          this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.scoreRecoreId,
                objectApiName: 'Lead',
                actionName: 'view'
            },
         });
         /*End Navigation*/

    })
    .catch(error =>{
       this.errorMsg=error.message;
       window.console.log(this.error);
    });

 }

}