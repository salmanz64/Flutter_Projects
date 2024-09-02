// providers/movie_provider.dart

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../Model/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  void addMovie({Movie? movie}) {
    _movies.add(movie!);
    notifyListeners();
  }

  void editMovie({Movie? movie, int? index}) {
    _movies[index!] = movie!;
    notifyListeners();
  }

  void deleteMovie({int? index}) {
    _movies.removeAt(index!);
    notifyListeners();
  }
}
