import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Auth } from 'src/app/modals/auth';
import { MessageService } from '../../shared/services/message-service.service';
import { UserService } from '../../shared/services/user.service';

@Component({
  selector: 'app-my-account',
  templateUrl: './my-account.component.html',
  styleUrls: ['./my-account.component.sass']
})
export class MyAccountComponent implements OnInit {
  loginForm: FormGroup;
  userData: any;
  
  constructor(private UserService: UserService,private messageService: MessageService) {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required])
    });
   }

  ngOnInit() {
  }

  onSubmit() {
    if(this.loginForm.valid) {
     
   let   authData =new Auth();
   authData.username=this.loginForm.controls.email.value;
   authData.password=this.loginForm.controls.password.value;

      this.UserService.login(authData);


      this.UserService.login(authData)
      .subscribe(data => {
        console.log(data)
        if(data!=null)
        {
          localStorage.setItem("User", JSON.stringify(data));
          this.messageService.sendMessage(data);
          this.userData=data.username;
          this.loginForm.reset();
        }
       
      }) 
      // console.log(JSON.stringify(this._v()));
      
    }
  }




}
