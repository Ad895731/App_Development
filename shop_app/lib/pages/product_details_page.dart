import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
//import 'package:shop_app/global_variable.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  //late  List<int> size;
  const ProductDetailsPage({
    super.key,
    required this.product,
    //required this.size,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int checksize = 0;
  //late int checksize = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   checksize == widget.product['sizes'];
  // }
  // onTap is out of the build function so that if we are out side of build function we should use listen:false
  void ontap() {
    if (checksize != 0) {
      Provider.of<CartProvider>
          //listen:false means we are not listening to changes in the cart provider
          //buildcontext here is exact is exact same as build context down and this is because it is provided by state class which is present in StatefulWidget
          (context, listen: false)
          .addProduct({
            'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product[ /*'\$$'price''*/ 'price'],
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company'],
            'size': checksize,
          });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Added to cart!')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select the size!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        //titleTextStyle: TextStyle('detail'),
        //backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,
            ),
          ),
          Spacer(flex: 2),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(248, 249, 251, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                //size = product['sizes'],
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checksize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: checksize == size
                                ? Color.fromRGBO(238, 226, 4, 1)
                                : Color.fromRGBO(248, 251, 255, 1),
                            side: BorderSide(
                              color: Color.fromRGBO(58, 58, 58, 1),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: ontap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(350, 50),
                    ),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 20,
                    ),
                    //ButtonStyle(icon: Icons.shopping_cart),
                    label: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    //style: ButtonStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
