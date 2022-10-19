import 'dart:convert';

List<CoffeeResponse> coffeeResponseFromJson(String str) =>
    List<CoffeeResponse>.from(
        json.decode(str).map((x) => CoffeeResponse.fromJson(x)));

String coffeeResponseToJson(List<CoffeeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoffeeResponse {
  CoffeeResponse({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  String title;
  String description;
  List<String> ingredients;
  String image;
  int id;

  factory CoffeeResponse.fromJson(Map<String, dynamic> json) => CoffeeResponse(
        title: json["title"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "image": image,
        "id": id,
      };
}
