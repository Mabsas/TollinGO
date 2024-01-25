import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tollin_go/Feature/fail.dart';
import 'package:tollin_go/Feature/paid.dart';
import 'package:tollin_go/Pages/Home.dart';
import 'package:tollin_go/main.dart'; // Import the main.dart file to access Home class

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  double userBalance = 200.0; // Initialize the user's balance with a default value
  String getResult = ''; // Add this line to declare getResult variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(120, 144, 156, 1),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'USER PROFILE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0, bottom: 10),
                child: Text(
                  'Balance: \$${userBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
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
                      ElevatedButton(
                        onPressed: () {
                          _handleScanAndNavigate(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[400],
                        ),
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

  Future<void> _handleScanAndNavigate(BuildContext context) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });

      // Navigate to Home after scanning
      if (qrCode.isNotEmpty && qrCode != '-1' && userBalance != 0.00) {
        userBalance -= 100;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(userBalance: userBalance),
          ),
        );
      }
      if (qrCode == '-1') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Failed(),
          ),
        );
      }
    } on PlatformException {
      setState(() {
        getResult = 'Failed to scan QR Code.';
      });
    }
  }
}
