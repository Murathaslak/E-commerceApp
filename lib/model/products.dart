import 'package:flutter/material.dart';

class Product {
  String image;
  String title;
  int price;
  double star;
  bool isSaved;
  String descTitle;
  String descDetail;
  List<Color> color;

  Product(
      {required this.image,
      required this.title,
      required this.price,
      required this.star,
      required this.isSaved,
      required this.descTitle,
      required this.descDetail,
      required this.color});
}
