import 'package:farmtech/Screens/cattle.dart';
import 'package:farmtech/Screens/cropDiseaseDetection.dart';
import 'package:farmtech/Screens/cropRecomendation.dart';
import 'package:farmtech/Screens/mycrops.dart';
import 'package:farmtech/Services/weatherService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                  height: 160.0,
                  width: 160.0,
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
                        Image.asset('./assets/doc.gif'),
                        Text(
                          "Which Crop to Grow? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 6.0,
                        spreadRadius: .05,
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCropScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('./assets/harvest.gif'),
                        Text("My Crops",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
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
                  height: 160.0,
                  width: 160.0,
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
                        Image.asset('./assets/rec.gif'),
                        Text("Check Crop Heath",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 160.0,
                  width: 160.0,
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
                        MaterialPageRoute(builder: (context) => CatteScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          './assets/tractor.gif',
                          height: 60,
                        ),
                        Text("My Cattle/ Equipments",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
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
              child: FutureBuilder(
                  future: WeatherService().getWeather(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    DateFormat("EEEE, d MMMM")
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  elevation: 4.0,
                                  onPressed: null,
                                  disabledColor: Colors.orangeAccent,
                                  disabledElevation: 4.0,
                                  disabledTextColor: Colors.black,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80.0,
                                    child: Text(
                                      "Today",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  color: Colors.orangeAccent,
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/header.png'),
                                    alignment: Alignment.centerRight),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data.name,
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'Day ' +
                                          (snapshot.data.main.tempMax - 273.15)
                                              .toInt()
                                              .toString() +
                                          '° ↑' +
                                          ' • ' +
                                          'Night ' +
                                          (snapshot.data.main.tempMin - 273.15)
                                              .toInt()
                                              .toString() +
                                          '° ↓',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          (snapshot.data.main.temp - 273.15)
                                                  .toInt()
                                                  .toString() +
                                              '°',
                                          style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Image.network(
                                                'http://openweathermap.org/img/wn/' +
                                                    snapshot
                                                        .data.weather[0].icon +
                                                    '.png',
                                                height: 40,
                                                color: Colors.black,
                                              ),
                                              snapshot.data.weather[0]
                                                      .description
                                                      .contains(' ')
                                                  ? Text(
                                                      snapshot.data.weather[0]
                                                              .description
                                                              .split(' ')[0][0]
                                                              .toUpperCase() +
                                                          snapshot
                                                              .data
                                                              .weather[0]
                                                              .description
                                                              .split(' ')[0]
                                                              .substring(1) +
                                                          '\n' +
                                                          snapshot
                                                              .data
                                                              .weather[0]
                                                              .description
                                                              .split(' ')[1][0]
                                                              .toUpperCase() +
                                                          snapshot
                                                              .data
                                                              .weather[0]
                                                              .description
                                                              .split(' ')[1]
                                                              .substring(1),
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  : Text(
                                                      snapshot.data.weather[0]
                                                              .description[0]
                                                              .toUpperCase() +
                                                          snapshot
                                                              .data
                                                              .weather[0]
                                                              .description
                                                              .substring(1),
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                              SizedBox(height: 5.0)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Feels like ' +
                                          (snapshot.data.main.feelsLike -
                                                  273.15)
                                              .toInt()
                                              .toString() +
                                          '°',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(40, 20, 40, 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          elevation: 2.0,
                                          onPressed: null,
                                          disabledColor: Colors.white,
                                          disabledElevation: 2.0,
                                          disabledTextColor: Colors.black,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 5),
                                                child: Container(
                                                  height: 5.0,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: Colors
                                                          .lightBlueAccent),
                                                ),
                                              ),
                                              SizedBox(height: 20.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/drop.png',
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "  Humidity",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6.0),
                                              Text(
                                                snapshot.data.main.humidity
                                                        .toString() +
                                                    "%",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24.0),
                                              )
                                            ],
                                          ),
                                          color: Colors.white,
                                        ),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          elevation: 2.0,
                                          onPressed: null,
                                          disabledColor: Colors.white,
                                          disabledElevation: 2.0,
                                          disabledTextColor: Colors.black,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0 , vertical: 5),
                                                child: Container(
                                                  height: 5.0,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: Colors.orangeAccent
                                                          ),
                                                ),
                                              ),
                                              SizedBox(height: 20.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/wind.png',
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "  Wind",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6.0),
                                              Text(
                                                  snapshot.data.wind.speed
                                                          .toStringAsFixed(1) +
                                                      " km/h",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 24.0),
                                                )
                                            ],
                                          ),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
