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
    this.userService.getUsers().subscribe((users) => (this.users = users));
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
