import 'package:flutter/material.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/cart/domain/cart_product.dart';
import 'package:grocery_task/features/overview/presentation/controllers/cart_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/wishlist_controller.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartProduct,
  });

  final CartProduct cartProduct;
  Product get product => cartProduct.product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Provider.of<CartController>(context);
    final WishlistController wishlistController =
        Provider.of<WishlistController>(context);

    final isFavorite = wishlistController.containsProduct(product);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(children: [
        if (product.badge != null)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(product.badge!.colorValue).withOpacity(0.2),
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(10)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    wishlistController.toggleProduct(product);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartController.addProduct(product);
                  },
                  icon: const Icon(Icons.add),
                ),
                Text(cartProduct.quantity.toString()),
                IconButton(
                  onPressed: () {
                    cartController.removeProduct(product);
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
