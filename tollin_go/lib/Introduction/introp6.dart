import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//About Tracking

// ignore: camel_case_types
class intropage6 extends StatelessWidget {
  const intropage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro18.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Navigate',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 70, fontFamily: 'OriginalSurfer'),
              textDirection: TextDirection.ltr),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Take control of your journey with our cutting-edge vehicle tracking system. Monitor your vehicle'
              's location anytime, anywhere, putting the power of real-time tracking in the palm of your hands.',
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                  fontSize: 20, fontFamily: 'OleoScriptSwashCaps-Regular'),
            ),
          ),

          // inserting animation
          Lottie.asset('assets/intro_animations/Animation4.json',
              height: 450,
              alignment: Alignment.center,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}
