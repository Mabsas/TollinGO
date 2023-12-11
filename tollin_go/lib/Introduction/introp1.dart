import 'package:flutter/material.dart';



// ignore: camel_case_types
class intropage1 extends StatelessWidget {
  const intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/intro/intro15.jpeg'),fit: BoxFit.cover)
      ),
    );
  }
}