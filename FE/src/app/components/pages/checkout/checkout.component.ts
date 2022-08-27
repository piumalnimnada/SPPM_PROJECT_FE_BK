import { Component, OnInit } from '@angular/core';
import { CartService } from '../../shared/services/cart.service';
import { Observable, of } from 'rxjs';
import { CartItem } from 'src/app/modals/cart-item';
import { ProductService } from '../../shared/services/product.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Billing } from 'src/app/modals/billing';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.sass']
})
export class CheckoutComponent implements OnInit {

  public cartItems: Observable<CartItem[]> = of([]);
  public buyProducts: CartItem[] = [];

  amount: number;
  payments: string[] = ['Create an Account?', 'Flat Rate'];
  paymantWay: string[] = ['Direct Bank Transfer', 'PayPal'];
  billlingForm: FormGroup;

  constructor(private cartService: CartService, public productService: ProductService,private pservice: ProductService, public snackBar: MatSnackBar) { 
    this.billlingForm = new FormGroup({
      fname: new FormControl('', [Validators.required]),
      lname: new FormControl('', [Validators.required]),
      Company: new FormControl('', [Validators.required]),
      address: new FormControl('', [Validators.required]),
      town: new FormControl('', [Validators.required]),
      state: new FormControl('', [Validators.required]),
      postcode: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required]),
      phone: new FormControl('', [Validators.required]),
      note: new FormControl('', [Validators.required]),
  

    });
  }

  ngOnInit() {
    this.cartItems = this.cartService.getItems();
    this.cartItems.subscribe(products => this.buyProducts = products);
    this.getTotal().subscribe(amount => this.amount = amount);
  }

  onSubmit(){
    let products = JSON.parse(localStorage.getItem("User")) || [];
    if (this.billlingForm.valid) {
      let BillingData = new Billing();
      BillingData.firstName = this.billlingForm.controls.fname.value;
      BillingData.lastName = this.billlingForm.controls.lname.value;
      BillingData.CompanyName = this.billlingForm.controls.Company.value;
      BillingData.Address = this.billlingForm.controls.address.value;
      BillingData.Town = this.billlingForm.controls.town.value;
      BillingData.State = this.billlingForm.controls.state.value;
      BillingData.PostCode = this.billlingForm.controls.postcode.value;
      BillingData.Email = this.billlingForm.controls.email.value;
      BillingData.Phone = this.billlingForm.controls.phone.value;
      BillingData.Notes = this.billlingForm.controls.note.value;
      BillingData.User_id = products.id;
  



      this.pservice.PostBills(BillingData)
        .subscribe(data => {
          console.log(data)
          if (data != null) {

            // this.messageService.sendMessage(data);
            // this.userData=data.username;
            this.billlingForm.reset();
            let message = 'Insert  Successful.';
            let status = 'success';
            this.snackBar.open(message, '×', { panelClass: [status], verticalPosition: 'top', duration: 3000 });
          }

        })
    }
  }

  public getTotal(): Observable<number> {
    return this.cartService.getTotalAmount();
    }

}
