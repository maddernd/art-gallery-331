import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UserService } from '../../services/users.service';
import { Router } from '@angular/router';
import { User } from '../../services/models/users';
import { UsersSharedService } from '../../services/users-shared.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  users: User[] = [];

  constructor(
    private formBuilder: FormBuilder,
    private userService: UserService,
    private router: Router,
    private usersSharedService: UsersSharedService
  ) {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.users = this.usersSharedService.users;
  }

  onSubmit(): void {
    if (this.loginForm.invalid) {
      return;
    }

    const email = this.loginForm.controls['email'].value;
    const password = this.loginForm.controls['password'].value;
    
    this.userService.login(email, password).subscribe(
      (token: string) => {
        localStorage.setItem('token', token);
        this.router.navigate(['/slideshow']);
      },
      (error: any) => {
        console.error(error);
      }
    );
  }
}
