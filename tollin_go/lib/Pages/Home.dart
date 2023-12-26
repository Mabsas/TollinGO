import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                          scanQRCode();
                        },
                        child: const Text('Scan'),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(getResult),
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

  void scanQRCode() async {

        try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
