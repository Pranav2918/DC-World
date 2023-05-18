import 'package:dcworld/controller/foodController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodItemPage extends StatelessWidget {
  final FoodController foodItemController = Get.put(FoodController());
  FoodItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: foodItemController.foodItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  foodItemController.foodItem[index].imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
                title: Text(
                  foodItemController.foodItem[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  foodItemController.foodItem[index].publisher,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              );
            });
      }),
    );
  }
}
