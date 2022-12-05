import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ToastMessageDemo extends LightningElement {
    changeMessage(event)
    {
        var btn=event.target.name;
        switch(btn){
            case 'successbtn':
                const sev = new ShowToastEvent({
                    title: 'Toast Error',
                    message: 'Success Message',
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(sev);
            
            break;
        
            case 'errorbtn':
                const eev = new ShowToastEvent({
                    title: 'Toast Error',
                    message: 'Error message',
                    variant: 'error',
                    mode: 'dismissable'
                });
                this.dispatchEvent(eev);
            
            break;
        
            case 'warningbtn':
                const wev = new ShowToastEvent({
                    title: 'Toast Warning',
                    message: 'Warning message',
                    variant: 'warning',
                    mode: 'dismissable'
                });
                this.dispatchEvent(wev);
            
            break;
            case 'infobtn':
                const iev = new ShowToastEvent({
                    title: 'Toast Info',
                    message: 'Information message',
                    variant: 'info',
                    mode: 'dismissable'
                });
                this.dispatchEvent(iev);
            
            break;
        
    }
    }
}