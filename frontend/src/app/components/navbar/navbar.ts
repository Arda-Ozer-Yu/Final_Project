import {
  Component,
  OnInit,
  ElementRef,
  HostListener
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { MovieService } from '../../services/movie.service';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './navbar.html',
  styleUrls: ['./navbar.css']
})
export class Navbar implements OnInit {
  searchText: string = '';
  selectedCategory: string = 'all';
  media: any[] = [];
  actors: any[] = [];
  filteredMedia: any[] = [];
  filteredActors: any[] = [];

  showResults: boolean = true;

  constructor(
    private movieService: MovieService,
    private router: Router,
    private eRef: ElementRef 
  ) {}

  ngOnInit(): void {
    this.movieService.getAllMovies().subscribe((movies) => {
      const moviesWithType = movies.map((m: any) => ({ ...m, type: 'movie' }));

      this.movieService.getAllSeries().subscribe((series) => {
        const seriesWithType = series.map((s: any) => ({ ...s, type: 'series' }));
        this.media = [...moviesWithType, ...seriesWithType];
      });
    });

    this.movieService.getAllActors().subscribe((actors) => {
      this.actors = actors;
    });
  }

  filterMedia(): void {
    const trimmed = this.searchText.trim().toLowerCase();
    if (!trimmed) {
      this.filteredMedia = [];
      this.filteredActors = [];
      return;
    }

    if (this.selectedCategory === 'movies') {
      this.filteredMedia = this.media.filter(m => m.type === 'movie' && m.name.toLowerCase().startsWith(trimmed));
      this.filteredActors = [];
    } else if (this.selectedCategory === 'series') {
      this.filteredMedia = this.media.filter(m => m.type === 'series' && m.name.toLowerCase().startsWith(trimmed));
      this.filteredActors = [];
    } else if (this.selectedCategory === 'actors') {
      this.filteredMedia = [];
      this.filteredActors = this.actors.filter(a => a.name.toLowerCase().startsWith(trimmed));
    } else {
      this.filteredMedia = this.media.filter(m => m.name.toLowerCase().startsWith(trimmed));
      this.filteredActors = this.actors.filter(a => a.name.toLowerCase().startsWith(trimmed));
    }

    this.showResults = true;
  }

  goToDetails(id: number, type: string): void {
    this.router.navigate(['/media', type, id]);
    this.showResults = false;
  }

  goToSearchPage(): void {
    const trimmed = this.searchText.trim().toLowerCase();
    if (!trimmed) return;

    this.router.navigate(['/search'], {
      queryParams: {
        q: trimmed,
        type: this.selectedCategory
      }
    });

    this.showResults = false;
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: Event) {
    if (!this.eRef.nativeElement.contains(event.target)) {
      this.showResults = false;
    }
  }
}
