import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _controller = TextEditingController();

  String? _movieGenre;

  String? _movieName;

  String? _movieYear;

  int? _movieRating;

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, movieCard, child) {
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
                        : "${movieCard.movies[widget.index!][0]}"),
              ),
              Row(
                children: [
                  Text("Genre: "),
                  DropdownButton(
                      value: widget.editMode == false
                          ? _movieGenre
                          : movieCard.movies[widget.index!][1],
                      hint: Text("Choose genre"),
                      items: ["Action", "Scifi", "Romance", "Comedy", "Drama"]
                          .map((genre) => DropdownMenuItem(
                                child: Text(genre),
                                value: genre,
                              ))
                          .toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _movieGenre = newVal as String?;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text("Release Date: "),
                  ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2026));
                        if (pickedDate != null) {
                          setState(() {
                            _movieYear =
                                DateFormat("MM/dd/yyyy").format(pickedDate);
                          });
                        }
                      },
                      child: _movieYear == null
                          ? widget.editMode == false
                              ? Text("Choose Date")
                              : Text("${movieCard.movies[widget.index!][2]}")
                          : Text("$_movieYear"))
                ],
              ),
              Row(
                children: [
                  Text("Rating: "),
                  DropdownButton(
                      hint: Text("choose Rating"),
                      value: widget.editMode == false
                          ? _movieRating
                          : movieCard.movies[widget.index!][3],
                      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                          .map((rating) => DropdownMenuItem(
                                child: Text(rating.toString()),
                                value: rating,
                              ))
                          .toList(),
                      onChanged: (newVale) {
                        setState(() {
                          _movieRating = newVale as int?;
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
                _movieName = _controller.text;
                widget.editMode == false
                    ? Provider.of<CardModel>(context, listen: false)
                        .insertMovie(
                            name: _movieName,
                            movieGenre: _movieGenre,
                            movieReleaseDate: _movieYear,
                            rating1: _movieRating)
                    : Provider.of<CardModel>(context, listen: false).editMovie(
                        index: widget.index!,
                        name: _movieName,
                        movieGenre: _movieGenre,
                        movieReleaseDate: _movieYear,
                        rating1: _movieRating);

                MovieDialog(
                  editMode: false,
                );

                Navigator.of(context).pop();
              },
              child: Text("Save")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"))
        ],
      );
    });
  }
}
