import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/galery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  late String description;
  late String tags;
  late CategoryModel category;
  late DateTime createdAt;
  late DateTime updateAt;
  late List<GalleryModel> galleries;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.tags,
      required this.category,
      required this.createdAt,
      required this.updateAt,
      required this.galleries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    // object
    category = CategoryModel.fromJson(json['category']);
    createdAt = DateTime.parse(json['createdAt']);
    updateAt = DateTime.parse(json['updateAt']);
    // array harus di map
    galleries = json['galleries']
        .map((gallery) => GalleryModel.fromJson(gallery))
        .toList();
  }

  // function toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'createdAt': createdAt.toString(),
      'updateAt': updateAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }
}
