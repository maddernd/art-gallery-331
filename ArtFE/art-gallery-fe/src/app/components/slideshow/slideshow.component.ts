import { Component, Input } from '@angular/core';
import { Artifact } from '../../services/models/artifacts';
import { ArtistsService } from '../../services/artists.service';
import { Artist } from '../../services/models/artists';

@Component({
  selector: 'app-slideshow',
  templateUrl: './slideshow.component.html',
  styleUrls: ['./slideshow.component.scss']
})
export class SlideshowComponent {
  @Input() artifacts: Artifact[] = [];
  selectedArtifactIndex: number = 0;
  selectedArtist: Artist | null = null;
  artists: Artist[] = [];

  constructor(private artistsService: ArtistsService) { }

  ngOnInit(): void {
    this.getArtists();
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
}
