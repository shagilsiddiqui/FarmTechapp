import 'package:farmtech/Models/calendarData.dart';
import 'package:farmtech/Widgets/calanderListItem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  String crop ;
  int stage ; 
  DateTime date; 
  CalendarScreen({this.crop, this.stage , this.date});
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<int> days= [5 ,8,30,60,75,90];
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
            Text("Calendar View")
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
      body: ListView.builder(
        itemCount: calanderData.length ,
        itemBuilder: (context, index){
          return calenderListItem(
            context , title: calanderData[index].titles , subtitle: calanderData[index].subtitles , link: calanderData[index].links , imageUrl: calanderData[index].imageUrls ,
            date: DateFormat("dd-MM-yyyy").format(widget.date.add(Duration(days: days[index]))),
            currentstage: widget.stage == index ?true:false
          );
        },
      ),
    );
  }
}