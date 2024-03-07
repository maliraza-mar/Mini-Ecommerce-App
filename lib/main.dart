import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:minimal_ecommerce_app/pages/cart_screen.dart';
import 'package:minimal_ecommerce_app/pages/intro_page.dart';
import 'package:minimal_ecommerce_app/pages/shop_screen.dart';
import 'package:minimal_ecommerce_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      theme: lightMode,
      routes: {
        '/intro_screen': (context) => const IntroScreen(),
        '/shop_screen': (context) => const ShopScreen(),
        '/cart_screen': (context) => const CartScreen(),
      },
    );
  }
}

