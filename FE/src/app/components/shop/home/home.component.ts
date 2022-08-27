import { Component, OnInit } from '@angular/core';
import { ProductService } from '../../shared/services/product.service';
import { Product } from 'src/app/modals/product.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.sass']
})
export class HomeComponent implements OnInit {
  products: Product[];
  public banners = [];
  public slides = [
    { title: 'Eco Friendly', subtitle: 'The entire line of wooden goods is created entirely out of natural kithul wood. It respects nature and does not harm the environment.', image: 'assets/images/wood/1.jpg' },
    { title: 'Industry Standard', subtitle: 'Made with high quality industry standards.', image: 'assets/images/wood/2.jpg' },
    { title: 'Awesome Quality', subtitle: 'All of the products are 100% unique and high quality.', image: 'assets/images/wood/3.jpg'},

  ];

  constructor(private productService: ProductService) { }

  ngOnInit() {


 this.productService.getProducts()
 .subscribe(
   (product: Product[]) => {
     this.products = product
   }
 )

  }






}
