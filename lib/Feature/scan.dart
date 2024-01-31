import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tollin_go/Feature/fail.dart';
import 'package:tollin_go/Pages/Home.dart';
import 'package:tollin_go/Feature/paid.dart';
// Import the main.dart file to access Home class

class Scanner extends StatefulWidget {
  const Scanner({Key? key, required this.userBalance}) : super(key: key);

  final double userBalance;

  @override
  State<Scanner> createState() => _ScannerState(userBalance: userBalance);
}

class _ScannerState extends State<Scanner> {
  double userBalance;
  double emergencyLimit = 500.0; // Add emergencyLimit
  double loanBalance = 0.0; // Add loanBalance
  String getResult = '';

  _ScannerState({required this.userBalance});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background design with gradients
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey[400]!, Colors.white],
              ),
            ),
          ),
          // Rectangular widget with circular edges for user balance, emergency limit, and loan balance
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Main Balance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                    ),
                    child: Text(
                      '৳${userBalance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.blueGrey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Emergency Limit: \$${emergencyLimit.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Loan Balance: \$${loanBalance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // White section with Scan button and cutout
          Positioned.fill(
            top: 200,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            Colors.transparent, // Set the color to transparent
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.white,
                            width: 2), // Add a white border
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _handleScanAndNavigate(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey[400],
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Scan To Pay',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            builder: (context) => Paid(qrCodeMessage: getResult),
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