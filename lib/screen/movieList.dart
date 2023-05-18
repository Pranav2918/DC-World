import 'package:dcworld/controller/foodController.dart';
import 'package:dcworld/controller/movieController.dart';
import 'package:dcworld/screen/foodItems.dart';
import 'package:dcworld/screen/movieDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  final MovieController movieController =
      Get.put(MovieController()); //Initialize declared controller

  final FoodController foodController = Get.put(FoodController());
  MoviesPage({super.key});

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
            child: GetBuilder<MovieController>(
              builder: (controller) {
                return Column(
                  children: [
                    GetBuilder<FoodController>(builder: (controller) {
                      return TextButton(
                          onPressed: () {
                            foodController.fetchFoodItems();
                            Get.to(FoodItemPage());
                          },
                          child: const Text(
                            "See Food Items",
                            style: TextStyle(color: Colors.white),
                          ));
                    }),
                    controller.isClicked.value
                        ? Expanded(
                          child: GridView.builder(
                              itemCount: controller.movieList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(MovieDetails(
                                          index: index,
                                          movieDetails: controller.movieList));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Hero(
                                                tag: index,
                                                child: Image.network(controller
                                                    .movieList[index].poster!))),
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              controller.movieList[index].title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                        )
                        : Center(
                            child: TextButton(
                                onPressed: () {
                                  controller.isClicked.value = true;
                                  controller.fetchMovies();
                                  controller.update();
                                },
                                child: const Text(
                                  "See All Movies",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                  ],
                );
              },
            )));
  }
}
