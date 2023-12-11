import 'package:flutter/material.dart';
import 'package:tollin_go/Introduction/introp1.dart';
import 'package:tollin_go/Introduction/introp2.dart';
import 'package:tollin_go/Introduction/introp3.dart';

// ignore: camel_case_types
class screenview extends StatelessWidget {
  const screenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          intropage1(),
          intropage2(),
          intropage3(),
        ],
      ),
    );
  }
}
