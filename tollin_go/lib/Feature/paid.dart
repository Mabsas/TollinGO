import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Paid extends StatefulWidget {
  final String qrCodeMessage;

  const Paid({required this.qrCodeMessage, Key? key}) : super(key: key);

  @override
  State<Paid> createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(214, 246, 184, 1)),
          child: Column(
            children: [
             const  SizedBox(
                height: 70,
              ),
              Lottie.asset('assets/intro_animations/Animation12.json',
                  height: 300,
                  alignment: Alignment.center,
                  repeat: true,
                  //reverse: true,
                  frameRate: FrameRate(120),
                  fit: BoxFit.cover),
              const SizedBox(
                height: 100,
              ),
              // Display QR code message in the Paid screen
              Text(widget.qrCodeMessage,style: const TextStyle(fontFamily: 'Cinzel',fontSize:20,color: Colors.black),),
              Lottie.asset('assets/intro_animations/Animation16.json',
                  height: 450,
                  alignment: Alignment.center,
                  repeat: true,
                  //reverse: true,
                  frameRate: FrameRate(120),
                  fit: BoxFit.cover
                  )
            ],
          ),
        ),
      ),
    );
  }
}
