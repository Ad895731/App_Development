import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/color.dart';
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
  @override
  //dispose method is used to dispose the controllers when the widget is removed from the widget tree to free up resources
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
              Flexible(flex: 2, child: Container()),
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
              // text field input for password
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordcontroller,
                isPass: true,
              ),
              //button for login
              //transition to signup screen ? because we are in login screen and we need a way to go to signup screen
            ],
          ),
        ),
      ),
    );
  }
}
