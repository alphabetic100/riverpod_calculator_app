import 'package:flutter/material.dart';
import 'package:riverpod_calculator_app/src/core/constant/asset_constants/font_family/font_family.dart';
import 'package:riverpod_calculator_app/src/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: FontFamily.instance.mincraft,
        useMaterial3: true,
      ),
    );
  }
}
