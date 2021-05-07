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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              title: Text(widget.itemName),
              trailing: Text(global.stages[widget.stage]),
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
