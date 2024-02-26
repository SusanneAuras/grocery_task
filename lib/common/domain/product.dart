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

  factory Product.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
    return Product(
        name: data['name'] as String,
        price: data['price'] as double,
        colorValue: data['colorValue'] as int,
        badge: data['badge'],
        category: data['category'],
        description: data['description'] as String,
        imageAsset: data['imageAsset'] as String);
  }

  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final int colorValue;

  final ProductBadge? badge;
}

class DocumentSnapshot {
  data() {}
}

