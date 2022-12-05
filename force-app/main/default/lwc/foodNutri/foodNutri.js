import { api, LightningElement, track } from 'lwc';
import getFoodNutrition from '@salesforce/apex/FoodService.getFoodNutrition';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'; // import toast message event .
export default class FoodNutri extends LightningElement {
    @track fruit = '';
    @api show = false;
    @api fruitInfo;
    get options() {
        return [
            { label: 'Orange', value: 'orange' },
            { label: 'Apple', value: 'apple' },
            { label: 'Apricot', value: 'apricot' },
            { label: 'Avocado', value: 'avocado' },
            { label: 'Other', value: 'other' },
        ];
    }
    handleChange(event) {
        this.fruit = event.detail.value;
        if(this.fruit=='other')
            this.show=true;
        else
            this.show=false; 
    }
    handleClick(event)
    {
        if(this.fruit=='other')
        {
            var inp= this.template.querySelector(`[data-id="fruitName"]`);
            this.fruit=inp.value;
            
           
        }
        if(this.fruit=='')
        {
            new ShowToastEvent({
                title: 'Select or enter fruit',
                variant: 'error',
            });
            return;
        }
        getFoodNutrition({foodName:this.fruit})
        .then(result => {
          this.fruitInfo=result;
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error while sending messages',
                    message: error.message,
                    variant: 'error',
                }),
            );
        });
    }
}