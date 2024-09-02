// ignore_for_file: prefer_if_null_operators, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_adder/Model/movie.dart';
import 'package:movie_adder/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieDialog extends StatefulWidget {
  int? index;
  bool? editMode;
  MovieDialog({super.key, this.index, this.editMode});

  @override
  State<MovieDialog> createState() => _MovieDialogState();
}

class _MovieDialogState extends State<MovieDialog> {
  final _controller = TextEditingController();

  String? _newGenre;

  String? _newName;

  String? _newReleaseDate;

  int? _newRating;
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      return AlertDialog(
        title: Text(
            widget.editMode == false ? "Add a new movie" : "Edit the Movie"),
        content: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: widget.editMode == false
                        ? "Enter movie name"
                        : movieProvider.movies[widget.index!].name),
              ),
              Row(
                children: [
                  const Text("Genre: "),
                  DropdownButton(
                      value: _newGenre == null
                          ? widget.editMode == true
                              ? movieProvider.movies[widget.index!].genre
                              : _newGenre
                          : _newGenre,
                      hint: const Text("Choose genre"),
                      items: ["Action", "Scifi", "Romance", "Comedy", "Drama"]
                          .map((genre) => DropdownMenuItem(
                                value: genre,
                                child: Text(genre),
                              ))
                          .toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _newGenre = newVal;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  const Text("Release Date: "),
                  ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2026));
                        if (pickedDate != null) {
                          setState(() {
                            _newReleaseDate =
                                DateFormat("MM/dd/yyyy").format(pickedDate);
                          });
                        }
                      },
                      child: _newReleaseDate == null
                          ? widget.editMode == false
                              ? const Text("Choose Date")
                              : Text(movieProvider
                                  .movies[widget.index!].releaseDate)
                          : Text("$_newReleaseDate"))
                ],
              ),
              Row(
                children: [
                  const Text("Rating: "),
                  DropdownButton(
                      hint: const Text("choose Rating"),
                      value: _newRating == null
                          ? widget.editMode == true
                              ? movieProvider.movies[widget.index!].rating
                              : _newRating
                          : _newRating,
                      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                          .map((rating) => DropdownMenuItem(
                                value: rating,
                                child: Text(rating.toString()),
                              ))
                          .toList(),
                      onChanged: (newVale) {
                        setState(() {
                          _newRating = newVale;
                        });
                      })
                ],
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                // Add the new movie to the list
                _newName = _controller.text;
                widget.editMode == false
                    ? Provider.of<MovieProvider>(context, listen: false)
                        .addMovie(
                            movie: Movie(
                        name: _newName!,
                        genre: _newGenre!,
                        releaseDate: _newReleaseDate!,
                        rating: _newRating!,
                      ))
                    : Provider.of<MovieProvider>(context, listen: false)
                        .editMovie(
                            movie: Movie(
                              name: _newName!,
                              genre: _newGenre!,
                              releaseDate: _newReleaseDate!,
                              rating: _newRating!,
                            ),
                            index: widget.index);

                MovieDialog(
                  editMode: false,
                );

                Navigator.of(context).pop();
              },
              child: const Text("Save")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"))
        ],
      );
    });
  }
}
