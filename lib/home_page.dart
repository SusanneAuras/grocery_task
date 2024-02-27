import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/features/cart/presentation/cart_page.dart';
import 'package:grocery_task/features/overview/presentation/controllers/cart_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/product_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/wishlist_controller.dart';
import 'package:grocery_task/features/overview/presentation/overview_page.dart';
import 'package:grocery_task/features/wishlist/presentation/wishlist_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final wishlistController = context.watch<WishlistController>();
    final productController = context.watch<ProductController>();

    return GestureDetector(
      onDoubleTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5F9),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: <Widget>[
            const OverviewPage(),
            const CartPage(),
            const WishlistPage(),
          ][currentScreenIndex],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              productController.resetProducts();
            },
            child: const Text("Reset")),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currentScreenIndex,
          onTap: (value) => setState(() {
            currentScreenIndex = value;
          }),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text(cartController.totalItems.toString()),
                child: const Icon(CupertinoIcons.cart),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                  label: Text(wishlistController.products.length.toString()),
                  child: const Icon(CupertinoIcons.heart)),
              label: 'Wishlist',
            ),
          ],
        ),
      ),
    );
  }
}
