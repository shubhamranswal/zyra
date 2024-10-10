import 'package:flutter/material.dart';
import 'package:zyra/route/route_constants.dart';
import 'package:zyra/route/router.dart' as router;
import 'package:zyra/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

// Thanks for using our template. You are using the free version of the template.
// 🔗 Full template: https://theflutterway.gumroad.com/l/flutterzyra

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zyra Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: entryPointScreenRoute,
    );
  }
}
