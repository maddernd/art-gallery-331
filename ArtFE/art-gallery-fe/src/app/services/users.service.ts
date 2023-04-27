import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from './models/users';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private url = 'http://localhost:3000/api/users';
  private tokenKey = 'token';

  constructor(private http: HttpClient) { }

  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.url);
  }

  getUserById(id: number): Observable<User> {
    return this.http.get<User>(`${this.url}/${id}`);
  }

  addUser(user: User): Observable<User> {
    return this.http.post<User>(this.url, user);
  }

  updateUser(id: number, user: User): Observable<User> {
    return this.http.put<User>(`${this.url}/${id}`, user);
  }

  deleteUser(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }

  login(email: string, password: string): Observable<string> {
    return this.http.post<string>(`${this.url}/authenticate`, { email, password });
  }

  isAuthenticated(): boolean {
    return !!localStorage.getItem(this.tokenKey);
  }

  logout(): void {
    localStorage.removeItem(this.tokenKey);
  }
}
