import 'package:farmtech/Screens/fetilizerRecomndationScreen.dart';
import 'package:farmtech/Services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;
import 'package:fluttertoast/fluttertoast.dart';

class MyCropDetailsScreen extends StatefulWidget {
  final String id;
  MyCropDetailsScreen({this.id});
  @override
  _MyCropDetailsScreenState createState() => _MyCropDetailsScreenState();
}

class _MyCropDetailsScreenState extends State<MyCropDetailsScreen> {
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
            Image.asset(
              './assets/wheat16.png',
              scale: .6,
            ),
            SizedBox(width: 10),
            Text("My Crops")
          ],
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.grey[700],
            size: 30,
          ),
          SizedBox(width: 40),
        ],
      ),
      body: StreamBuilder(
        stream: DatabaseService().crop.doc(widget.id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var cropDoc = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              border: Border.all(color: global.yellowCustom),
                              color: Colors.white),
                          child: Image.network(
                            cropDoc['image'],
                            height: 150,
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 30),
                      Card(
                        color: global.mainColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                cropDoc['name'],
                                style:
                                    TextStyle(fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Crop Name",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.white),
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
                                      Text(cropDoc['seedtype'],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Seed Type",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: 50, width: 1, color: Colors.black26),
                                  Column(
                                    children: [
                                      Text(global.stages[cropDoc['currentState']],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Current State",
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
                                      Text(cropDoc['startDate'],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Start Date",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                   Container(
                                      height: 50, width: 1, color: Colors.black26),
                                  Column(
                                    children: [
                                      Text(cropDoc['harvestDate'],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Harvest Date",
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
                                      Text(cropDoc['area'] + " Hectare",
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
                                      Text(cropDoc['Expected Quantity'],
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
                                      Text(cropDoc['Market Value'],
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
                                      Text(cropDoc['presticide'],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Presticide",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                   Container(
                                      height: 50, width: 1, color: Colors.black26),
                                  Column(
                                    children: [
                                      Text(cropDoc['Fertilizer'],
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white)),
                                      SizedBox(height: 5),
                                      Text(
                                        "Fertilizer",
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
                      SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FertilzerRecomedationScreen(
                              cropname : cropDoc['name'],
                              id :cropDoc['id']
                            )),
                      );
                        },
                        textColor: global.mainColor,
                        child: Text("Get Fertilizer Recommedations".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )),
                      SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          int nextstage = cropDoc['currentState'] +1;
                          var data = { "currentState" :nextstage };
                          DatabaseService().updateCropdata(data, cropDoc['id']);
                          Fluttertoast.showToast(msg: "Move to Next Stage!!");
                        },
                        textColor: global.mainColor,
                        child: Text("Move to next Stage".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
