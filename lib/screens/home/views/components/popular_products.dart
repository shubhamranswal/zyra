import 'package:flutter/material.dart';
import 'package:zyra/components/product/product_card.dart';
import 'package:zyra/route/screen_export.dart';

import '../../../../constants.dart';
import '../../../../dummyData.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
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
            "Popular products",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: popularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == popularProducts.length - 1 ? defaultPadding : 0,
              ),
              child: ProductCard(
                image: popularProducts[index].image,
                brandName: popularProducts[index].brandName,
                title: popularProducts[index].title,
                price: popularProducts[index].price,
                priceAfterDiscount: popularProducts[index].priceAfterDiscount,
                discountPercent: popularProducts[index].discountPercent,
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
