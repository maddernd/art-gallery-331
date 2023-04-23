import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artifact } from './models/artifacts';

@Injectable({
  providedIn: 'root'
})
export class ArtifactsService {
  private url = 'http://localhost:3000/api/artifacts';

  constructor(private http: HttpClient) { }

  getArtifacts(): Observable<Artifact[]> {
    return this.http.get<Artifact[]>(this.url);
  }

  getArtifactById(id: number): Observable<Artifact> {
    return this.http.get<Artifact>(`${this.url}/${id}`);
  }

  addArtifact(artifact: Artifact): Observable<Artifact> {
    return this.http.post<Artifact>(this.url, artifact);
  }

  updateArtifact(id: number, artifact: Artifact): Observable<Artifact> {
    return this.http.put<Artifact>(`${this.url}/${id}`, artifact);
  }

  deleteArtifact(id: number): Observable<any> {
    return this.http.delete<any>(`${this.url}/${id}`);
  }
}
