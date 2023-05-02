import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { UserService } from '../../services/users.service';
import { User } from '../../services/models/users';
import { UsersSharedService } from '../../services/users-shared.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
})
export class UserComponent implements OnInit {
  users: User[] = [];
  selectedUser: User | null = null;

  createUserForm: FormGroup = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    first_name: new FormControl('', [Validators.required]),
    last_name: new FormControl('', [Validators.required]),
    password: new FormControl('', [Validators.required]),
  });

  constructor(private userService: UserService, private usersSharedService: UsersSharedService) {}

  ngOnInit(): void {
    this.getUsers();
  }

  getUsers(): void {
    console.log('Getting users from the API');
    this.userService.getUsers().subscribe(
      (users) => {
        console.log('Received users:', users);
        this.users = users;
        this.usersSharedService.users = users; 
      },
      (error) => {
        console.error('Error fetching users:', error);
      }
    );
  }

  selectUser(user: User): void {
    this.selectedUser = user;
  }

  createUser(): void {
    if (this.createUserForm.invalid) {
      console.log('Please enter valid user data');
      return;
    }
  
    const { password, admin, ...userWithoutPassword } = this.createUserForm.value;
    console.log('Sending user data:', { ...userWithoutPassword, password: password, admin: admin }); 
  
    this.userService.addUser({ ...userWithoutPassword, password: password, admin: admin }).subscribe((newUser) => {
      //this.users.push(newUser);
      this.createUserForm.reset();
      this.usersSharedService.users.push(newUser); 
    });
  }
  

  updateUser(user: User): void {
    this.userService.updateUser(user.id, user).subscribe(() => {
      this.getUsers();
      this.selectedUser = null;
    });
  }

  deleteUser(user: User): void {
    this.userService.deleteUser(user.id).subscribe(() => {
      this.users = this.users.filter((u) => u.id !== user.id);
      this.selectedUser = null;
      this.usersSharedService.users = this.usersSharedService.users.filter((u) => u.id !== user.id); // Update the users array in the shared service
    });
  }
}
