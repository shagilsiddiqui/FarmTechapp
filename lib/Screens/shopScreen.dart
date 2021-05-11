import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmtech/Screens/Addshopitem.dart';
import 'package:farmtech/Services/databaseService.dart';
import 'package:farmtech/Widgets/shopCard.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:farmtech/global.dart' as global;

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool status = false;

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
              Icon(
                LineIcons.store,
                size: 30,
                color: global.mainColor,
              ),
              SizedBox(width: 20),
              Text("Shop")
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
          backgroundColor: global.yellowCustom,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddShopItem()),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: 
              StreamBuilder<QuerySnapshot>(
                  stream: DatabaseService().shop.snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                            children: snapshot.data.docs.map(
                          (DocumentSnapshot document) {
                            print(document.data.toString());
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ShoppingCard(
                                itemName: document['name'],
                                itemId: document['id'],
                                imageurl: document['imageUrl'],
                                price: document['price'],
                                quanitiy : document['quanitiy'],
                                isrent: document['isRent'],
                                issell: document['isSell'],
                                quanitiyType : document['quanitiyType'],
                                desc: document['description'],
                              ),
                            );
                          },
                        ).toList()),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            
        ));
  }
}
