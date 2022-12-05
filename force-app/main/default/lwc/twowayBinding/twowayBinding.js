import { LightningElement, track } from 'lwc';

export default class TwowayBinding extends LightningElement {
    firstname="Pandhari";
 lastname="Biradar";
changeHandler(event)
{
    this.lastname=event.target.value;
}
}