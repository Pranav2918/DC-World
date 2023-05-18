import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/movieDataModel.dart';

class MovieController extends GetxController {
  final movieList = <Search>[].obs; //To store movie data
  final isClicked = false.obs; 

  //Fetch Movie
  fetchMovies() async {
    String baseUrl = "https://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa";
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      movieList.value = list.map((movie) => Search.fromJson(movie)).toList();
      update(); //To update value of variable
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
