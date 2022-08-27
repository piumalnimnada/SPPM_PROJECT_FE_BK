import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Product } from 'src/app/modals/product.model';
import { ProductService } from '../../shared/services/product.service';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.sass']
})
export class AdminPanelComponent implements OnInit {
  prodform: FormGroup;
  loginForm: FormGroup;
  showPeoductInsert: boolean=false;

  constructor(private pservice: ProductService, public snackBar: MatSnackBar) {
    this.prodform = new FormGroup({
      name: new FormControl('', [Validators.required]),
      price: new FormControl('', [Validators.required]),
      stock: new FormControl('', [Validators.required]),
      salePrice: new FormControl('', [Validators.required]),
      discount: new FormControl('', [Validators.required]),
      pictures: new FormControl('', [Validators.required]),
      shortDetails: new FormControl('', [Validators.required]),
      description: new FormControl('', [Validators.required]),
      brand: new FormControl('', [Validators.required]),
      newPro: new FormControl('', [Validators.required]),
      state: new FormControl('', [Validators.required]),
      category: new FormControl('', [Validators.required]),

    });
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required])
    });
  }

  ngOnInit(): void {
  }
  ngondestroy(){
    this.showPeoductInsert=false;

  }

  onSubmit() {
    if (this.loginForm.valid) {


      let username = this.loginForm.controls.email.value;
      let password = this.loginForm.controls.password.value;

      if(username=="Admin" && password=="123456"){
        this.showPeoductInsert=true;
        this.loginForm.reset();
      }

    }
  }
  onProdSubmit() {
    if (this.prodform.valid) {
      let ProdcutData = new Product();
      ProdcutData.name = this.prodform.controls.name.value;
      ProdcutData.price = +this.prodform.controls.price.value;
      ProdcutData.stock = +this.prodform.controls.stock.value;
      ProdcutData.salePrice = +this.prodform.controls.salePrice.value;
      ProdcutData.discount = +this.prodform.controls.discount.value;
      ProdcutData.pictures = this.prodform.controls.pictures.value;
      ProdcutData.shortDetails = this.prodform.controls.shortDetails.value;
      ProdcutData.description = this.prodform.controls.description.value;
      ProdcutData.brand = this.prodform.controls.brand.value;
      if (this.prodform.controls.newPro.value == "true") {
        ProdcutData.newPro = true;
      } else {
        ProdcutData.newPro = false;

      }
      ProdcutData.state = this.prodform.controls.state.value;
      ProdcutData.category = this.prodform.controls.category.value;
      ProdcutData.sale = true;



      this.pservice.PostProducts(ProdcutData)
        .subscribe(data => {
          console.log(data)
          if (data != null) {

            // this.messageService.sendMessage(data);
            // this.userData=data.username;
            this.prodform.reset();
            let message = 'Insert Product Successful.';
            let status = 'success';
            this.snackBar.open(message, '×', { panelClass: [status], verticalPosition: 'top', duration: 3000 });
          }

        })
    }
  }
}
