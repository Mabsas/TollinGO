import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/emergency.dart';
import 'package:tollin_go/Feature/scan.dart';
import 'package:tollin_go/Feature/scan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 114, 163, 240),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display the Scan button
                      ElevatedButton(
                        onPressed: () {
                          Scanner();
                        },
                        child: const Text('Scan'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
