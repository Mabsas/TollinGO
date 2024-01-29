import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tollin_go/Feature/scan.dart';

class Failed extends StatefulWidget {
  const Failed({super.key});

  @override
  State<Failed> createState() => _FailedState();
}

class _FailedState extends State<Failed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(147, 148, 146, 1)),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Lottie.asset('assets/intro_animations/Animation000.json',
                height: 235,
                alignment: Alignment.center,
                repeat: true,
                //reverse: true,
                frameRate: FrameRate(120),
                fit: BoxFit.cover),
            const SizedBox(
              height: 50,
            ),
            // Display QR code message in the Paid screen
            const Text(
              'Transaction Failed!',
              style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),

            const SizedBox(
              height: 80,
            ),
           ElevatedButton(
              onPressed: () {
                // Replace the current route with the Scanner page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scanner(userBalance: 500,),
                  ),
                );
              },
              child: const Text('Return to HomePage'),
            ),
        ]),
      ),
    );
  }
}