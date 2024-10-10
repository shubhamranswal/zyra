import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../route/route_constants.dart';

class PhoneAuth {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static User? user = FirebaseAuth.instance.currentUser;

  static Future<void> login(BuildContext context, String otp) async {
    if (otp == '1234') {
      Navigator.pop(context);
      UserCredential userCredential = await auth.signInAnonymously();
      user = userCredential.user;
      if (user != null) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, entryPointScreenRoute);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect OTP')),
      );
    }
  }

  static Future<void> logout(BuildContext context) async {
    await auth.signOut();
    user = null;
    Navigator.pushReplacementNamed(context, logInScreenRoute);
  }
}
