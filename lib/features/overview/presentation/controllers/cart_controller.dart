import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/data/cart_repository.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/cart/domain/cart_product.dart';

class CartController extends ChangeNotifier {
  CartController({required CartRepository cartRepository})
      : _cartRepository = cartRepository {
    _listenForCartProducts();
  }

  final CartRepository _cartRepository;
  final List<CartProduct> _cartProducts = [];

  /// Returns the CartProducts (product + quantity) in the cart.
  List<CartProduct> get cartProducts => _cartProducts;

  /// Returns the distinct products in the cart.
  List<Product> get products => _cartProducts.map((e) => e.product).toList();

  /// Returns the total number of items in the cart (sum of the quantities of all products).
  int get totalItems => _cartProducts.fold(0, (prev, cp) => prev + cp.quantity);

  void addProduct(Product product) async {
    await _cartRepository.addProduct(product);
    notifyListeners();
  }

  void removeProduct(Product product) async {
    await _cartRepository.removeProduct(product);
    notifyListeners();
  }

  int getQuantityForProduct(Product product) =>
      _cartProducts
          .where((cp) => cp.product == product)
          .singleOrNull
          ?.quantity ??
      0;

  bool containsProduct(Product product) =>
      _cartProducts.any((cp) => cp.product == product);

  void _listenForCartProducts() {
    _cartRepository.cartProducts.listen((event) {
      _cartProducts.clear();
      _cartProducts.addAll(event);
      notifyListeners();
    });
  }
}
