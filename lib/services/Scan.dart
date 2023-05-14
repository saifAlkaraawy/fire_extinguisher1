import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../screen/dailogScreen/myAlertDialog.dart';

class Scan {
  Future<void> scanQR(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'الغاء', true, ScanMode.QR);
// for Test
      barcodeScanRes != "-1"
          ? myAlertDialog(context: context, barCodeInfo: barcodeScanRes)
          : () {};
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
