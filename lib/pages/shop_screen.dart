import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_drawer.dart';
import 'package:minimal_ecommerce_app/components/my_product_tile.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // -- access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
            icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: ListView(
        children: [
          // -- shop title
          const SizedBox(height: 25,),

          // -- shop subTitle
          Center(
            child: Text('Pick from a Selected List of Premium Products',
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          // -- product list
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // -- get each individual product from shop
                  final product = products[index];

                  // -- return as a product tile UI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
