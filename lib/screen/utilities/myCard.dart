import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  bool status;
  MyCard({super.key, required this.status});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            // الجزء الاول من الكارد
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            bottomRight: Radius.circular(30.0),
                            topLeft: Radius.circular(20.0)),
                        color: widget.status
                            ? Color(0xFFD6F7DB)
                            : Color(0xFFFFDDCE),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25.0),
                            topLeft: Radius.circular(20.0)),
                        color: widget.status ? Colors.green : Colors.red,
                      ),
                      child: widget.status
                          ? Image(
                              image:
                                  AssetImage("images/good fire extinusher.png"),
                              width: 30.0,
                              height: 30.0,
                            )
                          : Image.asset("images/bad fire extingusher.png"),
                    ),
                  ],
                ),
                // معلومات الطفاية
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFCCC5B9)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        "45",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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
                      padding: const EdgeInsets.only(right: 10.0),
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
              height: MediaQuery.of(context).size.height * 0.050,
            ),
            //الجزء الثاني  من كارد
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(" 45 "),
                      ),
                      Image(
                        image: AssetImage("images/Vector.png"),
                        height: 17.0,
                        width: 17.0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
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
                        image: AssetImage("images/wind-sign.png"),
                        height: 17.0,
                        width: 17.0,
                      )
                    ],
                  )
                ],
              ),
            ),

            // الجزء الثالث من الكارد
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              height: 35.0,
              margin: const EdgeInsets.only(
                right: 5.0,
                left: 5.0,
              ),
              decoration: BoxDecoration(
                color: widget.status ? Colors.green : Colors.red,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: const Center(
                child: Text(
                  "صالحة",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
