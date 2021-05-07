import 'package:farmtech/Screens/chatbotScreen.dart';
import 'package:farmtech/Services/weatherService.dart';
import 'package:farmtech/Widgets/drawer.dart';
import 'package:farmtech/Widgets/homeScreenContainer.dart';
import 'package:farmtech/global.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService dataState = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDEF9EF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.settings,
            color: Colors.grey[600],
            size: 30,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.notifications,
            color: Colors.yellow[700],
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: dataState.getWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * .16,
                    right: MediaQuery.of(context).size.width * .48,
                    child: Container(
                        width: 15,
                        height: MediaQuery.of(context).size.height * .84,
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF8CDABD),
                            const Color(0xFF1F9064),
                          ],
                        ))),
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeScreenContainer(number: 1),
                          HomeScreenContainer(number: 2)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeScreenContainer(number: 3),
                          HomeScreenContainer(number: 4)
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 3.32*MediaQuery.of(context).size.height * .16,
                            width: MediaQuery.of(context).size.width * .42,
                            decoration: BoxDecoration(
                                color: Color(0xff25C585),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (snapshot.data.main.tempMax - 273.15)
                                          .toInt()
                                          .toString() +
                                      '°' +
                                      'C',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Max",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  (snapshot.data.main.tempMin - 273.15)
                                          .toInt()
                                          .toString() +
                                      '°' +
                                      'C',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Min",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 3.32*MediaQuery.of(context).size.height * .16,
                            width: MediaQuery.of(context).size.width * .42,
                            decoration: BoxDecoration(
                                color: Color(0xff228E64),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[300],
                                      child: Icon(
                                        FlatIcons.cloud,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.clouds.all.toString() + "%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blueGrey,
                                      child: Icon(
                                        LineIcons.water,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.main.humidity.toString() +
                                          "%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.greenAccent,
                                      child: Icon(
                                        FlatIcons.cloud,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.wind.speed.toString() +
                                          " Km/hr",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .16,
                    right: MediaQuery.of(context).size.width * .45,
                    child: CircleAvatar(
                      backgroundColor: global.yellowCustom,
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
