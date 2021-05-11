import 'package:farmtech/Screens/paymentscreen.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:farmtech/global.dart' as global;

class ShoppingCard extends StatefulWidget {
  String itemName;
  String itemId;
  String imageurl;
  String price;
  String quanitiy;
  bool issell;
  bool isrent;
  String quanitiyType;
  String desc;
  ShoppingCard(
      {this.itemName,
      this.quanitiyType,
      this.isrent,
      this.issell,
      this.quanitiy,
      this.price,
      this.desc,
      this.imageurl,
      this.itemId});
  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: global.mainColor)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ClipRRect(
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
            Column(
              children: [
                Text(
                  widget.itemName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "₹ " + widget.price + "/ " + widget.quanitiyType,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.quanitiy,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.call,
                  color: global.mainColor,
                ),
                SizedBox(height: 20),
                Icon(
                  FlatIcons.map_location,
                  color: global.mainColor,
                )
              ],
            ),
          ]),
          Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.issell == true
                  ? SizedBox(
                      width: 150,
                      child: RaisedButton(
                        color: global.mainColor,
                        onPressed: () {},
                        textColor: Colors.white,
                        child: Text("Aviable for Sell".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ))
                  : Container(),
              widget.isrent == true
                  ? SizedBox(
                      width: 150,
                      child: RaisedButton(
                        color: global.mainColor,
                        onPressed: () {},
                        textColor: Colors.white,
                        child: Text("Aviable for Sell".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ))
                  : Container(),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: global.mainColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
                textColor: Colors.white,
                child: Text("Make Payment".toUpperCase(),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              )),
        ],
      ),
    );
  }

  Widget pocketContainer(IconData iconData, String value) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.4,
            color: Colors.grey[400],
          )),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            padding: const EdgeInsets.all(5),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget smallPocketContainer(IconData iconData, String value) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.4,
            color: Colors.grey[400],
          )),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            padding: const EdgeInsets.all(6),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Lato',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
