import 'package:fire_extinguisher/screen/utilities/myCard.dart';
import 'package:flutter/material.dart';

import '../services/Scan.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with TickerProviderStateMixin {
  late TabController _tabController;
  Scan scan = Scan();

  //forTest
  List<bool> status = [
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    true
  ];

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF0EEEA),
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
          bottom: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.red,
            ),
            tabs: const [
              Tab(
                child: Text(
                  "غير موجودة",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenir",
                  ),
                ),
                iconMargin: EdgeInsets.only(bottom: 20.0),
              ),
              Tab(
                child: Text(
                  "موجودة ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenir",
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //الطفايات  غير الموجودة
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.0, right: 15.0, bottom: 20.0),
                  child: const Text(
                    " الطفايات  غير موجودة ",
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.0,
                                mainAxisExtent: 270.0),
                        itemCount: status.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyCard(
                            status: status[index],
                          );
                        }))
              ],
            ),
            //طفايات موجودة
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.0, right: 15.0, bottom: 20.0),
                  child: const Text(
                    " الطفايات الموجودة ",
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.0,
                                mainAxisExtent: 270.0),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return MyCard(
                            status: status[index],
                          );
                          ;
                        }))
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
