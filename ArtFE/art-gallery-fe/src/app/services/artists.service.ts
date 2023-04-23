import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artist } from './models/artists';

@Injectable({
  providedIn: 'root'
})
export class ArtistsService {
  private url = 'http://localhost:3000/api/artists';

  constructor(private http: HttpClient) { }

  getArtists(): Observable<Artist[]> {
    return this.http.get<Artist[]>(this.url);
  }

  getArtistById(id: number): Observable<Artist> {
    return this.http.get<Artist>(`${this.url}/${id}`);
  }

  addArtist(artist: Artist): Observable<Artist> {
    return this.http.post<Artist>(this.url, artist);
  }

  updateArtist(id: number, artist: Artist): Observable<Artist> {
    return this.http.put<Artist>(`${this.url}/${id}`, artist);
  }

  deleteArtist(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }
}
