import 'package:flutter/material.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/overview/presentation/controllers/cart_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/wishlist_controller.dart';
import 'package:provider/provider.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Provider.of<CartController>(context);
    final WishlistController wishlistController =
        Provider.of<WishlistController>(context);

    final cartProductCount = cartController.getQuantityForProduct(product);
    final isFavorite = wishlistController.containsProduct(product);

    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.badge != null)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(product.badge!.colorValue).withOpacity(0.2),
                    ),
                    child: Text(
                      product.badge!.name,
                      style: TextStyle(
                        color: Color(product.badge!.colorValue),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  wishlistController.toggleProduct(product);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                  color: isFavorite ? Colors.red : null,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(product.colorValue),
                      radius: 50,
                    ),
                    Positioned(
                      bottom: -15,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        product.imageAsset,
                        width: 150,
                        height: 75,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.green),
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Divider(),
          if (cartProductCount > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    cartController.removeProduct(product);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(cartProductCount.toString()),
                IconButton(
                  onPressed: () {
                    cartController.addProduct(product);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          else
            TextButton(
              onPressed: () {
                cartController.addProduct(product);
              },
              child: const Text('Add to cart'),
            ),
        ],
      ),
    );
  }
}
