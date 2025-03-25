/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({super.key});

  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  String scannedResult = "Scan a QR Code or Barcode";

  Future<void> scanQRCode() async {
    // Check if running on an emulator
    if (await isEmulator()) {
      setState(() {
        scannedResult = "TEST_SCANNED_VALUE"; // Mock result for emulator
      });
      return;
    }

    try {
      String result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR,
      );

      if (result != "-1") {
        setState(() {
          scannedResult = result;
        });
      }
    } catch (e) {
      setState(() {
        scannedResult = "Failed to scan: $e";
      });
    }
  }

  /// Function to check if the device is an emulator
  Future<bool> isEmulator() async {
    if (!Platform.isAndroid) return false;
    final String model = await File('/system/build.prop').readAsString();
    return model.contains('generic') || model.contains('emulator');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(scannedResult, style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: scanQRCode,
          icon: Icon(Icons.qr_code_scanner),
          label: Text("Scan QR Code"),
        ),
      ],
    );
  }
}*/
