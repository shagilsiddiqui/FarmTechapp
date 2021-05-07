import 'dart:developer';
import 'dart:io';
import 'package:farmtech/Screens/homeScreen.dart';
import 'package:farmtech/Services/locationServices.dart';
import 'package:farmtech/global.dart' as global;
import 'package:farmtech/Widgets/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class AddAddress extends StatefulWidget {
  final UserCredential user ; 
  AddAddress({this.user});
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController housenumberController = new TextEditingController();
  TextEditingController floorController = new TextEditingController();
  TextEditingController blockController = new TextEditingController();
  TextEditingController localityController = new TextEditingController();
  TextEditingController pinCodeController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController area = new TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  String address = "";
  List<Location> loc;
  String _validateEmptyFields(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    return null;
  }

 

  handleNavigation_withsignup(String placeid) async {
    Dialogs.showLoadingDialog(context, _keyLoader);
    String temp = "Success";
    if (temp == "Success") {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pop(context);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Some Error Occured'),
          actions: <Widget>[
            FlatButton(
              child: Text('Retry'),
              onPressed: () {
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Pickup Address"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: housenumberController,
                  decoration: InputDecoration(
                    labelText: 'Plot Number',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: floorController,
                  decoration: InputDecoration(
                    labelText: 'Plot Location',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: blockController,
                  decoration: InputDecoration(
                    labelText: 'Block/sector/area',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: localityController,
                  decoration: InputDecoration(
                    labelText: 'District(optional)',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: pinCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Pincode',
                    counterText: "",
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateEmptyFields,
                  controller: area,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Area of Farm (in hectare)',
                    counterText: "",
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (this._formKey.currentState.validate()) {
                      address = housenumberController.text +
                          " " +
                          blockController.text +
                          " " +
                          localityController.text +
                          " " +
                          cityController.text;
                      try {
                        loc = Platform.isAndroid
                            ? await LocationService().getlatlong(address)
                            : await LocationService().getlatlongios(address);
                        log(loc[0].toString());
                        final kInitialPosition =
                            LatLng(loc[0].latitude, loc[0].longitude);
                        log(kInitialPosition.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: "AIzaSyBID3GwiWatoyrJC_o7jhrVGq-A2HV2Ohc",
                              onPlacePicked: (PickResult result) {
                                log(result.addressComponents.toString());
                                String placeid = result.placeId;
                                Navigator.of(context).pop();
                                handleNavigation_withsignup(placeid);
                              },
                              usePlaceDetailSearch: true,
                              selectInitialPosition: true,
                              initialPosition: kInitialPosition,
                              useCurrentLocation: false,
                            ),
                          ),
                        );
                      } catch (e) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Please enter a vaild Address"),
                                content: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side:
                                          BorderSide(color: global.mainColor)),
                                  child: Text(
                                    "Change Address",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Circular Std',
                                    ),
                                  ),
                                  color: global.mainColor,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            });
                      }
                    }
                  },
                  color: global.mainColor,
                  textColor: Colors.white,
                  child: Text("Confirm Address".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
