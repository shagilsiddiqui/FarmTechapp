import 'package:farmtech/Screens/NewsFeed.dart';
import 'package:farmtech/Screens/finnanceScreen.dart';
import 'package:farmtech/Screens/myFarm.dart';
import 'package:farmtech/Screens/shopScreen.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class HomeScreenContainer extends StatefulWidget {
  final int number;
  HomeScreenContainer({this.number});
  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: 160.0,
      decoration: BoxDecoration(
        borderRadius: widget.number == 1
            ? BorderRadius.only(
                bottomLeft: Radius.circular(40), topRight: Radius.circular(40))
            : widget.number == 2
                ? BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    topLeft: Radius.circular(40))
                : widget.number == 3
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(40))
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
        color: Colors.white,
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
        color: Colors.transparent,
        onPressed: () {
          widget.number == 1
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFarmScreen()),
                )
              : widget.number == 2
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopScreen()),
                    )
                  : widget.number == 3
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinnanceScreen()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsFeed()),
                        );
        },
        child: widget.number == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    './assets/crop.png',
                  ),
                  Text("My Farm" , textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                ],
              )
            : widget.number == 2
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        './assets/shop.jpeg',
                      ),
                      Text("Shop" ,textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                    ],
                  )
                : widget.number == 3
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            './assets/money.png',
                          ),
                          Text("My Finance" , textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            './assets/resources.png',
                          ),
                          Text("Resources" , textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                        ],
                      ),
      ),
    );
  }
}
