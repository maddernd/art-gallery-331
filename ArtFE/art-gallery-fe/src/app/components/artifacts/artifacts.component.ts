import { Component, OnInit } from '@angular/core';
import { Artifact } from '../../services/models/artifacts';
import { ArtifactsService } from '../../services/artifacts.service';

@Component({
  selector: 'app-artifact',
  templateUrl: './artifacts.component.html',
  styleUrls: ['./artifacts.component.scss']
})
export class ArtifactComponent implements OnInit {
    artifacts: Artifact[] = [];

    selectedArtifact: Artifact | null = null;

  constructor(private artifactsService: ArtifactsService) { }

  ngOnInit(): void {
    this.getArtifacts();
  }

  getArtifacts(): void {
    this.artifactsService.getArtifacts()
      .subscribe((artifacts) => this.artifacts = artifacts);
  }

  selectArtifact(artifact: Artifact): void {
    this.selectedArtifact = artifact;
  }

  createArtifact(artifact: Artifact): void {
    this.artifactsService.addArtifact(artifact)
      .subscribe((newArtifact) => {
        this.artifacts.push(newArtifact);
        this.selectedArtifact = null;
      });
  }

  updateArtifact(artifact: Artifact): void {
    this.artifactsService.updateArtifact(artifact.id, artifact)
      .subscribe(() => {
        this.getArtifacts();
        this.selectedArtifact = null;
      });
  }

  deleteArtifact(artifact: Artifact): void {
    this.artifactsService.deleteArtifact(artifact.id)
      .subscribe(() => {
        this.artifacts = this.artifacts.filter((a) => a.id !== artifact.id);
        this.selectedArtifact = null;
      });
  }
}
