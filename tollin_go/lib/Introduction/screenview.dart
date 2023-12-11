import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tollin_go/Introduction/introp1.dart';
import 'package:tollin_go/Introduction/introp2.dart';
import 'package:tollin_go/Introduction/introp3.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class screenview extends StatelessWidget {
  
  screenview({super.key});

  // indicator of which page we are on 
  final PageController _controller = PageController();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(

          controller: _controller,

          children: const [
          intropage1(),
          intropage2(),
          intropage3(),
        ]),

        //page indicator sign
        Container(

          alignment: const Alignment(0,0.9),
          child: SmoothPageIndicator(controller: _controller, count: 3))
      ],
    )

        //dot indicator

        );
  }
}
