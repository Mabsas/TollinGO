import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


//About Emergency balance


// ignore: camel_case_types
class intropage5 extends StatefulWidget {
  const intropage5({super.key});

  @override
  State<intropage5> createState() => _intropage5State();
}

// ignore: camel_case_types
class _intropage5State extends State<intropage5> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro6.jpg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const Text('Crisis Credit ',textAlign:TextAlign.start,style: TextStyle(fontSize:70,fontFamily:'OriginalSurfer'),textDirection: TextDirection.ltr),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'In times of financial pinch, experience the freedom to stay connected with our exclusive Quick Loan service, ensuring uninterrupted access and peace of mind when your account balance runs low. Your connectivity is our commitment!',
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              //textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(fontSize: 20,fontFamily:'OleoScriptSwashCaps-Regular'),
            ),
          ),



          // inserting animation
          Lottie.asset('assets/intro_animations/Animation10.json',
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