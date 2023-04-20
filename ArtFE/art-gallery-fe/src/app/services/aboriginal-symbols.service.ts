// AboriginalSymbols service
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AboriginalSymbol } from './models/aboriginal_symbols';

@Injectable({
  providedIn: 'root'
})
export class AboriginalSymbolsService {
  private url = 'http://localhost:3000/api/aboriginal_symbols';

  constructor(private http: HttpClient) { }

  getAboriginalSymbols(): Observable<AboriginalSymbol[]> {
    return this.http.get<AboriginalSymbol[]>(this.url);
  }

  getAboriginalSymbolById(id: number): Observable<AboriginalSymbol> {
    return this.http.get<AboriginalSymbol>(`${this.url}/${id}`);
  }

  addAboriginalSymbol(aboriginalSymbol: AboriginalSymbol): Observable<AboriginalSymbol> {
    return this.http.post<AboriginalSymbol>(this.url, aboriginalSymbol);
  }

  updateAboriginalSymbol(id: number, aboriginalSymbol: AboriginalSymbol): Observable<AboriginalSymbol> {
    return this.http.put<AboriginalSymbol>(`${this.url}/${id}`, aboriginalSymbol);
  }

  deleteAboriginalSymbol(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }
}