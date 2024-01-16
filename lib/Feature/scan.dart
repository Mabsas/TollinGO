import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tollin_go/Feature/fail.dart';
import 'package:tollin_go/Feature/paid.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var getResult = 'QR CODE RESULT';
  double userBalance =
      200.0; // Initialize the user's balance with a default value

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
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'USER PROFILE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Display user's balance on the left side
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0, bottom: 10),
                child: Text(
                  'Balance: \$${userBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            // Display user's icon and profile text on the right side
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
                          _handleScanAndNavigate(context);
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

      // Navigate to PaidScreen after scanning
      if (qrCode.isNotEmpty && qrCode != '-1' && userBalance != 0.00) {
        userBalance -= 100;
      
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Paid(qrCodeMessage: qrCode),
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
