import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/users.service';
import { User } from '../../services/models/users';
import { FormsModule } from '@angular/forms';
import { UsersSharedService } from '../../services/users-shared.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
})
export class UserComponent implements OnInit {
  users: User[] = [];
  selectedUser: User | null = null;
  newUser: User = { id: 0, email: '', first_name: '', last_name: '', admin: false, password: '' };

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
        this.usersSharedService.users = users; // Update the users array in the shared service
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
      this.usersSharedService.users.push(newUser); // Update the users array in the shared service
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
