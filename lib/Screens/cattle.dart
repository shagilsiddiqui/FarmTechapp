import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as  global;
class CatteScreen extends StatefulWidget {
  @override
  _CatteScreenState createState() => _CatteScreenState();
}

class _CatteScreenState extends State<CatteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffDEF9EF) ,
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
            SizedBox(width:10),
            Text("My Cattles")
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionCard(
                backgroundColor: global.mainColor,
                borderRadius: 20,
                background: Image.asset(
                  "assets/cow.gif",
                  fit: BoxFit.cover,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Gir Cow",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Gujrat",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text("Milk yield ranges from 1250 to 1800 kgs per lactation\n Bought at @1.5Lakhs",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: ExpansionCard(
                backgroundColor: global.mainColor,
                borderRadius: 20,
                background: Image.asset(
                  "assets/goaat.gif",
                  fit: BoxFit.cover,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        " pygmy goat ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "American Breed",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text("The average daily milk yield in 2.25 to 2.7 kg. The milk yield in a lactation period of, 250 days varies from 250 - 300 kg with 3.5 percent fat content\n Bought at @0.5Lakhs",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: ExpansionCard(
                backgroundColor: global.mainColor,
                borderRadius: 20,
                background: Image.asset(
                  "assets/tractor.gif",
                  fit: BoxFit.cover,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Mahindra Tractor",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Crawler tractor",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text("Used to plough field during harvesting season\n Bought at @10.5Lakhs",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}