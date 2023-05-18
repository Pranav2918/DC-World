import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/movieDataModel.dart';

class MovieDetails extends StatelessWidget {
  final int index;
  final List<Search> movieDetails;
  const MovieDetails(
      {super.key, required this.index, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text(movieDetails[index].title!,
              style: const TextStyle(color: Colors.white))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: index, child: Image.network(movieDetails[index].poster!)),
            const SizedBox(height: 25.0),
            Text(
              movieDetails[index].year!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 12.0),
            Text(
              movieDetails[index].title!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
