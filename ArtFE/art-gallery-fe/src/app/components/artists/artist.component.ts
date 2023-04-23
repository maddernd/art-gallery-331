import { Component, OnInit } from '@angular/core';
import { ArtistsService } from '../../services/artists.service';
import { Artist } from '../../services/models/artists';

@Component({
  selector: 'app-artist',
  templateUrl: './artist.component.html',
})
export class ArtistComponent implements OnInit {
  artists: Artist[] = [];
  selectedArtist: Artist | null = null;

  constructor(private artistService: ArtistsService) {}

  ngOnInit(): void {
    this.getArtists();
  }

  getArtists(): void {
    this.artistService.getArtists().subscribe((artists) => (this.artists = artists));
  }

  selectArtist(artist: Artist): void {
    this.selectedArtist = artist;
  }

  createArtist(artist: Artist): void {
    this.artistService.addArtist(artist).subscribe((newArtist) => {
      this.artists.push(newArtist);
      this.selectedArtist = null;
    });
  }

  updateArtist(artist: Artist): void {
    this.artistService.updateArtist(artist.id, artist).subscribe(() => {
      this.getArtists();
      this.selectedArtist = null;
    });
  }

  deleteArtist(artist: Artist): void {
    this.artistService.deleteArtist(artist.id).subscribe(() => {
      this.artists = this.artists.filter((a) => a.id !== artist.id);
      this.selectedArtist = null;
    });
  }
}
