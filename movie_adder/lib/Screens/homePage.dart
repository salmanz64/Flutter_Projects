import 'package:flutter/material.dart';
import 'package:movie_adder/Components/movieDialog.dart';
import 'package:movie_adder/Model/movie.dart';
import 'package:movie_adder/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import '../Components/movieCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Adder")),
      backgroundColor: Colors.grey[700],
      body: Consumer<MovieProvider>(builder: (context, movieProvider, child) {
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: movieProvider.movies.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Movie movie = movieProvider.movies[index];
            return MovieCard(
              index: index,
              movieName: movie.name,
              genre: movie.genre,
              date: movie.releaseDate,
              rating: movie.rating,
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add a new movie
            showDialog(
              context: context,
              builder: (context) {
                return MovieDialog(
                  editMode: false,
                );
              },
            );
          },
          child: Text("+")),
    );
  }
}
