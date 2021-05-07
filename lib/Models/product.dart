/* import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String itemName;
  String itemId;
  String imageurl;
  String price;
  String quanitiy;
  bool issell;
  bool isrent;
  String quanitiyType;
  String desc;
  Product(
      {this.itemName,
      this.quanitiyType,
      this.isrent,
      this.issell,
      this.quanitiy,
      this.price,
      this.desc,
      this.imageurl,
      this.itemId});
  
  factory Product.fromFirestore(DocumentSnapshot snapshot) {
    Object Function() data = snapshot.data;
    if (data == null) {
      return null;
    }
    Product product = Product(
      itemId: snapshot.data,
      title: data['title'] ?? null,
      price: data['price'] ?? null,
      imageUrl: data['imageUrl'] ?? null,
      quantity: data['quantity'] ?? null,
      quanityName: data['quantityName'] ?? null,
      phoneNumber: data['phoneNumber'] ?? null,
      position: Position(latitude: data['position'].latitude, longitude: data['position'].longitude) ?? null,
    );
    return product;
  }
} */
