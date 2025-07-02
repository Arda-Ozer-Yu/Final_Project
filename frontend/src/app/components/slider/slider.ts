import { Component, ViewChild, ElementRef, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { Router } from '@angular/router';
import { MovieService } from '../../services/movie.service';



@Component({
  selector: 'app-slider',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './slider.html',
  styleUrls: ['./slider.css']
})


export class Slider implements OnInit {
  @ViewChild('scrollArea') scrollArea!: ElementRef;

  mediaList: any[] = [];

  constructor(
    private movieService: MovieService,
    private router: Router
  ) {}


  //filmler diziler ve oyuncuları çekme
  ngOnInit(): void {
  this.movieService.getAllMovies().subscribe((movies) => {
    const movieList = movies.map((m: any) => ({
      ...m,type: 'movie'
    }));

    this.movieService.getAllSeries().subscribe((series) => {
      const seriesList = series.map((s: any) => ({
        ...s, type: 'series'
      }));

      const merged = [...movieList, ...seriesList];

      this.mediaList = merged.sort(
        (a, b) => (b.imdb_rating || 0) - (a.imdb_rating || 0)
      );
    });
  });
}


  //scroll
  scrollLeft() {
    this.scrollArea.nativeElement.scrollBy({ left: -300, behavior: 'smooth' });
  }

  scrollRight() {
    this.scrollArea.nativeElement.scrollBy({ left: 300, behavior: 'smooth' });
  }


  //detail page
  goToDetails(id: number,type: string) {
    this.router.navigate(['/media',type, id]);
  }
}
