import 'package:flutter/material.dart';
import 'package:zyra/components/product/secondary_product_card.dart';

import '../../../../constants.dart';
import '../../../../dummyData.dart';
import '../../../../route/route_constants.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
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
            "Most popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 114,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == popularProducts.length - 1 ? defaultPadding : 0,
              ),
              child: SecondaryProductCard(
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
