import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ArtFact } from './models/art_facts';

@Injectable({
  providedIn: 'root'
})
export class ArtFactService {
  private url = 'http://localhost:3000/api/art_facts';

  constructor(private http: HttpClient) { }

  getArtFacts(): Observable<ArtFact[]> {
    return this.http.get<ArtFact[]>(this.url);
  }

  getArtFactById(id: number): Observable<ArtFact> {
    return this.http.get<ArtFact>(`${this.url}/${id}`);
  }

  addArtFact(artFact: ArtFact): Observable<ArtFact> {
    return this.http.post<ArtFact>(this.url, artFact);
  }

  updateArtFact(id: number, artFact: ArtFact): Observable<ArtFact> {
    return this.http.put<ArtFact>(`${this.url}/${id}`, artFact);
  }

  deleteArtFact(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }
}