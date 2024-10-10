import 'package:flutter/material.dart';
import 'package:zyra/constants.dart';
import 'package:zyra/models/product_model.dart';
import 'package:zyra/screens/discover/views/components/search_form.dart';

import '../../../components/product/product_card.dart';
import '../../../components/product/secondary_product_card.dart';
import '../../../route/route_constants.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String _searchQuery = '';
  bool _isGridView = false;
  List<ProductModel> allProducts = demoPopularProducts +
      demoBestSellersProducts +
      kidsProducts +
      demoFlashSaleProducts;

  @override
  Widget build(BuildContext context) {
    final filteredProducts = allProducts.where((product) {
      return product.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(_isGridView ? Icons.list : Icons.grid_view),
        onPressed: () {
          setState(() {
            _isGridView = !_isGridView;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SearchForm(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value ?? "";
                  });
                },
              ),
            ),
            Expanded(
              child: _isGridView
                  ? _buildGridView(filteredProducts)
                  : _buildListView(filteredProducts),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(List<ProductModel> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          left: index % 2 == 0 ? defaultPadding : 0,
          right: index % 2 == 1 ? defaultPadding : 0,
        ),
        child: ProductCard(
          image: products[index].image,
          brandName: products[index].brandName,
          title: products[index].title,
          price: products[index].price,
          priceAfterDiscount: products[index].priceAfterDiscount,
          discountPercent: products[index].discountPercent,
          press: () {
            Navigator.pushNamed(context, productDetailsScreenRoute,
                arguments: index);
          },
        ),
      ),
    );
  }

  Widget _buildListView(List<ProductModel> products) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: SecondaryProductCard(
              image: products[index].image,
              brandName: products[index].brandName,
              title: products[index].title,
              price: products[index].price,
              priceAfterDiscount: products[index].priceAfterDiscount,
              discountPercent: products[index].discountPercent,
              press: () {
                Navigator.pushNamed(context, productDetailsScreenRoute,
                    arguments: index);
              },
            ),
          )),
    );
  }
}
