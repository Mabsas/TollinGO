import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//About information input


// ignore: camel_case_types
class intropage2 extends StatefulWidget {
  const intropage2({super.key});

  @override
  State<intropage2> createState() => _intropage2State();
}

// ignore: camel_case_types
class _intropage2State extends State<intropage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro7.jpg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const Text('Set and Roll',textAlign:TextAlign.start,style: TextStyle(fontSize:70,fontFamily:'OriginalSurfer'),textDirection: TextDirection.ltr),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Select your vehicle kind and fill up required information.That''s it ,you are ready to ROLLLLLL!!!',
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(fontSize: 20,fontFamily:'OleoScriptSwashCaps-Regular'),
            ),
          ),



          // inserting animation
          Lottie.asset('assets/intro_animations/Animation6.json',
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
