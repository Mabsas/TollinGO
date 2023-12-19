import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tollin_go/Introduction/introp1.dart';
import 'package:tollin_go/Introduction/introp2.dart';
import 'package:tollin_go/Introduction/introp3.dart';
import 'package:tollin_go/Introduction/introp4.dart';
import 'package:tollin_go/Introduction/introp5.dart';
import 'package:tollin_go/Introduction/introp6.dart';
import 'package:tollin_go/Introduction/introp7.dart';

// ignore: camel_case_types
class screenview extends StatefulWidget {
  const screenview({super.key});

  @override
  State<screenview> createState() => _screenviewState();
}

// ignore: camel_case_types
class _screenviewState extends State<screenview> {
  // indicator of which page we are on
  final PageController _pagecontroller = PageController();

  bool onLastPage = false;
  // keeping last page record
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _pagecontroller,
              onPageChanged: (index) {
                //keeping track of page number
                setState(() {
                  onLastPage = (index == 7);
                });
              },
              children: const [
                intropage1(),
                intropage2(),
                intropage3(),
                intropage4(),
                intropage5(),
                intropage6(),
                intropage7(),
              ]),

          //page indicator sign
          Container(
            alignment: const Alignment(0, 0.94),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // For Skip Button
                GestureDetector(
                  //(:=else) baki khetre fasle so skip thakbe
                  onTap: () {
                    _pagecontroller.jumpToPage(7);
                  },
                  child: const Text('Skip'),
                ),

                // for dot button
                SmoothPageIndicator(controller: _pagecontroller, count: 7),

                // For last Page Proceed
                onLastPage
                    ? GestureDetector(
                        //(?=if)  onlastpage true hoi then ei case
                        onTap: () {
                          _pagecontroller.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeOut);
                        },
                        child: const Text('Proceed'),
                      )

                    // For Next button
                    : GestureDetector(
                        // (: = else) onlastpage false hoi ei case
                        onTap: () {
                          _pagecontroller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
