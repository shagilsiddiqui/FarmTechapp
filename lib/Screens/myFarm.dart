import 'package:farmtech/Screens/cattle.dart';
import 'package:farmtech/Screens/cropDiseaseDetection.dart';
import 'package:farmtech/Screens/cropRecomendation.dart';
import 'package:farmtech/Screens/mycrops.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class MyFarmScreen extends StatefulWidget {
  @override
  _MyFarmScreenState createState() => _MyFarmScreenState();
}

class _MyFarmScreenState extends State<MyFarmScreen> {
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
            SizedBox(width: 20),
            Text("My Farm")
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
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 6.0,
                        spreadRadius: .05, //extend the shadow
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CropRecomdationScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('./assets/wheat16.png'),
                        Text("Which Crop to Grow? " ,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 6.0,
                        spreadRadius: .05, //extend the shadow
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyCropScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('./assets/wheat16.png'),
                        Text("My Crops", textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 6.0,
                        spreadRadius: .05, //extend the shadow
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CropDiseaseDetection()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('./assets/wheat16.png'),
                        Text("Check Crop Heath" , textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 6.0,
                        spreadRadius: .05, //extend the shadow
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cattle()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('./assets/wheat16.png'),
                        Text("My Cattle/ Equipments", textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height - 330,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff25C585),
                    const Color(0xff0e4e35),
                  ],
                ),
                //color: global.mainColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 6.0,
                    spreadRadius: .05, //extend the shadow
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Data From Sensors",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Card(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text("Soil Moisture Monitor" , style: TextStyle(fontSize: 25, color: Colors.white),),
                      
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
