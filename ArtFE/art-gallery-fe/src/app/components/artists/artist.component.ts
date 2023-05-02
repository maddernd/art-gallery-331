import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ArtistsService } from '../../services/artists.service';
import { Artist } from '../../services/models/artists';

@Component({
  selector: 'app-artist',
  templateUrl: './artist.component.html',
})
export class ArtistComponent implements OnInit {
  artists: Artist[] = [];
  selectedArtist: Artist | null = null;
  artistForm!: FormGroup;
  newArtist: Artist = {  name: '', bio: '' };
  constructor(private artistService: ArtistsService, private formBuilder: FormBuilder) {}

  ngOnInit(): void {
    this.getArtists();
    this.artistForm = this.formBuilder.group({
      name: ['', Validators.required],
      bio: [''],
    });
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
    this.artistForm.setValue({ name: artist.name, bio: artist.bio });
  }

  onSubmit(): void {
    if (this.artistForm.invalid) {
      return;
    }

    const artist = this.artistForm.value;
    if (this.selectedArtist && this.selectedArtist.id) {
      artist.id = this.selectedArtist.id;
      this.artistService.updateArtist(artist.id, artist).subscribe(() => {
        this.getArtists();
        this.selectedArtist = null;
        this.artistForm.reset();
      });

    } else {
      this.artistService.addArtist(artist).subscribe((newArtist) => {
        this.artists.push(newArtist);
        this.artistForm.reset();
      });
    }
  }

  deleteArtist(artist: Artist): void {
    if (artist.id) {
        this.artistService.deleteArtist(artist.id).subscribe(() => {
            this.artists = this.artists.filter((a) => a.id !== artist.id);
            this.selectedArtist = null;
            this.artistForm.reset();
        });
    }
}
  onAddSubmit(): void {
    this.artistService.addArtist(this.newArtist).subscribe((newArtist) => {
      this.artists.push(newArtist);
      this.newArtist = { name: '', bio: '' };
    });
  }
}
