import 'package:flutter/material.dart';
import 'package:zyra/entry_point.dart';

import 'screen_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onboardingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
    case logInScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case productDetailsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsScreen(),
      );
    case productReviewsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ProductReviewsScreen(),
      );
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case discoverScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const DiscoverScreen(),
      );
    case onSaleScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnSaleScreen(),
      );
    case bookmarkScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const BookmarkScreen(),
      );
    case entryPointScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EntryPoint(),
      );
    case profileScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
    case viewProfileScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ViewProfileScreen(),
      );
    case cartScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const CartScreen(),
      );
    case addedToCard:
      return MaterialPageRoute(
          builder: (context) => const AddedToCartMessageScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
  }
}
