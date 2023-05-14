import 'dart:ui';
import 'package:fire_extinguisher/screen/dailogScreen/dailogCardData.dart';
import 'package:flutter/material.dart';

myAlertDialog({var barCodeInfo, required BuildContext context}) {
  double getResponsiveHeight(double height) {
    double screenHeight = MediaQuery.of(context).size.height;
    return height *
        (screenHeight / 896.0); // Adjust the reference height as needed
  }

  double getResponsiveFontSize(double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return fontSize *
        (screenWidth / 414.0); // Adjust the reference width as needed
  }

  return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Dialog(
                    insetPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //tiltle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$barCodeInfo",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Avenir",
                                      fontSize: getResponsiveFontSize(25.0),
                                    )),
                              ],
                            ),
                            //content
                            Container(
                              width: double.infinity,
                              height: getResponsiveHeight(600.0),
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              (getResponsiveFontSize(1) /
                                                  getResponsiveHeight(1))),
                                  itemCount: DialogCardList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      color: Color(0xFfF2F0ED),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${DialogCardList[index].title}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Avenir",
                                              fontSize:
                                                  getResponsiveFontSize(18.0),
                                            ),
                                          ),
                                          SizedBox(
                                            height: getResponsiveHeight(5.0),
                                          ),
                                          SizedBox(
                                            height: getResponsiveHeight(60),
                                            child: RadioListTile(
                                              secondary: Text(
                                                "${DialogCardList[index].firstTitleOption}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Avenir",
                                                    fontSize: 15.0),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              tileColor: Color(0xFFE3E0DC),
                                              selectedTileColor: Colors.white,
                                              activeColor: Colors.red,
                                              selected: DialogCardList[index]
                                                  .firstOptionStatus!,
                                              value: DialogCardList[index]
                                                  .optionsValue![0],
                                              groupValue: DialogCardList[index]
                                                  .groubValue,
                                              onChanged: (String? val) {
                                                setState(() {
                                                  DialogCardList[index]
                                                      .groubValue = val;
                                                  DialogCardList[index]
                                                      .firstOptionStatus = true;
                                                  DialogCardList[index]
                                                          .secondOptionStatus =
                                                      false;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: getResponsiveHeight(10.0),
                                          ),
                                          SizedBox(
                                            height: getResponsiveHeight(60),
                                            child: RadioListTile(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              tileColor: Color(0xFFE3E0DC),
                                              selectedTileColor: Colors.white,
                                              activeColor: Colors.red,
                                              selected: DialogCardList[index]
                                                  .secondOptionStatus!,
                                              value: DialogCardList[index]
                                                  .optionsValue![1],
                                              groupValue: DialogCardList[index]
                                                  .groubValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  DialogCardList[index]
                                                      .groubValue = value;
                                                  DialogCardList[index]
                                                          .firstOptionStatus =
                                                      false;
                                                  DialogCardList[index]
                                                          .secondOptionStatus =
                                                      true;
                                                });
                                              },
                                              secondary: Text(
                                                "${DialogCardList[index].secondTitleOption}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Avenir",
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),

                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 30.0,
                                    right: 10.0,
                                    left: 10.0,
                                    top: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.red),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.black),
                                  maxLines: 10,
                                  minLines: 5,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: " ملاحضات",
                                      hintStyle:
                                          TextStyle(color: Color(0xFFA39E94)),
                                      prefixIcon: Container(
                                        margin: EdgeInsets.only(bottom: 70.0),
                                        child: Icon(Icons.note,
                                            color: Color(0xFFA39E94)),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xFFF2F0ED),
                                      filled: true,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.0, right: 10, left: 10)),
                                  cursorColor: Colors.red,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "الغاء",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Avenir",
                                        fontSize: 15.0,
                                        color: Color(0xFFAEAAA1),
                                      ),
                                    )),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {},
                                  child: Text(
                                    'ارسال',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )));
          },
        );
      });
}
