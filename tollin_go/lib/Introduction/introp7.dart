import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//About Tracking

// ignore: camel_case_types
class intropage7 extends StatefulWidget {
  const intropage7({super.key});

  @override
  State<intropage7> createState() => _intropage7State();
}

// ignore: camel_case_types
class _intropage7State extends State<intropage7> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro4.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Let''s Get Started With TollinGo!!!',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                  fontSize: 50, fontFamily: 'OriginalSurfer'),
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
