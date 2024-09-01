import 'package:flutter/material.dart';
import 'package:movie_adder/Model/CardModel.dart';
import 'package:provider/provider.dart';

import 'movieDialog.dart';

class MovieCard extends StatelessWidget {
  String movieName;
  String genre;
  String date;
  int rating;
  int? index;
  MovieCard(
      {super.key,
      this.index,
      required this.movieName,
      required this.genre,
      required this.date,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        height: 150,
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Movie: $movieName",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("Genre: $genre"),
                    Text("Release Date: $date"),
                    Text("Rating: $rating"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return MovieDialog(
                                index: index,
                                editMode: true,
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          Provider.of<CardModel>(context, listen: false)
                              .deleteMovie(index: index);
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
