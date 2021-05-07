import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmtech/Screens/Addcrop.dart';
import 'package:farmtech/Services/databaseService.dart';
import 'package:farmtech/Widgets/mycropcard.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:farmtech/global.dart' as global;
class MyCropScreen extends StatefulWidget {
  @override
  _MyCropScreenState createState() => _MyCropScreenState();
}

class _MyCropScreenState extends State<MyCropScreen> {
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
            SizedBox(width:10),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCropScreen()),
                      );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:DatabaseService().crop.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return ListView(
                children: snapshot.data.docs.map(
                   (DocumentSnapshot document){
                     return MyCropCard(
                       itemName:  document['name'],
                       itemId: document['id'],
                       imageurl: document['image'],
                       stage: document['currentState'],
                     );
                   }
                ).toList()
              );
            }
            else {
                      return Center(child: CircularProgressIndicator());
                    }
          } ,
        ),
      ) ,
    );
  }
}