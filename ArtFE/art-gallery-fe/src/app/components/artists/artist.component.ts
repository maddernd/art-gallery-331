import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Artist } from '../../services/models/artists';
import { ArtistsService } from '../../services/artists.service';

@Component({
  selector: 'app-artist',
  templateUrl: './artist.component.html',
})
export class ArtistComponent implements OnInit {
  artists: Artist[] = [];
  selectedArtist: Artist | null = null;
  artistForm: FormGroup;

  constructor(private artistService: ArtistsService, private fb: FormBuilder) {
    this.artistForm = this.fb.group({
      name: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.getArtists();
  }

  getArtists(): void {
    console.log('Getting artists from the API');
    this.artistService.getArtists().subscribe(
      (artists) => {
        console.log('Received artists:', artists);
        this.artists = artists;
      },
      (error) => {
        console.error('Error fetching artists:', error);
      }
    );
  }

  selectArtist(artist: Artist): void {
    this.selectedArtist = artist;
    this.artistForm.setValue({
      name: artist.name,
    });
  }

  createArtist(artist: Artist): void {
    this.artistService.addArtist(artist).subscribe((newArtist) => {
      this.artists.push(newArtist);
      this.selectedArtist = null;
      this.artistForm.reset();
    });
  }

  updateArtist(artist: Artist): void {
    this.artistService.updateArtist(artist.id, artist).subscribe(() => {
      this.getArtists();
      this.selectedArtist = null;
      this.artistForm.reset();
    });
  }

  deleteArtist(artist: Artist): void {
    this.artistService.deleteArtist(artist.id).subscribe(() => {
      this.artists = this.artists.filter((a) => a.id !== artist.id);
      this.selectedArtist = null;
      this.artistForm.reset();
    });
  }

  onSubmit(): void {
    if (this.artistForm.invalid) {
      return;
    }

    const artist = {
      ...this.artistForm.value,
      id: this.selectedArtist ? this.selectedArtist.id : 0,
    };

    if (this.selectedArtist) {
      this.updateArtist(artist);
    } else {
      this.createArtist(artist);
    }
  }
}
