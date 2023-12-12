import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//About Tracking

// ignore: camel_case_types
class intropage7 extends StatelessWidget {
  const intropage7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro9.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Let''s Get Started!!!',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                  fontSize: 100, fontFamily: 'Inspiration'),
            ),
          ),

          // inserting animation
          Lottie.asset('assets/intro_animations/Animation9.json',
              height: 300,
              alignment: Alignment.center,
              repeat: true,
              //reverse: true,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}
