import { LightningElement, wire } from 'lwc';

import selectRecord from '@salesforce/apex/SelectAccountData.selectRecord';
export default class SelectAccountData extends LightningElement {
  @wire (selectRecord)
uid;


}