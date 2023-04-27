import { Component, OnInit } from '@angular/core';
import { Artifact } from './services/models/artifacts';
import { ArtifactsService } from './services/artifacts.service';
import { UserService } from './services/users.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'art-gallery-fe';
  showSpinner: boolean = true;
  artifacts: Artifact[] = [];
  isAuthenticated: boolean = false;

  constructor(private artifactsService: ArtifactsService, private userService: UserService, private router: Router) {}

  ngOnInit(): void {
    this.getArtifacts();
    this.isAuthenticated = this.userService.isAuthenticated();
  }

  getArtifacts(): void {
    this.artifactsService.getArtifacts()
      .subscribe((artifacts) => {
        this.artifacts = artifacts;
        this.showSpinner = false; 
      });
  }

  onActivate(): void {
    this.showSpinner = false;
  }

  logout(): void {
    this.userService.logout();
    this.isAuthenticated = false;
    this.router.navigate(['/login']);
  }
}
