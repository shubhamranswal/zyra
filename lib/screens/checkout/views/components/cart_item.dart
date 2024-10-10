import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/network_image_with_loader.dart';
import '../../../../constants.dart';
import '../../../../provider/cart_provider.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.productId,
    required this.quantity,
  });
  final String image, brandName, title, productId;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(256, 114),
          maximumSize: const Size(256, 114),
          padding: const EdgeInsets.all(8)),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                NetworkImageWithLoader(image, radius: defaultBorderRadious),
              ],
            ),
          ),
          const SizedBox(width: defaultPadding / 4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10),
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ),
                  Text(
                    "₹$price x $quantity",
                    style: const TextStyle(
                      color: Color(0xFF31B0D8),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 8),
          AspectRatio(
            aspectRatio: 0.5,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    cartProvider.incrementQuantity(productId);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cartProvider.decrementQuantity(productId);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
