import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from './models/users';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private url = 'http://localhost:3000/api/users';

  constructor(private http: HttpClient) { }

  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.url);
  }

  getUserById(id: number): Observable<User> {
    return this.http.get<User>(`${this.url}/${id}`);
  }

  addUser(user: User): Observable<User> {
    // Use destructuring to remove password from user object
    const { password, ...userWithoutPassword } = user;
    // Send the user object with password_digest instead of password
    return this.http.post<User>(this.url, { ...userWithoutPassword, password_digest: password });
  }
  

  updateUser(id: number, user: User): Observable<User> {
    return this.http.put<User>(`${this.url}/${id}`, user);
  }

  deleteUser(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }
}
