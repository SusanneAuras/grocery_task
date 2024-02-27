import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/overview/data/product_repository.dart';

class ProductController extends ChangeNotifier {
  ProductController({required productRepository})
      : _productsRepository = productRepository {
    _listenForProducts();
  }

  final ProductRepository _productsRepository;
  final List<Product> _products = [];

  List<Product> get products => _products;

  void _listenForProducts() {
    _productsRepository.products.listen((event) {
      _products.clear();
      _products.addAll(event);
      notifyListeners();
    });
  }

  void resetProducts() async {
    _productsRepository.deleteProductsFromFirestore();
    _productsRepository.saveProductsToFirestore();
  }
}
