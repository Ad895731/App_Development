import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:shop_app/global_variable.dart';
// import 'package:shop_app/product_card.dart';
// import 'package:shop_app/product_details_page.dart';
// import 'package:shop_app/product_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //we updated somethngh at other palce and data is sotred in someother place that's a cool thingh about provider package
    //final cart = Provider.of<CartProvider>(context).cart;
    //shortline of above
    //what does this line mean context.watch<CartProvider>()?? and why we used .cart here ???
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              radius: 35,
              backgroundColor: Colors.white,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text('Are sure want to remove the product ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(
                              cartItem,
                            );
                            // Provider.of<CartProvider>(
                            //   context,
                            //   listen: false,
                            // ).removeProduct(cartItem);
                            Navigator.of(context).pop();
                           },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
