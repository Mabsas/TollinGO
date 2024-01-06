import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tollin_go/Feature/fail.dart';
import 'package:tollin_go/Feature/paid.dart';
import 'package:tollin_go/Feature/paid.dart';
import 'package:tollin_go/Pages/Home.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var getResult = 'QR CODE RESULT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TollinGo',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'OriginalSurfer'),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 139, 242),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 76, 139, 242),
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
                      topRight: Radius.circular(60)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _handleScanAndNavigate(context);
                        },
                        child: const Text('Scan'),
                      ),
                      /*const SizedBox(
                        height: 20.0,
                      ),
                      Text(getResult), */ //remove kore dibo
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
      if (qrCode.isNotEmpty) {
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
