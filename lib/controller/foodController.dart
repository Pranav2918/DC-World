import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/foodModel.dart';

class FoodController extends GetxController {
  final foodItem = <Recipe>[].obs;

  //Fetch Food Items
  fetchFoodItems() async {
    String baseUrl = "https://forkify-api.herokuapp.com/api/search?q=pizza#";
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["recipes"];
      foodItem.value = list.map((movie) => Recipe.fromJson(movie)).toList();
      update(); //To update value of variable
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
