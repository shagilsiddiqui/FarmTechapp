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
import 'package:line_icons/line_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:farmtech/global.dart' as global;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddCropScreen extends StatefulWidget {
  @override
  _AddCropScreenState createState() => _AddCropScreenState();
}

class _AddCropScreenState extends State<AddCropScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cropname = new TextEditingController();
  TextEditingController area = new TextEditingController();
  String dropdownValue = "Nuclear seed";
  String seed;
  String _date;
  TextEditingController dateCtl = new TextEditingController();
  DateTime presetDate = DateTime.now();
  DateTime date = DateTime.now();

  String _startTimeString = "";
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

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
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
              Text("Add Crop")
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
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
                    controller: cropname,
                    decoration: InputDecoration(
                      labelText: 'Crop Name',
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _validateEmptyFields,
                          controller: area,
                          decoration: InputDecoration(
                            labelText: 'Area (Hectare)',
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
                            seed = newValue;
                          });
                        },
                        items: <String>[
                          'Nuclear seed',
                          'Breeder seed',
                          'Foundation seed',
                          'Registered seed',
                          'Certified seed'
                        ].map<DropdownMenuItem<String>>((String value) {
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
                    child: Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        shape: (_date == null)
                            ? new RoundedRectangleBorder(
                                side: new BorderSide(
                                    color: global.mainColor, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0))
                            : new RoundedRectangleBorder(
                                side: new BorderSide(
                                    color: global.mainColor, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: presetDate,
                                  firstDate: presetDate,
                                  lastDate:
                                      DateTime.now().add(Duration(days: 100)));
                              dateCtl.text =
                                  '${date.day}-${date.month}-${date.year}';
                              _date = '${date.day}-${date.month}-${date.year}';
                              if (date.day == DateTime.now().day &&
                                  date.month == DateTime.now().month) {
                                setState(() {});
                              } else {
                                setState(() {});
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: Container(
                                child: ListTile(
                                  leading: Icon(LineIcons.calendar,
                                      color: Colors.grey),
                                  title: Text(
                                    _date ?? "Select Start Date",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Circular Std',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: global.mainColor,
                        onPressed: () {
                          DatabaseService().addCrop(uid, cropname.text, _date, seed, imageURL, area.text);
                          Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        child: Text("Add Crop".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
