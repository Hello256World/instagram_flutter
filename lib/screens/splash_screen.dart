import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        image: DecorationImage(
          image: AssetImage('images/background_pattern.png'),
          fit: BoxFit.fitWidth,
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Center(
                child: Image(
                  image: AssetImage('images/logo.png'),
                  width: 155,
                  height: 77,
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      'Expert Flutter',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
