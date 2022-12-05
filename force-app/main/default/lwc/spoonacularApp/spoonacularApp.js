import { LightningElement, track } from 'lwc';
import getrecipe from '@salesforce/apex/SpoonacularApp.getRecipe';
export default class SpoonacularApp extends LightningElement {
    minPro;
  changeProtien(event){
        this.minPro = event.target.value;
    }

    minCar;
    changeCarbs(event){
        this.minCar = event.target.value;
    }

    // colm=COLS;
    @track recipeList=[];
    @track error;
    @track result;
    // @wire(getrecipe) recList(result) 
    // {
    //     if (result.data) 
    //     {
    //       let rec = JSON.parse(result.data);
    //       this.recipeList = rec;
    //       this.error = undefined;
    //     } 
    //     else if(result.error) 
    //     {
    //       this.error = result.error;
    //       this.recipeList=[];
    //     }
    // }
    clickHandler(event){
      getrecipe({prot:this.minPro,carb:this.minCar})
          .then(data => {
              this.result = JSON.parse(data);
              
          })
          .catch(error => {
                
          });
}
}