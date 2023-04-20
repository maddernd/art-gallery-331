import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artist } from './artist';

@Injectable({
  providedIn: 'root'
})
export class ArtistService {
  private apiUrl = 'http://localhost:3000/api/artists';

  constructor(private http: HttpClient) { }

  getArtists(): Observable<Artist[]> {
    return this.http.get<Artist[]>(this.apiUrl);
  }

  getArtist(id: number): Observable<Artist> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<Artist>(url);
  }

  addArtist(artist: Artist): Observable<Artist> {
    return this.http.post<Artist>(this.apiUrl, artist);
  }

  updateArtist(artist: Artist): Observable<any> {
    const url = `${this.apiUrl}/${artist.id}`;
    return this.http.put(url, artist);
  }

  deleteArtist(id: number): Observable<Artist> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<Artist>(url);
  }
}
