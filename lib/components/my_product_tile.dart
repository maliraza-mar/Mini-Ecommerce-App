import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';


class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});

  final Product product;

  // add to cart button Pressed
  void addToCart(BuildContext context){
    // -- show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Add this item to your cart?'),
        actions: [
          // -- cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // -- yes button
          MaterialButton(
            onPressed: () {
              // -- pop dialog box
              Navigator.pop(context);

              // -- add to cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text('Yes'),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Product Image
              AspectRatio(
                aspectRatio: 1.1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(height: 25,),

              // -- Product Name
              Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10,),

              // -- Product description
              Text(product.description,
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
            ],
          ),
          const SizedBox(height: 25,),

          // -- Product Price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // -- Product Price
              Text('\$${product.price.toStringAsFixed(2)}'),

              // -- Add to Cart Button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
