import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ArtType } from './models/art_types';

@Injectable({
  providedIn: 'root'
})
export class ArtTypesService {
  private url = 'http://localhost:3000/api/art_types';

  constructor(private http: HttpClient) { }

  getArtTypes(): Observable<ArtType[]> {
    return this.http.get<ArtType[]>(this.url);
  }

  getArtTypeById(id: number): Observable<ArtType> {
    return this.http.get<ArtType>(`${this.url}/${id}`);
  }

  addArtType(artType: ArtType): Observable<ArtType> {
    return this.http.post<ArtType>(this.url, artType);
  }

  updateArtType(id: number, artType: ArtType): Observable<ArtType> {
    return this.http.put<ArtType>(`${this.url}/${id}`, artType);
  }

  deleteArtType(id: number): Observable<ArtType> {
    return this.http.delete<ArtType>(`${this.url}/${id}`);
  }
}
