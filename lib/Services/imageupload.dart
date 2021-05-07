import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImage(imageFile, filename) async {
  FirebaseStorage storage = FirebaseStorage.instance;

  try {
    UploadTask uploadTask = storage.ref().child("$filename.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    log(e.toString());
    return "Failed Image Upload: ${e.toString()}";
  }
}