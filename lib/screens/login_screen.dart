import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff323A99),
                Color(0xffF98BFC),
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          child: Image(
            image: AssetImage('images/login_rocket.png'),
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
              bottom: Radius.zero,
            ),
            color: blackColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Sign in to ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'GB',
                      color: whitColor,
                    ),
                  ),
                  Image.asset('images/moodinger_logo.png')
                ],
              ),
              SizedBox(height: 26.0),
              SizedBox(
                width: 340,
                height: 46,
                child: TextField(
                  focusNode: focusNode1,
                  cursorHeight: 20,
                  style: TextStyle(
                    fontSize: 14,
                    color: whitColor,
                    fontFamily: 'GM',
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 26.0, vertical: 35.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: pinkColor,
                        width: 3.0,
                      ),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: focusNode1.hasFocus ? pinkColor : whitColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 340,
                height: 46,
                child: TextField(
                  focusNode: focusNode2,
                  cursorHeight: 20,
                  style: TextStyle(
                    fontSize: 14,
                    color: whitColor,
                    fontFamily: 'GM',
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 26.0, vertical: 35.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: pinkColor,
                        width: 3.0,
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: focusNode2.hasFocus ? pinkColor : whitColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}
