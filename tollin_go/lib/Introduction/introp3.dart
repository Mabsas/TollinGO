import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


//About Scan Payment

// ignore: camel_case_types
class intropage3 extends StatefulWidget {
  const intropage3({super.key});

  @override
  State<intropage3> createState() => _intropage3State();
}

// ignore: camel_case_types
class _intropage3State extends State<intropage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro5.jpg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const Text('Scan and pay',textAlign:TextAlign.start,style: TextStyle(fontSize:70,fontFamily:'OriginalSurfer'),textDirection: TextDirection.ltr),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Say goodbye to the hassle of multiple steps! Our scan option empowers you to finish your transaction seamlessly in just one go, making it a breeze.',
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(fontSize: 20,fontFamily:'OleoScriptSwashCaps-Regular'),
            ),
          ),



          // inserting animation
          Lottie.asset('assets/intro_animations/Animation2.json',
              height: 400,
              alignment: Alignment.center,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}