import { Injectable } from '@angular/core';
import { User } from './models/users';

@Injectable({
  providedIn: 'root'
})
export class UsersSharedService {
  users: User[] = [];

  constructor() { }
}

