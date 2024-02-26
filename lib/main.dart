import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/common/data/cart_repository.dart';
import 'package:grocery_task/common/data/wishlist_repository.dart';
import 'package:grocery_task/common/presentation/cart_controller.dart';
import 'package:grocery_task/common/presentation/wishlist_controller.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';
import 'package:grocery_task/features/overview/data/product_repository.dart';
import 'package:grocery_task/features/overview/presentation/controllers/category_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/product_controller.dart';
import 'package:grocery_task/grocery_app.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(
          create: (context) => ProductController(
            productRepository: ProductRepository(),
          ),
        ),
        ChangeNotifierProvider<CategoryController>(
          create: (context) => CategoryController(
            categoryRepository: CategoryRepository(),
          ),
        ),
        ChangeNotifierProvider<CartController>(
          create: (context) => CartController(cartRepository: CartRepository()),
        ),
        ChangeNotifierProvider<WishlistController>(
          create: (context) =>
              WishlistController(wishlistRepository: WishlistRepository()),
        ),
      ],
      child: const GroceryApp(),
    ),
  );
}
