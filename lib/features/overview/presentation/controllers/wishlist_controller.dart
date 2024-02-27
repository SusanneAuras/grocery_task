import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/data/wishlist_repository.dart';
import 'package:grocery_task/common/domain/product.dart';

class WishlistController extends ChangeNotifier {
  WishlistController({required wishlistRepository})
      : _wishlistRepository = wishlistRepository {
    _listenForWishlistProducts();
  }

  final WishlistRepository _wishlistRepository;
  final List<Product> _wishlistProducts = [];

  List<Product> get products => _wishlistProducts;

  void addProduct(Product product) {
    _wishlistRepository.addProduct(product);
    notifyListeners();
  }

  void removeProduct(Product product) async {
    _wishlistRepository.removeProduct(product);
    notifyListeners();
  }

  bool containsProduct(Product product) => _wishlistProducts.contains(product);

  void toggleProduct(Product product) {
    if (containsProduct(product)) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
    notifyListeners();
  }

  void _listenForWishlistProducts() {
    _wishlistRepository.products.listen((event) {
      _wishlistProducts.clear();
      _wishlistProducts.addAll(event);
      notifyListeners();
    });
  }
}
