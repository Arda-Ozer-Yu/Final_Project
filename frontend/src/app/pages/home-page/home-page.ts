import { Component } from '@angular/core';
import { Slider } from '../../components/slider/slider';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';


@Component({
  selector: 'app-home-page',
  standalone: true,
  imports: [CommonModule, HttpClientModule, Slider],
  templateUrl: './home-page.html',
  styleUrls: ['./home-page.css']
})
export class HomePage {}
