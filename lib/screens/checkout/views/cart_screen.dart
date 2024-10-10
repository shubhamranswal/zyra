import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/cart_provider.dart';
import 'components/cart_item.dart';
import 'empty_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      bottomNavigationBar: cartProvider.items.isEmpty
          ? const EmptyCartScreen()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: ₹${cartProvider.totalAmount}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
      body: cartProvider.items.isEmpty
          ? const EmptyCartScreen()
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final item = cartProvider.items[index];
                return CartListItem(
                    image: item.image,
                    brandName: item.brandName,
                    title: item.title,
                    price: item.price,
                    quantity: item.quantity,
                    productId: item.productId);
              },
            ),
    );
  }
}
