import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// About TollinGo

// ignore: camel_case_types
class intropage1 extends StatefulWidget {
  const intropage1({super.key});

  @override
  State<intropage1> createState() => _intropage1State();
}

// ignore: camel_case_types
class _intropage1State extends State<intropage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //inserting background image
          image: DecorationImage(
              image: AssetImage('assets/intro/intro8.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // inserting animation
          Lottie.asset('assets/intro_animations/Animation1.json',
              height: 300,
              alignment: Alignment.center,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover),

              //For app name
              /*const Text('TollinGo',textAlign:TextAlign.end,style: TextStyle(fontSize:100,fontFamily:'Inspiration'),),*/

              //for the last sentence 
             const  Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Text('Effortlessly clear tolls in an instant making every journey smooth.......',textAlign:TextAlign.end,style: TextStyle(fontSize:30,fontFamily:'PatrinckHand'),), ),

        ],
      ),
    );
  }
}
