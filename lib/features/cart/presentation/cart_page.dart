import 'package:flutter/cupertino.dart';
import 'package:grocery_task/features/cart/presentation/cart_item.dart';
import 'package:grocery_task/features/overview/presentation/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: cartController.cartProducts.length,
        itemBuilder: (context, index) =>
            CartItem(cartProduct: cartController.cartProducts[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
      ),
    );
  }
}
