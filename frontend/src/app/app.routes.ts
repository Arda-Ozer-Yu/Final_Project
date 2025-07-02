import { Routes } from '@angular/router';
import { HomePage } from './pages/home-page/home-page';

export const routes: Routes = [
  { path: '', component: HomePage },  //ana ekran pathi
  {   //film dizi detay ekranı
  path: 'media/:type/:id',
  loadComponent: () =>
    import('./pages/movie-details-page/movie-details-page').then(m => m.MovieDetailsPage)
}
,
{     //login ekranı
  path: 'login',
  loadComponent: () =>
    import('./pages/login-page/login-page').then(m => m.LoginPage)
}

];
