import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/responsive/mobilescreen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/webscreen_layout.dart';
import 'package:instagram_clone/screens/loginscreen.dart';
import 'package:instagram_clone/screens/signupscren.dart';
import 'package:instagram_clone/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDYypFjvAOu4uljIFZ3KvF2TWz-yakHTdk",
        appId: "1:437900791932:web:4dba1e8ae1c7b8f99339f9",
        messagingSenderId: "437900791932",
        projectId: "instagram-clone-final-96850",
        storageBucket: "instagram-clone-final-96850.firebasestorage.app",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await Supabase.initialize(
    url: 'https://zlhuqmmpqxfmbwoqvtmo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpsaHVxbW1wcXhmbWJ3b3F2dG1vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY0MTExMTgsImV4cCI6MjA4MTk4NzExOH0.QOmZSKtv0McdoPFrvQesNqLGSTEQmDHtZ0GAgU0FkU4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider()..refreshUser(),),],
      child: MaterialApp(
        //this the banner that shows up in the top of the app
        debugShowCheckedModeBanner: false,
        //title here means the name of the app or title of the app
        title: 'Instagram Clone',
        //theme here means the overall look of the app
        //copyWith means we are copying the dark theme and changing the scaffoldBackgroundColor
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: /*Signupscreen(),*/ LoginScreen(), // ResponsiveLayout(
        //   webscreenlayout: WebscreenLayout(),
        //   mobilescreenlayout: MobilescreenLayout(),
        // ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          //snapshot means the current state of the stream which denote whether the user is logged in or not
          builder: (context, snapshot) {
            //snapshot.connectionState means the current connection state of the stream , active means the stream is active and has data means the user is logged in and we have user data , haserror means there is an error in the stream and user is not logged in
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  webscreenlayout: WebscreenLayout(),
                  mobilescreenlayout: MobilescreenLayout(),
                );
              }
              // why .hasError because if there is an error in the stream we want to show the error message to the user
              else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
            // If the connection state is neither active nor waiting, return a login screen
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
