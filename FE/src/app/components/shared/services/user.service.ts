import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject, Subscriber } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Product } from 'src/app/modals/product.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { map } from 'rxjs/operators';
import { Auth } from 'src/app/modals/auth';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private httpClient: HttpClient, public snackBar: MatSnackBar) {
  
   }




   public login(userData): Observable<any> {
    return this.httpClient.post('https://localhost:7095/api/User/Authentication',userData);
  }

  public Register(userData): Observable<any> {
    return this.httpClient.post('https://localhost:7095/api/User/InsertUser',userData);
  }
}
