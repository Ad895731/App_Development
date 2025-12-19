import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata', 'Puma'];
  late String detectfilters;
  //what does currentpage do ?? it is used to keep track of the current selected page in the bottom navigation bar what =1 mean ?? it means that the second item in the bottom navigation bar is selected because the index starts from 0
  late int currentpage = 0 /*1*/;
  @override
  void initState() {
    super.initState();
    detectfilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final border = OutlineInputBorder(
      // borderRadius: BorderRadius.all(
      //   Radius.elliptical(50, 50),

      // topLeft: Radius.circular(30),
      //bottomLeft: Radius.circular(30),
      //topRight: Radius.circular(30),
      //bottomRight: Radius.circular(30),
      borderSide: BorderSide(color: Color.fromRGBO(192, 175, 175, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
        //right: Radius.circular(30),
      ),
    );
    {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Shoes\nCollection',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  // SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        //Icon is widget here and Icons is class here
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        //we did this because we want to override the global theme which was defined in main.dart
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    ///SizedBox(height: 100);
                    final filter = filters[index];
                    return Container(
                      //if we wrap with gesturedetector to conatiner it will detect for whole while using it with only chip will only deetct when we click different chip
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      // decoration: BoxDecoration(
                      //   //color: Colors.grey[300],
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      child: GestureDetector(
                        onTap: () {
                          //print(1);
                          setState(() {
                            detectfilters = filter;
                          });
                        },
                        child: Chip(
                          padding: EdgeInsets.all(10),
                          label: Text(filter),
                          labelStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          side: BorderSide(
                            color: Color.fromRGBO(202, 214, 216, 0.5),
                            //width: 1,
                          ),
                          backgroundColor: detectfilters == filter
                              ? Color.fromRGBO(
                                  252,
                                  244,
                                  2,
                                  1,
                                ) /*Theme.of(context).colorscheme.primary*/
                              : Color.fromRGBO(238, 241, 241, 0.498),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                          //elevation: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: GridView.builder(
              //     itemCount: products.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemBuilder: (c, i) {
              //       final product = products[i];
              //       return GestureDetector(
              //         onTap: () {
              //           //context will search for ancestoral widget ????
              //           // we use pushreplacement when did want to go back to previous screen used mainly for authentication
              //           Navigator.of(
              //             context,
              //           ).push /*here we can use different pop or pushreplacement */ (
              //             //context here will search for ????
              //             MaterialPageRoute(
              //               builder: (context) {
              //                 return ProductDetailsPage(product: product);
              //               },
              //             ),
              //           );
              //         },
              //         child: ProductCard(
              //           title: product['title'].toString(),
              //           price: product['price'] as double,
              //           image: product['imageUrl'] as String,
              //           backgroundColor: i % 2 != 0
              //               ? Color.fromRGBO(201, 228, 233, 0.494)
              //               : Color.fromRGBO(221, 241, 252, 1),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //we did not used sizedbox because we do not know what height should be given because of variable height of image and other stuff so we use expapnded which will eventually auto select height
              // Expanded(
              //   child: size.width > 650
              //       ? GridView.builder(
              //           itemCount: products.length,
              //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             childAspectRatio: 2,
              //           ),
              //           itemBuilder: (c, i) {
              //             final product = products[i];
              //             return GestureDetector(
              //               onTap: () {
              //                 //context will search for ancestoral widget ????
              //                 // we use pushreplacement when did want to go back to previous screen used mainly for authentication
              //                 Navigator.of(
              //                   context,
              //                 ).push /*here we can use different pop or pushreplacement */ (
              //                   //context here will search for ????
              //                   MaterialPageRoute(
              //                     builder: (context) {
              //                       return ProductDetailsPage(product: product);
              //                     },
              //                   ),
              //                 );
              //               },
              //               child: ProductCard(
              //                 title: product['title'].toString(),
              //                 price: product['price'] as double,
              //                 image: product['imageUrl'] as String,
              //                 backgroundColor: i % 2 != 0
              //                     ? Color.fromRGBO(201, 228, 233, 0.494)
              //                     : Color.fromRGBO(221, 241, 252, 1),
              //               ),
              //             );
              //           },
              //         )
              //       : ListView.builder(
              //           //scrollDirection: Axis.vertical,
              //           itemCount: products.length,
              //           itemBuilder: (context, index) {
              //             final product = products[index];
              //             return GestureDetector(
              //               onTap: () {
              //                 //context will search for ancestoral widget ????
              //                 // we use pushreplacement when did want to go back to previous screen used mainly for authentication
              //                 Navigator.of(
              //                   context,
              //                 ).push /*here we can use different pop or pushreplacement */ (
              //                   //context here will search for ????
              //                   MaterialPageRoute(
              //                     builder: (context) {
              //                       return ProductDetailsPage(product: product);
              //                     },
              //                   ),
              //                 );
              //               },
              //               child: ProductCard(
              //                 title: product['title'].toString(),
              //                 price: product['price'] as double,
              //                 image: product['imageUrl'] as String,
              //                 backgroundColor: index % 2 != 0
              //                     ? Color.fromRGBO(201, 228, 233, 0.494)
              //                     : Color.fromRGBO(221, 241, 252, 1),
              //               ),
              //             );
              //             //Container(
              //             //   //Text('product:[0]['title']'),
              //           },
              //         ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 1080) {
                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (c, i) {
                          final product = products[i];
                          return GestureDetector(
                            onTap: () {
                              //context will search for ancestoral widget ????
                              // we use pushreplacement when did want to go back to previous screen used mainly for authentication
                              Navigator.of(
                                context,
                              ).push /*here we can use different pop or pushreplacement */ (
                                //context here will search for ????
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'].toString(),
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundColor: i % 2 != 0
                                  ? Color.fromRGBO(201, 228, 233, 0.494)
                                  : Color.fromRGBO(221, 241, 252, 1),
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        //scrollDirection: Axis.vertical,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              //context will search for ancestoral widget ????
                              // we use pushreplacement when did want to go back to previous screen used mainly for authentication
                              Navigator.of(
                                context,
                              ).push /*here we can use different pop or pushreplacement */ (
                                //context here will search for ????
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'].toString(),
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundColor: index % 2 != 0
                                  ? Color.fromRGBO(201, 228, 233, 0.494)
                                  : Color.fromRGBO(221, 241, 252, 1),
                            ),
                          );
                          //Container(
                          //   //Text('product:[0]['title']'),
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
