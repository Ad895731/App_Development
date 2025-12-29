import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/responsive/mobilescreen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/webscreen_layout.dart';
import 'package:instagram_clone/screens/signupscren.dart';
import 'package:instagram_clone/utils/color.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/Text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //why _emailcontroller is private? to prevent other classes from accessing it directly
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;
  @override
  //dispose method is used to dispose the controllers when the widget is removed from the widget tree to free up resources
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethod().loginUser(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );
  //here if res == "success" then show success message else show error message here context will be used to show the snackbar 
    if (res == "success") {
      showSnackBar("Logged in successfully", context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
                webscreenlayout: WebscreenLayout(),
                mobilescreenlayout: MobilescreenLayout(),
              )
        ),
      );
    } else {
      showSnackBar(res, context); // show actual error
    }
    setState(() {
      _isloading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Signupscreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea is used to avoid notches and status bars at the top of the screen
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            //why center? to center the column vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //flexible widget to give space at the top
              Flexible(flex: 10, child: Container()),
              //svg image for instagram logo . what is svg? Scalable Vector Graphics is a vector image format for two-dimensional graphics with support for interactivity and animation.more info: https://developer.mozilla.org/en-US/docs/Web/SVG
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                // ignore: deprecated_member_use
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              //text field input for email
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailcontroller,
              ),
              const SizedBox(height: 24),
              // text field input for password
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordcontroller,
                //ispass true because we want to hide the password ispass means is password and use to hide the password using obscureText
                isPass: true,
              ),
              SizedBox(height: 24),
              //button for login
              InkWell(
                onTap: loginUser,
                child: _isloading
                    ? Center(
                        child: CircularProgressIndicator(color: primaryColor),
                      )
                    : Container(
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
              ),
              //transition to signup screen ? because we are in login screen and we need a way to go to signup screen
              const SizedBox(height: 12),
              Flexible(flex: 10, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text("Don't have an account?"),
                  ),
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
