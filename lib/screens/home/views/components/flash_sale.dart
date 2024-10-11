import 'package:flutter/material.dart';
import 'package:zyra/route/route_constants.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../dummyData.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          image:
              "https://as1.ftcdn.net/v2/jpg/05/60/05/22/1000_F_560052254_42BMBsDhwjv4YQwMXBUPvurHIj4Ct8RM.jpg",
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: menProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == menProducts.length - 1 ? defaultPadding : 0,
              ),
              child: ProductCard(
                image: menProducts[index].image,
                brandName: menProducts[index].brandName,
                title: menProducts[index].title,
                price: menProducts[index].price,
                priceAfterDiscount: menProducts[index].priceAfterDiscount,
                discountPercent: menProducts[index].discountPercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
