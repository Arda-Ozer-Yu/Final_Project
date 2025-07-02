import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { MovieService } from '../../services/movie.service';
import { HttpClientModule } from '@angular/common/http';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'app-movie-details-page',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './movie-details-page.html',
  styleUrls: ['./movie-details-page.css']
})
export class MovieDetailsPage implements OnInit {
  media: any;   //dizi yada film
  safeTrailerUrl?: SafeResourceUrl;  //fragman link

  constructor(
    private route: ActivatedRoute,
    private movieService: MovieService,   //dizi film verileri
    private sanitizer: DomSanitizer
  ) {}

  ngOnInit(): void {

    
    this.route.paramMap.subscribe(params => {
  const id = Number(params.get('id'));
  const type = params.get('type');

  if (type === 'movie') {  //id yi film için kontrol et
    this.movieService.getAllMovies().subscribe((movies) => {
      const movie = movies.find((m: any) => m.id === id);
      if (movie) {
        this.setMedia(movie);
      }
    });
  } else if (type === 'series') {   //id yi dizi için kontrol et
    this.movieService.getAllSeries().subscribe((series) => {
      const show = series.find((s: any) => s.id === id);
      if (show) {
        this.setMedia(show);
      }
    });
  }
});

  }
  //trailer linkini güvenli yap
  private setMedia(media: any) {
    this.media = media;
    this.safeTrailerUrl = this.sanitizer.bypassSecurityTrustResourceUrl(media.trailer_url);
  }
}
