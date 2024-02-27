import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/common/domain/product_badge.dart';

class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.colorValue,
    this.category,
    this.badge,
  });

  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final int colorValue;

  final ProductBadge? badge;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "imageAsset": imageAsset,
      "colorValue": colorValue,
      "badge": badge?.toMap(),
    };
  }

  factory Product.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError("Dokument has no context");

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final price = data["price"];

    return Product(
      name: data["name"],
      description: data["description"],
      // price: double.parse(price),
      price: double.parse(price.toString()),
      imageAsset: data["imageAsset"],
      colorValue: data["colorValue"],
      badge: ProductBadge.fromMap(data["badge"]),
    );
  }
}
