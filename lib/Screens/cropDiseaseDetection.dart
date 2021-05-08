import 'dart:developer';
import 'dart:io';
import 'package:farmtech/global.dart' as global;
import 'package:farmtech/Models/diesase.dart';
import 'package:farmtech/Widgets/CustomDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tflite/tflite.dart';

class CropDiseaseDetection extends StatefulWidget {
  @override
  _CropDiseaseDetectionState createState() => _CropDiseaseDetectionState();
}

class _CropDiseaseDetectionState extends State<CropDiseaseDetection> {
  File _image;
  List _recognitions;
  String diseaseName = "";
  bool _busy = false;
  final ImagePicker _picker = ImagePicker();

  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select the image"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery "),
                    onTap: () {
                      predictImagePickerGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera "),
                    onTap: () {
                      predictImagePickerCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  showDiseaseDialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: diseaseName,
            descriptions: disease[diseaseName],
            text: "ok",
          );
        });
  }

  predictImagePickerGallery(state) async {
    Navigator.pop(context);
    PickedFile pickerfile = await _picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 675,
      maxWidth: 960,
    );
    File file = File(pickerfile.path);
    setState(() {
      _busy = true;
      _image = file;
    });
    log("file" + file.toString());
    if (file != null) {
      Fluttertoast.showToast(msg: "Images Uploaded");
    }
    recognizeImage(file);
  }

  predictImagePickerCamera(state) async {
    Navigator.pop(context);
    PickedFile pickerfile = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    File file = File(pickerfile.path);
    setState(() {
      _busy = true;
      _image = file;
    });
    log("file" + file.toString());
    if (file != null) {
      Fluttertoast.showToast(msg: "Images Uploaded");
    }
    recognizeImage(file);
  }

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/disease_final_model.tflite",
        labels: "assets/Label.txt",
      );
      print("loaded");
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  Future recognizeImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _busy = false;
      _recognitions = recognitions;
      print(recognitions.toString());
      _recognitions != null
          ? _recognitions.map((res) {
              diseaseName = res['label'];
            }).toList()
          : [];
    });
    showDiseaseDialog();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Icon(LineIcons.doctor , size: 30, color: global.mainColor,),
            SizedBox(width: 20),
            Text("Check Crop Health")
          ],
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow[700],
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          LineIcons.camera,
          color: Colors.white,
        ),
        onPressed: () {
          _showDialog(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
                "With Help of our hyper tunned Deeep learning models detect each very disease causing a harm to you crop, hence affecting ypur profits" , style: TextStyle(color:global.mainColor),),
                SizedBox(height:20),
            _image == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'No image selected,\nUpload by clicking on button at the bottom right corner!'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      _image,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
