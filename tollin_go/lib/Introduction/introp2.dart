import 'package:flutter/material.dart';



// ignore: camel_case_types
class intropage2 extends StatelessWidget {
  const intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/intro/intro3.jpg'),fit: BoxFit.cover)
      ),
    );
  }
}