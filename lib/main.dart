import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';
import 'package:instagram_flutter/screens/main_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(129, 46),
            backgroundColor: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 12,
            fontFamily: 'GB',
            color: greyColor,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            color: pinkColor,
            fontFamily: 'GB',
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: whitColor,
            fontFamily: 'GB',
          ),
        ),
      ),
      home:MainScreen(),
    );
  }
}
