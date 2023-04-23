import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/users.service';
import { User } from '../../services/models/users';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
})
export class UserComponent implements OnInit {
  users: User[] = [];
  selectedUser: User | null = null;
  newUser: User = { id: 0, email: '', first_name: '', last_name: '', admin: false, password: '' };

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.getUsers();
  }

  getUsers(): void {
    console.log('Getting users from the API');
    this.userService.getUsers().subscribe(
      (users) => {
        console.log('Received users:', users);
        this.users = users;
      },
      (error) => {
        console.error('Error fetching users:', error);
      }
    );
  }
  

  selectUser(user: User): void {
    this.selectedUser = user;
  }

  createUser(user: User): void {
    if (!user.password) {
      console.log('Please enter a password');
      return;
    }
    const { password, ...userWithoutPassword } = user;
    console.log('Sending user data:', { ...userWithoutPassword, password: password }); // Add this line to log the user data
    this.userService.addUser({ ...userWithoutPassword, password: password }).subscribe((newUser) => {
      this.users.push(newUser);
      this.newUser = { id: 0, email: '', first_name: '', last_name: '', admin: false, password: '' };
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
    });
  }
}
