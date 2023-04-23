import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UserComponent } from './components/users/user.component';
import { ArtistComponent } from './components/artists/artist.component';
import { ArtifactComponent } from './components/artifacts/artifacts.component';
import { ArtFactComponent } from './components/art-facts/art-fact.component';
import { AboriginalSymbolComponent } from './components/aboriginal-symbols/aboriginal-symbol.component';

const routes: Routes = [
  { path: 'users', component: UserComponent },
  { path: 'artists', component: ArtistComponent },
  { path: 'artifacts', component: ArtifactComponent },
  { path: 'art-facts', component: ArtFactComponent },
  { path: 'aboriginal-symbols', component: AboriginalSymbolComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
