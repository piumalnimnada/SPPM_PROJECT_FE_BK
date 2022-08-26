import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Subject } from 'rxjs';

@Injectable()
export class MessageService {
    public subject = new Subject<any>();

    sendMessage(message: any) {
        this.subject.next({ text: message });
    }
    getMessage(): Observable<any> {
      return this.subject.asObservable();
  }
    
}