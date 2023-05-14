import 'dart:ui';
import 'dart:async';
import 'package:fire_extinguisher/screen/dailogScreen/myAlertDialog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/Scan.dart';

class NotDiscover extends StatefulWidget {
  const NotDiscover({super.key});

  @override
  State<NotDiscover> createState() => _NotDiscoverState();
}

class _NotDiscoverState extends State<NotDiscover> {
  Scan scan = new Scan();
  // String _scanBarcode = 'Unknown';

  // Future<void> scanQR(BuildContext context) async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'الغاء', true, ScanMode.QR);
  //     print(
  //         "this **********************    $barcodeScanRes ******************************");
  //     print("index:${barcodeScanRes}");
  //     myAlertDialog(context: context, barCodeInfo: barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "المطافئ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Avenir",
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.qr_code,
            color: Colors.black,
          ),
          onPressed: () {
            scan.scanQR(context);
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF0EEEA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 12.0, bottom: 20),
              child: const Text(
                "لم يتم الكشف",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir",
                    fontSize: 20.0),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: 250.0),
                  itemCount: 200,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: InkWell(
                        onTap: () {
                          myAlertDialog(barCodeInfo: index, context: context);
                        },
                        child: Card(
                            // semanticContainer: true,
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            key: ValueKey(index),
                            child: Column(
                              children: [
                                // الجزء الاول من الكارد
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // علامة الطفاية
                                    Stack(
                                      children: [
                                        Container(
                                          height: 90.0,
                                          width: 60.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(20.0)),
                                            color: Color(0xFFf0f2ed),
                                          ),
                                        ),
                                        Container(
                                          height: 80.0,
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25.0),
                                                topLeft: Radius.circular(20.0)),
                                            color: Color(0xFFCCC5B9),
                                          ),
                                          child: Image.asset(
                                              "images/fire_extinusher.png"),
                                        ),
                                      ],
                                    ),
                                    // معلومات الطفاية
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0, right: 10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Color(0xFFCCC5B9)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: Text(
                                            "$index",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "طفاية",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "باب القبلة",
                                            style: TextStyle(
                                                fontFamily: "Avenir",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.080,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            " غم ",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(" $index "),
                                          ),
                                          Image(
                                            image:
                                                AssetImage("images/Vector.png"),
                                            height: 17.0,
                                            width: 17.0,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              "سائل",
                                              style: TextStyle(
                                                fontFamily: "Avenir",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "images/wind-sign.png"),
                                            height: 17.0,
                                            width: 17.0,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
