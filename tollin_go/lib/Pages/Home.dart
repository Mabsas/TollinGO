import 'package:flutter/material.dart';
import 'package:tollin_go/Feature/emergency.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toll Payment App'),
      ),
      body: Center(
        child: EmergencyLoanWidget(),
      ),
     /* child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 31, 75, 114),
              Color.fromARGB(255, 56, 166, 245),
              Color.fromARGB(255, 173, 216, 230),
            ],
          ),
        ),
      ),*/
    );
  }
}
