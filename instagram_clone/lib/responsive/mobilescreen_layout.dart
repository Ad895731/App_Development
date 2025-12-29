import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/utils/color.dart';
import 'package:instagram_clone/utils/globel_variable.dart';
import 'package:provider/provider.dart';

class MobilescreenLayout extends StatefulWidget {
  // here it is constructor of MobilescreenLayout class and it is used to create an object of MobilescreenLayout class
  //super.key is used to pass the key to the parent class StatelessWidget , super.key is a named parameter of StatelessWidget class that is used to identify the widget in the widget tree and it is optional
  const MobilescreenLayout({super.key});

  @override
  State<MobilescreenLayout> createState() => _MobilescreenLayoutState();
}

class _MobilescreenLayoutState extends State<MobilescreenLayout> {
  // String username = "";
  // @override
  // void initState() {
  //   // initState is a method that is called when the widget is inserted into the widget tree , it is used to initialize the state of the widget and super .initState() is used to call the initState method of the parent class StatefulWidget, super is used to refer to the parent class, here parent class is StatefulWidget
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  model.User user = Provider.of<UserProvider>(context).getUser;
    // final userProvider = Provider.of<UserProvider>(context);
    // final model.User? user = userProvider.getUser;

    // if (user == null) {
    //   return const Scaffold(body: Center(child: CircularProgressIndicator()));
    // }
    return Scaffold(
      body: PageView(
        children: homescreenitems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
