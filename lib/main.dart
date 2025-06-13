import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_calculator_app/src/core/constant/asset_constants/font_family/font_family.dart';
import 'package:riverpod_calculator_app/src/routes/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
