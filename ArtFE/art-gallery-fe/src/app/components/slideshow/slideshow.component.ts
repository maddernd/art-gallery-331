import { Component } from '@angular/core';
import { Artifact } from '../../services/models/artifacts';
import { ArtistsService } from '../../services/artists.service';
import { Artist } from '../../services/models/artists';
import { ArtifactsService } from '../../services/artifacts.service';

@Component({
  selector: 'app-slideshow',
  templateUrl: './slideshow.component.html',
  styleUrls: ['./slideshow.component.scss']
})
export class SlideshowComponent {
  artifacts: Artifact[] = [];
  selectedArtifactIndex: number = 0;
  selectedArtist: Artist | null = null;
  artists: Artist[] = [];

  constructor(
    private artistsService: ArtistsService,
    private artifactsService: ArtifactsService
  ) {}

  ngOnInit(): void {
    console.log('Artifacts:', this.artifacts);
    this.getArtists();
    this.fetchArtifacts();
  }

  getArtists(): void {
    this.artistsService.getArtists()
      .subscribe((artists) => this.artists = artists);
  }

  getSelectedArtifact(): Artifact | null {
    return this.artifacts[this.selectedArtifactIndex] || null;
  }

  selectArtifact(index: number): void {
    this.selectedArtifactIndex = index;
    this.selectedArtist = this.artists.find(a => a.id === this.getSelectedArtifact()?.artist_id) || null;
  }

  fetchArtifacts(): void {
    this.artifactsService.getArtifacts()
      .subscribe((artifacts) => {
        this.artifacts = artifacts;
        console.log('Artifacts:', this.artifacts);
      });
  }
}
