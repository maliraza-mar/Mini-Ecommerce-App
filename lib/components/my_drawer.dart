import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_list_tile.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // -- Drawer Header : Logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25,),

              // -- Shop Tile
              MyListTile(
                  title: 'Shop',
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
              ),

              // -- Cart Tile
              MyListTile(
                  title: 'Cart',
                  icon: Icons.shopping_cart,
                  onTap: (){
                    // -- pop drawer first
                    Navigator.pop(context);

                    // -- goto cart screen
                    Navigator.pushNamed(context, '/cart_screen');
                  }
              ),
            ],
          ),

          // -- Exit Shop
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
                title: 'Exit',
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_screen', (route) => false)
            ),
          ),
        ],
      ),
    );
  }
}
