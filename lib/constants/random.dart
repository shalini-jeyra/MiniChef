// To parse this JSON data, do
//
//     final mobile = mobileFromJson(jsonString);

import 'dart:convert';
Mobile mobileFromJson(String str) => Mobile.fromJson(json.decode(str));
String mobileToJson(Mobile data) => json.encode(data.toJson());

class Mobile {
    Mobile({
        this.name,
        this.picture,
        this.category,
        this.ingredients,
        this.type,
        this.steps,
        this.ownerId,
        this.description,
        this.itemId,
        this.video,
    });

    String name;
    String picture;
    String category;
    List<String> ingredients;
    String type;
    List<String> steps;
    String ownerId;
    String description;
    int itemId;
    String video;

    factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        name: json["name"],
        picture: json["picture"],
        category: json["category"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        type: json["type"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        ownerId: json["owner_id"],
        description: json["description"],
        itemId: json["item_id"],
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "picture": picture,
        "category": category,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "type": type,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "owner_id": ownerId,
        "description": description,
        "item_id": itemId,
        "video": video,
    };
}

List<CategoryBeverages> categoryBeveragesFromJson(String str) =>
    List<CategoryBeverages>.from(
        json.decode(str).map((x) => CategoryBeverages.fromJson(x)));

String categoryBeveragesToJson(List<CategoryBeverages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryBeverages {
  CategoryBeverages({
    this.video,
    this.type,
    this.ingredients,
    this.itemId,
    this.category,
    this.picture,
    this.steps,
    this.ownerId,
    this.description,
    this.name,
  });

  String video;
  Type type;
  List<String> ingredients;
  int itemId;
  Category category;
  String picture;
  List<String> steps;
  OwnerId ownerId;
  String description;
  String name;

  factory CategoryBeverages.fromJson(Map<String, dynamic> json) =>
      CategoryBeverages(
        video: json["video"],
        type: typeValues.map[json["type"]],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        itemId: json["item_id"],
        category: categoryValues.map[json["category"]],
        picture: json["picture"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        ownerId: ownerIdValues.map[json["owner_id"]],
        description: json["description"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "video": video,
        "type": typeValues.reverse[type],
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "item_id": itemId,
        "category": categoryValues.reverse[category],
        "picture": picture,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "owner_id": ownerIdValues.reverse[ownerId],
        "description": description,
        "name": name,
      };
}

enum Category { BEVERAGES }

final categoryValues = EnumValues({"beverages": Category.BEVERAGES});

enum OwnerId { MURALIKRISHNA_GMAIL_COM, ASHLIN_YAHOO_COM }

final ownerIdValues = EnumValues({
  "ashlin@yahoo.com": OwnerId.ASHLIN_YAHOO_COM,
  "muralikrishna@gmail.com": OwnerId.MURALIKRISHNA_GMAIL_COM
});

enum Type { VEG, NON_VEG, TYPE_VEG }

final typeValues = EnumValues(
    {"Non Veg": Type.NON_VEG, " Veg": Type.TYPE_VEG, "Veg": Type.VEG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
