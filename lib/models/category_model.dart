// To parse this JSON data, do
//     final categoryModelList = categoryModelListFromJson(jsonString);

import 'dart:convert';

CategoryModelList categoryModelListFromJson(String str) {
  final jsonData = json.decode(str);
  return CategoryModelList.fromJson(jsonData);
}

String categoryModelListToJson(CategoryModelList data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class CategoryModelList {
  List<Category> category;

  CategoryModelList({
    required this.category,
  });

  factory CategoryModelList.fromJson(Map<String, dynamic> json) =>
      CategoryModelList(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  String name;
  List<SubCategory> subCategory;

  Category({
    required this.name,
    required this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subCategory: List<SubCategory>.from(json["subCategory"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subCategory": List<dynamic>.from(subCategory.map((x) => x)),
      };
}

class SubCategory {
  String name;
  SubCategory({
    required this.name,
  });
  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
