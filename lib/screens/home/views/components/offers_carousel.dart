import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zyra/components/Banner/M/banner_m_style_1.dart';
import 'package:zyra/components/Banner/M/banner_m_style_2.dart';
import 'package:zyra/components/Banner/M/banner_m_style_3.dart';
import 'package:zyra/components/Banner/M/banner_m_style_4.dart';
import 'package:zyra/components/dot_indicators.dart';

import '../../../../constants.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List
  List offers = [
    BannerMStyle1(
      image:
          "https://t4.ftcdn.net/jpg/04/15/97/33/360_F_415973312_5yg3MrkRdi2SMHyVKbB4h7GgE5HrgUlb.jpg",
      text: "New items with \nFree shipping",
      press: () {},
    ),
    BannerMStyle2(
      image:
          "https://sallyfaye.co.uk/wp-content/uploads/2020/09/6CB008CD-F1A1-42F1-8774-07B6951D547B.jpeg",
      title: "Black \nfriday",
      subtitle: "Collection",
      discountPercent: 50,
      press: () {},
    ),
    BannerMStyle3(
      image:
          "https://img.freepik.com/premium-photo/fashion-banner-template-with-photo_641503-271534.jpg",
      title: "Grab \nyours now",
      discountPercent: 50,
      press: () {},
    ),
    BannerMStyle4(
      image:
          "https://as1.ftcdn.net/v2/jpg/05/60/05/22/1000_F_560052254_42BMBsDhwjv4YQwMXBUPvurHIj4Ct8RM.jpg",
      title: "SUMMER \nSALE",
      subtitle: "SPECIAL OFFER",
      discountPercent: 80,
      press: () {},
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
