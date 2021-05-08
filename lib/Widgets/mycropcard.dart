import 'package:farmtech/Screens/myCropDetailScrreen.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class MyCropCard extends StatefulWidget {
  String itemName;
  String itemId;
  String imageurl;
  int stage;
  MyCropCard({this.itemName, this.itemId, this.imageurl, this.stage});
  @override
  _MyCropCardState createState() => _MyCropCardState();
}

class _MyCropCardState extends State<MyCropCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: global.mainColor)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.network(
                  widget.imageurl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                children: [
                  Text(widget.itemName , style: TextStyle(
                    fontSize: 20,
                  ),),
                  SizedBox(height: 10),
                Text(
                  "Crop Name",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                ],
              ),
              trailing:
              Column(
                children: [
                  Text(global.stages[widget.stage] , style: TextStyle(
                    fontSize: 20,
                  ),),
                  SizedBox(height: 10),
                Text(
                  "Current Stage",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: global.mainColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyCropDetailsScreen(
                                id: widget.itemId,
                              )),
                    );
                  },
                  textColor: Colors.white,
                  child: Text("View Details".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ))
          ],
        ),
      ),
    );
  }
}
