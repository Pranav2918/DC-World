import 'dart:convert';

import 'package:dcworld/screen/movieDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/movieDataModel.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Search> movieList = <Search>[];
  @override
  void initState() {
    populateMovies();
    super.initState();
  }

  populateMovies() async {
    final movies = await fetchMovies();
    setState(() {
      movieList = movies;
    });
  }

  Future<List<Search>> fetchMovies() async {
    String baseUrl = "https://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa";
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Search.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: const Text("DC World!"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: movieList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetails(
                            index: index, movieDetails: movieList)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Hero(
                              tag: index,
                              child: Image.network(movieList[index].poster!))),
                      Center(
                        child: SizedBox(
                          width: 150,
                          child: Text(
                            movieList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
