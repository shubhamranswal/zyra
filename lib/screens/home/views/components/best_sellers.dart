import 'package:flutter/material.dart';
import 'package:zyra/components/product/product_card.dart';
import 'package:zyra/models/product_model.dart';

import '../../../../constants.dart';
import '../../../../route/route_constants.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Best sellers",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoBestSellersProducts on models/ProductModel.dart
            itemCount: demoBestSellersProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoBestSellersProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                image: demoBestSellersProducts[index].image,
                brandName: demoBestSellersProducts[index].brandName,
                title: demoBestSellersProducts[index].title,
                price: demoBestSellersProducts[index].price,
                priceAfterDiscount:
                    demoBestSellersProducts[index].priceAfterDiscount,
                discountPercent: demoBestSellersProducts[index].discountPercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
