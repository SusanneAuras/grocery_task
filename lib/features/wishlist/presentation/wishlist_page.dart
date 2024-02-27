import 'package:flutter/cupertino.dart';
import 'package:grocery_task/features/overview/presentation/controllers/wishlist_controller.dart';
import 'package:grocery_task/features/wishlist/presentation/wishlist_item.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = context.watch<WishlistController>();
    final products = wishlistController.products;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) => WishlistItem(product: products[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
      ),
    );
  }
}
