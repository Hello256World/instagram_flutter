import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/switch_account_shape.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          width: 340,
                          height: 352,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 32),
                              Image.asset('images/switch_account_user.png'),
                              SizedBox(height: 20),
                              Text(
                                'AmirahmadAdibi',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Confirm',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                              ),
                              SizedBox(height: 32),
                              Text(
                                'Switch Account',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 132),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ? / ',
                  style: TextStyle(color: greyColor),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(color: whitColor),
                ),
              ],
            ),
            SizedBox(height: 63),
          ],
        ),
      ),
    );
  }
}
