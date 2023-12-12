import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


// About Cash In


// ignore: camel_case_types
class intropage4 extends StatelessWidget {
  const intropage4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro7.jpg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const Text('App Wallet',textAlign:TextAlign.start,style: TextStyle(fontSize:70,fontFamily:'OriginalSurfer'),textDirection: TextDirection.ltr),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Empower your wallet with the touch of modern banking! Add cash with unparalleled ease through bank agents, mobile transactions, or our diversified banking systems, putting financial control right where it belongs – in your hands.',
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(fontSize: 20,fontFamily:'OleoScriptSwashCaps-Regular'),
            ),
          ),



          // inserting animation
          Lottie.asset('assets/intro_animations/Animation8.json',
              height: 300,
              alignment: Alignment.center,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}