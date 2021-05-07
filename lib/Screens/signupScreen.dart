import 'dart:developer';
import 'package:farmtech/Screens/farmAddress.dart';
import 'package:farmtech/Screens/loginScreen.dart';
import 'package:farmtech/Services/sharedPrefService.dart';
import 'package:farmtech/Services/sizeConfig.dart';
import 'package:farmtech/Widgets/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController mobilen = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _keyLoader1 = new GlobalKey<State>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future registerUser(String mobile, context) async {
    Dialogs.showLoadingDialog(context, _keyLoader);
    if (this._formKey.currentState.validate()) {
      log("registering");
      FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 120),
          phoneNumber: mobile,
          verificationCompleted: (PhoneAuthCredential authCredential) {
            _auth
                .signInWithCredential(authCredential)
                .then((UserCredential result) async {
              SharePrefService().setName(name.text);
              SharePrefService().setEmail(email.text);

              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddAddress(user: result)));
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            log(e.toString());
          },
          codeSent: (String verificationId, int resendToken) {
            Navigator.pop(context);
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => WillPopScope(
                      onWillPop: () async => false,
                      child: AlertDialog(
                        title: Text("Enter OTP"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: _codeController,
                              maxLength: 6,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          RaisedButton(
                            color: global.mainColor,
                            child: Text(
                              "Verify",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Dialogs.showLoadingDialog(
                                  _scaffoldKey.currentContext, _keyLoader1);
                              PhoneAuthCredential phoneAuthCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: _codeController.text);
                              _auth
                                  .signInWithCredential(phoneAuthCredential)
                                  .then((UserCredential result) async {
                                Navigator.pop(_scaffoldKey.currentContext);
                                SharePrefService().setName(name.text);
                                SharePrefService().setEmail(email.text);
                                Navigator.pushReplacement(
                                    _scaffoldKey.currentContext,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddAddress(user: result)));
                              });
                            },
                          ),
                          RaisedButton(
                            color: global.mainColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
            print(verificationId);
            print("Timout");
          });
    }
  }

  String _validateEmptyFields(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: global.mainColor, //Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: SizeConfig.blockSizeVertical * 15,
              left: 30,
              child: Text("Welcome",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              bottom: 3.8 * size.height / 5 - 4,
              right: 40,
              child: Container(
                height: 80.0,
                width: 80.0,
                child: Image.asset(
                  'assets/mainlogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 3.8 * size.height / 5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 12),
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "SIGN-UP",
                              style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(6.0, 6.0),
                                    blurRadius: 15.0,
                                    color: global.mainColor.withOpacity(0.3),
                                  ),
                                ],
                                fontSize: 34,
                                color: global.mainColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _validateEmptyFields,
                              controller: name,
                              style: TextStyle(color: global.mainColor),
                              cursorColor: global.mainColor,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: global.mainColor,
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: global.mainColor,
                                ),
                                contentPadding: EdgeInsets.all(8),
                                hintStyle: TextStyle(
                                  color: global.mainColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: global.mainColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _validateEmptyFields,
                              style: TextStyle(color: global.mainColor),
                              cursorColor: global.mainColor,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: global.mainColor,
                                ),
                                labelText: 'Email',
                                contentPadding: EdgeInsets.all(8),
                                hintStyle: TextStyle(
                                  color: global.mainColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: global.mainColor,
                                labelStyle: TextStyle(
                                    color: global.mainColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: password,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _validateEmptyFields,
                              style: TextStyle(color: global.mainColor),
                              cursorColor: global.mainColor,
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: global.mainColor,
                                ),
                                labelText: 'Password',
                                contentPadding: EdgeInsets.all(8),
                                hintStyle: TextStyle(
                                  color: global.mainColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: global.mainColor,
                                labelStyle: TextStyle(
                                    color: global.mainColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: mobilen,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _validateEmptyFields,
                              style: TextStyle(color: global.mainColor),
                              cursorColor: global.mainColor,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: global.mainColor,
                                ),
                                counterText: "",
                                labelText: 'Mobile',
                                contentPadding: EdgeInsets.all(8),
                                hintStyle: TextStyle(
                                  color: global.mainColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: global.mainColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: global.mainColor,
                                labelStyle: TextStyle(
                                    color: global.mainColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (this._formKey.currentState.validate()) {
                                    String phone = mobilen.text.trim();
                                    phone = "+91" + phone;
                                    //registerUser(phone, context);
                                  }
                                },
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                      global.mainColor,
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      global.mainColor,
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: global.mainColor)))),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already Have an Account, ',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3.2,
                                      color: global.mainColor,
                                      fontFamily: 'Circular Std'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    "Login instead",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.2,
                                        color: global.mainColor,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
