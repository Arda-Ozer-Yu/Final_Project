import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `<div></div>`,
  styleUrls: ['./login-page.css']
})
export class LoginPage {
  // login
  loginEmail: string = '';
  loginPassword: string = '';

  // register
  firstName: string = '';
  lastName: string = '';
  registerEmail: string = '';
  registerPassword: string = '';
  registerPasswordConfirm: string = '';
  country: string = '';
  city: string = '';
  selectedPhoto: File | null = null;

  // fotoğraf
  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.selectedPhoto = input.files[0];
    }
  }


  // şifre kontrolü
  register(): void {
    if (this.registerPassword !== this.registerPasswordConfirm) {
      alert('Şifreler uyuşmuyor');
      return;
    }

    if (this.registerPassword.length < 8) {
      alert('Şifre en az 8 karakter olmalı!');
      return;
    }

    console.log('Kayıt Bilgileri:', {
      firstName: this.firstName,
      lastName: this.lastName,
      email: this.registerEmail,
      password: this.registerPassword,
      country: this.country,
      city: this.city,
      photo: this.selectedPhoto
    });
  }
}
