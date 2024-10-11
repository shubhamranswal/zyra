import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zyra/components/cart_button.dart';
import 'package:zyra/components/custom_modal_bottom_sheet.dart';
import 'package:zyra/components/product/product_card.dart';
import 'package:zyra/constants.dart';
import 'package:zyra/route/screen_export.dart';
import 'package:zyra/screens/product/views/product_returns_screen.dart';
import 'package:zyra/screens/product/views/size_guide_screen.dart';

import '../../../components/review_card.dart';
import '../../../models/cart_model.dart';
import '../../../provider/cart_provider.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import 'components/product_quantity.dart';
import 'components/selected_colors.dart';
import 'components/selected_size.dart';
import 'components/unit_price.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _productQuantity = 1;
  int _productSize = 1;
  int _productColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CartButton(
        price: 749,
        title: 'Add to Cart',
        press: () {
          Provider.of<CartProvider>(context, listen: false).addItem(CartItem(
              productId: "DEMO1",
              title: "Men's Tee",
              image:
                  "https://m.media-amazon.com/images/I/715nVGPTQaL._AC_UY1100_.jpg",
              price: 749,
              brandName: "PUMA",
              quantity: _productQuantity));
          Navigator.pushNamed(context, addedToCard);
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ],
            ),
            const ProductImages(
              images: [
                "https://m.media-amazon.com/images/I/715nVGPTQaL._AC_UY1100_.jpg",
                "https://m.media-amazon.com/images/I/51C-pA9bk9L._SX466_.jpg",
                "https://m.media-amazon.com/images/I/61IeOb701hL._SX466_.jpg",
                "https://m.media-amazon.com/images/I/51UXY25jRuL._SX466_.jpg",
                "https://m.media-amazon.com/images/I/51fvl5ProLL._SX466_.jpg"
              ],
            ),
            const ProductInfo(
              brand: "PUMA",
              title: "Men's Tee",
              description:
                  "Make your game smarter, faster, and better in modern sporting staples equipped with the latest in our innovative athletic technology.",
              rating: 4.2,
              numOfReviews: 1258,
            ),
            const SliverToBoxAdapter(child: Divider()),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: UnitPrice(
                        price: 800,
                        priceAfterDiscount: 749,
                      ),
                    ),
                    ProductQuantity(
                      numOfItem: _productQuantity,
                      onIncrement: () {
                        setState(() {
                          _productQuantity += 1;
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          _productQuantity -= 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Divider()),
            SliverToBoxAdapter(
              child: SelectedColors(
                colors: const [
                  Color(0xFFEA6262),
                  Color(0xFFB1CC63),
                  Color(0xFFFFBF5F),
                  Color(0xFF9FE1DD),
                  Color(0xFFC482DB),
                ],
                selectedColorIndex: _productColor,
                press: (value) {
                  setState(() {
                    _productColor = value;
                  });
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SelectedSize(
                sizes: const ["S", "M", "L", "XL", "XXL"],
                selectedIndex: _productSize,
                press: (value) {
                  setState(() {
                    _productSize = value;
                  });
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: defaultPadding),
              sliver: ProductListTile(
                title: "Size guide",
                svgSrc: "assets/icons/Sizeguid.svg",
                isShowBottomBorder: false,
                press: () {
                  customModalBottomSheet(
                    context,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const SizeGuideScreen(),
                  );
                },
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductReturnsScreen(),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: () {
                Navigator.pushNamed(context, productReviewsScreenRoute);
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: index == 2 ? defaultPadding : 0),
                    child: ProductCard(
                      image:
                          "https://m.media-amazon.com/images/I/51fvl5ProLL._SX466_.jpg",
                      title: "Puma Men's T-short",
                      brandName: "PUMA",
                      price: 999,
                      priceAfterDiscount: index.isEven ? 749 : null,
                      discountPercent: index.isEven ? 25 : null,
                      press: () {},
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
