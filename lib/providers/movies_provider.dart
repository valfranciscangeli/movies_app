import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Moviesprovider inicializado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() {
    print('GetOndisplayMovies');
  }
}
