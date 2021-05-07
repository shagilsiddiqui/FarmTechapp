import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference shop = FirebaseFirestore.instance.collection('shop');
  CollectionReference crop = FirebaseFirestore.instance.collection('crops');

  Future addIteminShop(
      String itemName,
      String itemId,
      String imageurl,
      String price,
      String quanitiy,
      bool issell,
      bool isrent,
      String quanitiyType,
      String desc) async {
    shop.doc(itemId).set({
      "name": itemName,
      "id": itemId,
      "imageUrl": imageurl,
      "price": price,
      "quanitiy": quanitiy,
      "location": "Delhi",
      "mobileNUmber": "9810910960",
      "isSell": issell,
      "isRent": isrent,
      "quanitiyType": quanitiyType,
      "description": desc
    });
  }

  Future addCrop(
    String id,
    String name,
    String startDate,
    String seed,
    String imageurl,
    String area,
  ) async {
    int quantiy = 8000*int.parse(area);
    crop.doc(id).set({
      "id":id,
      "name":name,
      "startDate":startDate,
      "seedtype":seed,
      "image":imageurl,
      "area":area,
      "presticide":"DDT,Acephate",
      "Fertilizer":" ",
      "harvestDate":" ",
      "currentState":1,
      "Expected Quantity" :quantiy.toString(),
      "Market Value":"-"
    });
  }
  Future updateCropdata(data , id) async{
      crop.doc(id).update(data);
    }
}
