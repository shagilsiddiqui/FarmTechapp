import 'package:farmtech/Services/databaseService.dart';
import 'package:farmtech/Widgets/CustomDialog.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class FertilzerRecomedationScreen extends StatefulWidget {
  String cropname;
  String id;
  FertilzerRecomedationScreen({this.cropname, this.id});
  @override
  _FertilzerRecomedationScreenState createState() =>
      _FertilzerRecomedationScreenState();
}

class _FertilzerRecomedationScreenState
    extends State<FertilzerRecomedationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nitrogen = new TextEditingController();
  TextEditingController cropname = new TextEditingController();
  TextEditingController k = new TextEditingController();
  TextEditingController ph = new TextEditingController();
  String _validateEmptyFields(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    return null;
  }

  showDiseaseDialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Ammonium chloride",
            descriptions: "Ammonium Chloride fertilizer application is recommended for saline and alkaline soils. It is also a suitable Nitrogenous fertilizer for application in low-lying areas where paddy and other crops are cultivated by farmers",
            text: "OK and Update",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    cropname.text = widget.cropname;
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
            Text("Recomnd Fertiler")
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: () {
                        showDiseaseDialog();
                       var data = { "Fertilizer" :"Ammonium chloride" };
                        DatabaseService().updateCropdata(data, widget.id  );
                      },
                      textColor: Colors.white,
                      child: Text("Auto Recomendation".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    )),
                SizedBox(height: 10),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: null,
                      textColor: Colors.white,
                      child: Text("Fetch Data from Sensors".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    )),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 20),
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: nitrogen,
                  decoration: InputDecoration(
                    labelText: 'Nitogen',
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: k,
                  decoration: InputDecoration(
                    labelText: 'Potassium',
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: ph,
                  decoration: InputDecoration(
                    labelText: 'Phosphorous',
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
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: () {
                      showDiseaseDialog();
                       var data = { "Fertilizer" :"Ammonium chloride" };
                        DatabaseService().updateCropdata(data, widget.id  );
                      },
                      textColor: Colors.white,
                      child: Text("Recomend".toUpperCase(),
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
