import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier{
  // -- Products for Sale
  final List<Product> _shop = [
    // -- Product 1
    Product(
      name: 'Product 1',
      price: 99.99,
      description: 'Item Description.. more Description........',
      imagePath: 'assets/images/glasses.png'
    ),
    // -- Product 2
    Product(
      name: 'Product 2',
      price: 99.99,
      description: 'Item Description..',
      imagePath: 'assets/images/hoodie.png'
    ),
    // -- Product 3
    Product(
      name: 'Product 3',
      price: 99.99,
      description: 'Item Description..',
      imagePath: 'assets/images/shoes.png'
    ),
    // -- Product 4
    Product(
      name: 'Product 4',
      price: 99.99,
      description: 'Item Description.. ',
      imagePath: 'assets/images/watch.png'
    ),
  ];

  // -- User Cart
  final List<Product> _cart = [];

  // -- get product list
  List<Product> get shop => _shop;

  // -- get user cart
List<Product> get cart => _cart;

  // -- add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // -- remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}
