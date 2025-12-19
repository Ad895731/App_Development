import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return //Padding(
    //padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
    /* child:*/ Container(
      padding: EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium, //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5),
          //???what is first $ here?
          Text(
            '\$$price',
            style: Theme.of(context)
                .textTheme
                .bodySmall /*style: TextStyle(fontWeight: FontWeight.bold)*/,
          ),
          //imageprovider is abstaract class because we can pass different kind of images form our app file to web so it's expanded for different work
          SizedBox(height: 5),
          //A shorter option of doing the same thing
          //Image.asset(image, height: 175),
          Center(child: Image(image: AssetImage(image), height: 200)),
        ],
      ),
    );
  }
}
