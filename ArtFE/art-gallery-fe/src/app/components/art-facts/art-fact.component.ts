import { Component, OnInit } from '@angular/core';
import { ArtFactService } from '../../services/art-facts.service';
import { ArtFact } from '../../services/models/art_facts';


@Component({
  selector: 'app-art-fact',
  templateUrl: './art-fact.component.html',
  styleUrls: ['./art-fact.component.scss']
})
export class ArtFactComponent implements OnInit {
  artFacts: ArtFact[] = [];
  selectedArtFact: ArtFact | null = null;

  constructor(private artFactService: ArtFactService) {}

  ngOnInit(): void {
    this.getArtFacts();
  }

  getArtFacts(): void {
    this.artFactService.getArtFacts().subscribe((artFacts) => (this.artFacts = artFacts));
  }

  selectArtFact(artFact: ArtFact): void {
    this.selectedArtFact = artFact;
  }

  createArtFact(artFact: ArtFact): void {
    this.artFactService.addArtFact(artFact).subscribe((newArtFact) => {
      this.artFacts.push(newArtFact);
      this.selectedArtFact = null;
    });
  }

  updateArtFact(artFact: ArtFact): void {
    this.artFactService.updateArtFact(artFact.id, artFact).subscribe(() => {
      this.getArtFacts();
      this.selectedArtFact = null;
    });
  }

  deleteArtFact(artFact: ArtFact): void {
    this.artFactService.deleteArtFact(artFact.id).subscribe(() => {
      this.artFacts = this.artFacts.filter((a) => a.id !== artFact.id);
      this.selectedArtFact = null;
    });
  }
}
