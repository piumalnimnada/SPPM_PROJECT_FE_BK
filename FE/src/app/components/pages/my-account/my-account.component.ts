import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Auth } from 'src/app/modals/auth';
import { User } from 'src/app/modals/user';
import { MessageService } from '../../shared/services/message-service.service';
import { UserService } from '../../shared/services/user.service';

@Component({
  selector: 'app-my-account',
  templateUrl: './my-account.component.html',
  styleUrls: ['./my-account.component.sass']
})
export class MyAccountComponent implements OnInit {
  loginForm: FormGroup;
  RegiForm: FormGroup;
  userData: any;
  
  constructor(private UserService: UserService,public snackBar: MatSnackBar,private messageService: MessageService) {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required])
    });

    this.RegiForm = new FormGroup({
      fname: new FormControl('', [Validators.required]),
      lname: new FormControl('', [Validators.required]),
      uname: new FormControl('', [Validators.required]),
      pw: new FormControl('', [Validators.required]),

    });
   }

  ngOnInit() {
  }

  onSubmit() {
    if(this.loginForm.valid) {
     
   let   authData =new Auth();
   authData.username=this.loginForm.controls.email.value;
   authData.password=this.loginForm.controls.password.value;

    


      this.UserService.login(authData)
      .subscribe(data => {
        console.log(data)
        if(data!=null)
        {
          localStorage.setItem("User", JSON.stringify(data));
          this.messageService.sendMessage(data);
          this.userData=data.username;
          this.loginForm.reset();
        let  message = 'Login Successful.';
         let status = 'success';
          this.snackBar.open(message, '×', { panelClass: [status], verticalPosition: 'top', duration: 3000 });
        }else{
          this.loginForm.reset();
          let  message = 'Login Unsuccessful.';
         let   status = 'success';
            this.snackBar.open(message, '×', { panelClass: [status], verticalPosition: 'top', duration: 3000 });
        }
       
      }) 
      // console.log(JSON.stringify(this._v()));
      
    }
  }


  onRegSubmit(){
    if(this.RegiForm.valid) {
      let   userData =new User();
      userData.id=0;
      userData.firstName=this.RegiForm.controls.fname.value;
      userData.lastName=this.RegiForm.controls.lname.value;
      userData.username=this.RegiForm.controls.uname.value;
      userData.password=this.RegiForm.controls.pw.value;
      userData.enrollmentDate=new Date().toISOString()



      this.UserService.Register(userData)
      .subscribe(data => {
        console.log(data)
        if(data!=null)
        {
          localStorage.setItem("User", JSON.stringify(data));
          this.messageService.sendMessage(data);
          this.userData=data.username;
          this.RegiForm.reset();
        let  message = 'SignIn Successful.';
          status = 'success';
          this.snackBar.open(message, '×', { panelClass: [status], verticalPosition: 'top', duration: 3000 });
        }
       
      }) 
      // console.log(JSON.stringify(this._v()));
      
    
    }
  }

}
