import 'package:farmtech/Services/cropPrice.dart';
import 'package:farmtech/Widgets/cropcard.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;
import 'package:line_icons/line_icons.dart';

class FinnanceScreen extends StatefulWidget {
  @override
  _FinnanceScreenState createState() => _FinnanceScreenState();
}

class _FinnanceScreenState extends State<FinnanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDEF9EF),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        elevation: 10,
        title: Row(
          children: [
            Icon(LineIcons.moneyCheck , color: global.mainColor, size:30),
            SizedBox(width: 20),
            Text("My Finances")
          ],
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow[700],
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xff25C585),
                    const Color(0xff0e4e35),
                  ],
                ),
                //color: global.mainColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 6.0,
                    spreadRadius: .05, //extend the shadow
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "₹ 4,00,000",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Total Investment",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("₹ 30,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Rental Spent",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 50, width: 1, color: Colors.black26),
                          Column(
                            children: [
                              Text("₹ 20,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Rental Income",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("₹ 33,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Fertilizer Spend",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 50, width: 1, color: Colors.black26),
                          Column(
                            children: [
                              Text("₹ 16,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Pestiside Spend",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("200 hct",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Area Coverted",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 50, width: 1, color: Colors.black26),
                          Column(
                            children: [
                              Text("1,60,000 kg",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Expected Quantity",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 50, width: 1, color: Colors.black26),
                          Column(
                            children: [
                              Text("₹ 6,40,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Market Value",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("₹ 1,40,000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Expected Profit ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 50, width: 1, color: Colors.black26),
                          Column(
                            children: [
                              Text("20%",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 5),
                              Text(
                                "Risk Factor",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              FutureBuilder(
                  future: CropPrice().fetchCropsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, index) =>
                            CropCard(snapshot.data[index]),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
