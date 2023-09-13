import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    const colorizeColors = [
      Colors.black45,
      Colors.black87,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 60.0,
      fontFamily: 'Comic',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/agriculture.jpg',
              width: 170,
              height: 170,
            ),
            SizedBox(
          width: 250.0,
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'AgriLease',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        )

          ],
        )
      ),
    );
  }
}