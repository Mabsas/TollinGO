import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class intropage3 extends StatelessWidget {
  const intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/intro/intro4.jpg'),fit: BoxFit.cover)
      ),
    );
  }
}