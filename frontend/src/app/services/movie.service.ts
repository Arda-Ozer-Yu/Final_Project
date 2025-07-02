import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MovieService {
  private apiUrl = 'http://localhost:5000';   //database port

  constructor(private http: HttpClient) {}


  //api dan filmleri çek
  getAllMovies(): Observable<any> {
    return this.http.get(`${this.apiUrl}/movies`);
  }


  //api dan dizileri çek
  getAllSeries(): Observable<any> {
    return this.http.get(`${this.apiUrl}/series`);
  }


  //api dan oyuncuları çek
  getAllActors(): Observable<any> {
    return this.http.get(`${this.apiUrl}/actors`);
  }

}
