import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ArtistsComponent } from './artists/artists.component';
import { UsersComponent } from './users/users.component';
import { ArtFactsComponent } from './art-facts/art-facts.component';

@NgModule({
  declarations: [
    AppComponent,
    ArtistsComponent,
    UsersComponent,
    ArtFactsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
