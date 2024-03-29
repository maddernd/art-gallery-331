import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ArtistComponent } from './components/artists/artist.component';
import { UserComponent } from './components/users/user.component';
import { ArtFactComponent } from './components/art-facts/art-fact.component';
import { AboriginalSymbolComponent } from './components/aboriginal-symbols/aboriginal-symbol.component';
import { ArtifactComponent } from './components/artifacts/artifacts.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { HttpClientModule } from '@angular/common/http';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { FormsModule } from '@angular/forms';
import { MatPaginatorModule } from '@angular/material/paginator';
import { SlideshowComponent } from './components/slideshow/slideshow.component';
import { MatCardModule } from '@angular/material/card';
import { MatSelectModule } from '@angular/material/select';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { LoginComponent } from './components/login/login.component';
import { UsersSharedService } from './services/users-shared.service';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    ArtistComponent,
    UserComponent,
    ArtFactComponent,
    AboriginalSymbolComponent,
    ArtifactComponent,
    SlideshowComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatToolbarModule,
    MatMenuModule,
    MatButtonModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatFormFieldModule,
    MatIconModule,
    MatListModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatPaginatorModule,
    MatCardModule,
    MatSelectModule,
    MatSnackBarModule

  ],
  providers: [UsersSharedService], 
  bootstrap: [AppComponent]
})
export class AppModule { }
