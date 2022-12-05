import { LightningElement } from 'lwc';

export default class SecondLWCapp extends LightningElement {


    userNames=["sharad","pintu","Angad","Bhavani"];
    fetchDetailsHandler(){
        const emle=this.template.querySelector('h1')
        emle.style.border="1px solid red";
        console.log(emle.innerText);
        const userElements=this.template.querySelectorAll('.name')
        userElements.forEach(item =>{
            console.log(item.innerText)
            item.setAttribute("tittle",item.innerText)
        })
        const childEle=this.template.querySelector('.child')
        childEle.innerHTML='<p1>hi I am child element</p1>'

    }
}