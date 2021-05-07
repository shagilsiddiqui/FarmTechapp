import 'package:farmtech/Screens/homeScreen.dart';
import 'package:farmtech/Screens/signupScreen.dart';
import 'package:farmtech/Services/sharedPrefService.dart';
import 'package:farmtech/Services/sizeConfig.dart';
import 'package:farmtech/Widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  String _validateEmptyFields(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    return null;
  }

  String _validateMobileNUmber(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: global.mainColor,
          toolbarHeight: SizeConfig.blockSizeVertical * 10,
          title: Center(
            child: Text(
              "LOG IN",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: global.mainColor,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Text(
                    "Let's sign you in",
                    style: TextStyle(
                        color: global.mainColor,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(6.0, 6.0),
                            blurRadius: 15.0,
                            color: global.mainColor.withOpacity(0.3),
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Circular Std',
                        fontSize: SizeConfig.blockSizeHorizontal * 8.5),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1.5,
                  ),
                  Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                        color: global.mainColor.withOpacity(0.8),
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Circular Std',
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 7.5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: this._formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: mobile,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _validateMobileNUmber,
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
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 3,
                          ),
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
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          SizedBox(
                            width: double.infinity,
                              height: 45,
                            child: ElevatedButton(
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width / 4,
                                      vertical: 12.0),
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                            fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () async {
                                  if (this._formKey.currentState.validate()) {
                                    Dialogs.showLoadingDialog(
                                        context, _keyLoader);
                                    await SharePrefService()
                                        .setData(password.text, mobile.text);
                                    String res = "success" ; 
                                    if (res == "success") {
                                      SharePrefService().setLogin();
                                      Navigator.pop(context);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    } else {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                              'Please Check Login Id and Password'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Retry'),
                                              onPressed: () {
                                                int count = 0;
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return count++ == 2;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                }),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have an Account? ",
                                style: TextStyle(
                                    color: global.mainColor.withOpacity(0.8),
                                    fontFamily: 'Circular Std',
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.7),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: global.mainColor,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 1.4),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  // padding: EdgeInsets.all(0.0),
                                  onTap: () {
                                    //URLLauncherUtils.lauchCaller("9877588277");
                                  },
                                  child: Text(
                                    "Forgot Password? Contact Us",
                                    softWrap: true,
                                    style: TextStyle(
                                        color: global.mainColor,
                                        fontFamily: 'Circular Std',
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}