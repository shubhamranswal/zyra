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
        price: 140,
        title: 'Add to Cart',
        press: () {
          Provider.of<CartProvider>(context, listen: false).addItem(CartItem(
            productId: "111",
            title: "Sleeveless Ruffle",
            image: "https://i.imgur.com/CGCyp1d.png",
            price: 140,
            brandName: "LIPSY LONDON",
          ));
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
              images: [productDemoImg1, productDemoImg2, productDemoImg3],
            ),
            const ProductInfo(
              brand: "LIPSY LONDON",
              title: "Sleeveless Ruffle",
              description:
                  "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
              rating: 4.4,
              numOfReviews: 126,
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
                        price: 145,
                        priceAfterDiscount: 134.7,
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
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: index == 4 ? defaultPadding : 0),
                    child: ProductCard(
                      image: productDemoImg2,
                      title: "Sleeveless Tiered Dobby Swing Dress",
                      brandName: "LIPSY LONDON",
                      price: 24.65,
                      priceAfterDiscount: index.isEven ? 20.99 : null,
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
