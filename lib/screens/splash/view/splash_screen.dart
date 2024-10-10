import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zyra/control/auth/phone_auth.dart';

import '../../../route/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    Timer(const Duration(seconds: 3), () {
      if (PhoneAuth.user == null) {
        Navigator.pushReplacementNamed(context, onboardingScreenRoute);
      } else {
        Navigator.pushReplacementNamed(context, entryPointScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
