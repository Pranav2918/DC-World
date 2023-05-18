import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    int count;
    List<Recipe> recipes;

    FoodModel({
        required this.count,
        required this.recipes,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        count: json["count"],
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
    };
}

class Recipe {
    String publisher;
    String title;
    String sourceUrl;
    String recipeId;
    String imageUrl;
    double socialRank;
    String publisherUrl;

    Recipe({
        required this.publisher,
        required this.title,
        required this.sourceUrl,
        required this.recipeId,
        required this.imageUrl,
        required this.socialRank,
        required this.publisherUrl,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        publisher: json["publisher"],
        title: json["title"],
        sourceUrl: json["source_url"],
        recipeId: json["recipe_id"],
        imageUrl: json["image_url"],
        socialRank: json["social_rank"]?.toDouble(),
        publisherUrl: json["publisher_url"],
    );

    Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "title": title,
        "source_url": sourceUrl,
        "recipe_id": recipeId,
        "image_url": imageUrl,
        "social_rank": socialRank,
        "publisher_url": publisherUrl,
    };
}
