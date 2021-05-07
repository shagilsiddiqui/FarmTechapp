import 'dart:developer';
import 'dart:io';
import 'package:farmtech/Services/databaseService.dart';
import 'package:farmtech/Services/imageupload.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as Im;

import 'package:farmtech/Widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:farmtech/global.dart' as global;

class AddShopItem extends StatefulWidget {
  @override
  _AddShopItemState createState() => _AddShopItemState();
}

class _AddShopItemState extends State<AddShopItem> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController itemName = new TextEditingController();
  TextEditingController quanitiy = new TextEditingController();
  TextEditingController price = new TextEditingController();
  String quanitiyType;
  TextEditingController description = new TextEditingController();
  Position position;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isrent = false;
  bool issell = false;
  final _picker = ImagePicker();
  var uuid = Uuid();
  String uid;
  bool isImage = false;
  File file;
  String imageURL;
  bool imageUploadDone;

  String _validateEmptyFields(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    return null;
  }

  handleTakePhoto() async {
    Navigator.pop(context);
    PickedFile pickerfile = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    file = File(pickerfile.path);
    isImage = true;
    log("file" + file.toString());
    await handleImageUpload();
    if (file != null) {
      Fluttertoast.showToast(msg: "Images Uploaded");
    }
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    PickedFile pickerfile = await _picker.getImage(source: ImageSource.gallery);
    file = File(pickerfile.path);
    isImage = true;
    log("file" + file.toString());
     await handleImageUpload();
    if (file != null) {
      Fluttertoast.showToast(msg: "Images Uploaded");
    }
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Create Post"),
          children: <Widget>[
            SimpleDialogOption(
                child: Text("Photo with Camera"),
                onPressed: () => handleTakePhoto()),
            SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: () => handleChooseFromGallery()),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  compressImage(filename) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$filename.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future handleImageUpload() async {
    Dialogs.showLoadingDialog(context, _keyLoader);
    uid = uuid.v1();
    await compressImage(uid);
    String mediaUrl = await uploadImage(file, uid);
    setState(() {
      imageURL = mediaUrl;
      imageUploadDone = true;
      log(imageURL);
    });
    Navigator.pop(context);
    return true;
  }

  String dropdownValue = 'Kg';

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
              './assets/bot.png',
              height: 50,
            ),
            SizedBox(width: 20),
            Text("List Item")
          ],
        ),
        actions: [
          Icon(
            Icons.mic,
            color: Colors.orangeAccent,
            size: 30,
          ),
          SizedBox(width: 30),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(color: global.yellowCustom),
                        color: Colors.white),
                    child: (!isImage || file == null)
                        ? FlatButton(
                            color: global.yellowCustom,
                            onPressed: () {
                              selectImage(context);
                            },
                            textColor: Colors.white,
                            child: Text("Upload Image".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          )
                        : Image.file(
                            file,
                            height: 150,
                          )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: itemName,
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: global.mainColor,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: global.mainColor,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _validateEmptyFields,
                        controller: price,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          contentPadding: EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: global.mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: global.mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusColor: Colors.black,
                          labelStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _validateEmptyFields,
                        controller: quanitiy,
                        decoration: InputDecoration(
                          labelText: 'Quanity',
                          contentPadding: EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: global.mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: global.mainColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusColor: Colors.black,
                          labelStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: global.mainColor),
                      underline: Container(
                        height: 2,
                        color: global.mainColor,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          quanitiyType = newValue;
                        });
                      },
                      items: <String>['Kg', 'Lt', 'Unit', 'Ton']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: global.mainColor,
                      width: 3.0,
                    ),
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: _validateEmptyFields,
                    controller: description,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Please add more details....',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SwitchListTile(
                    title: Text("Is item of Sale"),
                    value: issell,
                    onChanged: (value) {
                      setState(() {
                        issell = !issell;
                      });
                    }),
                SwitchListTile(
                    title: Text("Is item of Rent"),
                    value: isrent,
                    onChanged: (value) {
                      setState(() {
                        isrent = !isrent;
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: () {
                        
                        DatabaseService().addIteminShop(
                          itemName.text,
                          uid,
                          imageURL,
                          price.text,
                          quanitiy.text,
                          issell,
                          isrent,
                          quanitiyType,
                          description.text
                        );
                        Navigator.pop(context);
                      },
                      textColor: Colors.white,
                      child: Text("Post".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
