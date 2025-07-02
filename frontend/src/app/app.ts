import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Navbar } from './components/navbar/navbar';
import { HomePage } from './pages/home-page/home-page';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,Navbar,],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected title = 'frontend';
}
