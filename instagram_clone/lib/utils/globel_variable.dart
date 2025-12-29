import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

//const means variable that cannot be changed
//here data type of webscreensize is integer
const webscreensize = 600;
final homescreenitems = [
  FeedScreen(),
  Text('search'),
  Addpostscreen(),
  Text('notifications'),
  Text('profile'),
];
