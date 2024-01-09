import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tollin_go/Introduction/screenview.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:const  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ Color.fromARGB(255, 31, 75, 114),
                Color.fromARGB(255, 56, 166, 245),
                Color.fromARGB(255, 173, 216, 230),],
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedSplashScreen(
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/intro_animations/afia.json',
                  height: 200,
                  alignment: Alignment.center,
                  repeat: true,
                  reverse: true,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'TollinGo',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Cinzel'),
                  ),
                ),
              ],
            ),
            nextScreen: const screenview(),
            splashIconSize: 250,
            duration: 7000,
            animationDuration: const Duration(seconds: 2),
            backgroundColor: Colors.transparent, // Set the background color to transparent
          ),
        ),
      ],
    );
  }
}
