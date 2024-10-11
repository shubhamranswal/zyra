import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zyra/components/product/product_card.dart';
import 'package:zyra/route/route_constants.dart';

import '../../../constants.dart';
import '../../../dummyData.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.66,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(
                    image: popularProducts[index].image,
                    brandName: popularProducts[index].brandName,
                    title: popularProducts[index].title,
                    price: popularProducts[index].price,
                    priceAfterDiscount:
                        popularProducts[index].priceAfterDiscount,
                    discountPercent: popularProducts[index].discountPercent,
                    press: () {
                      Navigator.pushNamed(context, productDetailsScreenRoute);
                    },
                  );
                },
                childCount: popularProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
