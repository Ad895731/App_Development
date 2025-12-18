import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [ProductList(), CartPage()];
  // final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata', 'Puma'];
  // late String detectfilters;
  //what does currentpage do ?? it is used to keep track of the current selected page in the bottom navigation bar what =1 mean ?? it means that the second item in the bottom navigation bar is selected because the index starts from 0
  late int currentpage = 0 /*1*/;
  // @override
  // void initState() {
  //   super.initState();
  //   detectfilters = filters[0];
  // }

  @override
  Widget build(BuildContext context) {
    // final border = OutlineInputBorder(
    //   // borderRadius: BorderRadius.all(
    //   //   Radius.elliptical(50, 50),

    //   // topLeft: Radius.circular(30),
    //   //bottomLeft: Radius.circular(30),
    //   //topRight: Radius.circular(30),
    //   //bottomRight: Radius.circular(30),
    //   borderSide: BorderSide(color: Color.fromRGBO(192, 175, 175, 1)),
    //   borderRadius: BorderRadius.horizontal(
    //     left: Radius.circular(30),
    //     //right: Radius.circular(30),
    //   ),
    // );
    return Scaffold(
      body: //currentpage == 0 ? ProductList() : CartPage(),
      IndexedStack(
        index: currentpage,
        children: pages,
      ),
      //SafeArea is used to avoid notches and other screen intrusions and provide a padding to the content and keep it within safe area of the screen
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Text(
      //               'Shoes\nCollection',
      //               style: Theme.of(context).textTheme.titleLarge,
      //             ),
      //           ),
      //           // SizedBox(width: 20),
      //           Expanded(
      //             child: TextField(
      //               controller: TextEditingController(),
      //               decoration: InputDecoration(
      //                 //Icon is widget here and Icons is class here
      //                 prefixIcon: Icon(Icons.search),
      //                 hintText: 'Search',
      //                 //we did this because we want to override the global theme which was defined in main.dart
      //                 border: border,
      //                 enabledBorder: border,
      //                 focusedBorder: border,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 80,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: filters.length,
      //           itemBuilder: (context, index) {
      //             ///SizedBox(height: 100);
      //             final filter = filters[index];
      //             return Container(
      //               //if we wrap with gesturedetector to conatiner it will detect for whole while using it with only chip will only deetct when we click different chip
      //               padding: EdgeInsets.symmetric(horizontal: 10),
      //               // decoration: BoxDecoration(
      //               //   //color: Colors.grey[300],
      //               //   borderRadius: BorderRadius.circular(20),
      //               // ),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   //print(1);
      //                   setState(() {
      //                     detectfilters = filter;
      //                   });
      //                 },
      //                 child: Chip(
      //                   padding: EdgeInsets.all(10),
      //                   label: Text(filter),
      //                   labelStyle: TextStyle(
      //                     fontSize: 17,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   side: BorderSide(
      //                     color: Color.fromRGBO(202, 214, 216, 0.5),
      //                     //width: 1,
      //                   ),
      //                   backgroundColor: detectfilters == filter
      //                       ? Color.fromRGBO(
      //                           252,
      //                           244,
      //                           2,
      //                           1,
      //                         ) /*Theme.of(context).colorscheme.primary*/
      //                       : Color.fromRGBO(238, 241, 241, 0.498),
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadiusGeometry.circular(30),
      //                   ),
      //                   //elevation: 20,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //       //we did not used sizedbox because we do not know what height should be given because of variable height of image and other stuff so we use expapnded which will eventually auto select height
      //       Expanded(
      //         child: ListView.builder(
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
      //       ),
      //     ],
      //   ),
      // ),
      //label must be mention and can be null no problem
      //bottom navigation bar is used to navigate between different pages in the app like home page , cart page etc. , it is a widget which is placed at the bottom of the screen and contains different items which can be tapped to navigate to different pages
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        //what is showSelectedLabels and showUnselectedLabels ?? it is used to show or hide the labels of the selected and unselected items in the bottom navigation bar . here both are false so no labels will be shown
        //what is selectedFontSize and unselectedFontSize ?? it is used to set the font size of the selected and unselected items in the bottom navigation bar . here both are 0 so no labels will be shown , what seleteditem and unselecteditem ?? seleteditem is the item which is currently selected in the bottom navigation bar and unselecteditem is the item which is not selected in the bottom navigation bar
        selectedFontSize: 00,
        unselectedFontSize: 00,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],

        //what is currentIndex ?? currentIndex is used to highlight the current selected item in the bottom navigation bar .how? by giving it an index of the item which is selected and how we give index? by using a variable which stores the index of the selected item which variable? currentpage . what is relation between currentIndex and currentpage? now when we tap on any item in bottom navigation bar what happens? onTap function is called which gives the index of the item which is tapped and we set that index to currentpage variable using setState which rebuilds the widget and highlights the selected item in bottom navigation bar
        currentIndex: currentpage,
        onTap: (index) {
          setState(() {
            currentpage = index;
          });
        },
      ),
    );
  }
}
