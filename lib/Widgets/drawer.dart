import 'package:farmtech/Services/sharedPrefService.dart';
import 'package:farmtech/Services/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:farmtech/global.dart' as global;

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              height: SizeConfig.blockSizeVertical * 14,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      elevation: 3,
                      shadowColor: global.mainColor,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )),
              )),
          ListTile(
            title: global.name == null
                ? Text("Hi, Name !",
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))
                : Text(
                    "Hi, " + global.name + " !",
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
            subtitle: Text("Premium Member",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            onTap: () {},
          ),
          Divider(
            color: Colors.grey[220],
            thickness: 5,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PreviousOrderScreen()),
              // );
            },
            title: Text('Remote Monitoring',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          Divider(
            color: Colors.grey[225],
            thickness: 2.5,
          ),
          ListTile(
            onTap: () {
              //URLLauncherUtils.lauchCaller("9877588277");
            },
            title: Text('Report Bugs',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          Divider(
            color: Colors.grey[225],
            thickness: 2.5,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("Are you sure you want to Logout ? "),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: global.mainColor)),
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Circular Std',
                                ),
                              ),
                              color: global.mainColor,
                              textColor: Colors.white,
                              onPressed: () {
                                SharePrefService().resetLogin();
                                // global.token = "";
                                // Navigator.pop(context);
                                // Navigator.pop(context);
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => StartupScreen())
                                //         );
                              },
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: global.mainColor)),
                              child: Text(
                                "Cancel",
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
                          ],
                        ));
                  });
            },
            title: Text('Log Out',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          Divider(
            color: Colors.grey[225],
            thickness: 2.5,
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5.0),
                          elevation: 3,
                          shadowColor: global.mainColor,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              // child: IconButton(
                              //   onPressed: () {
                          
                              //   },
                              //   icon: Image.asset(
                              //     "assets/insta.png",
                              //     ),
                              // ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5.0),
                          elevation: 3,
                          shadowColor: global.mainColor,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              // child: IconButton(
                              //   onPressed: () {
                                  
                              //   },
                              //   icon: Icon(
                              //     LineIcons.globe,
                              //     color: Colors.green,
                              //     size: 30,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(5.0),
                          elevation: 3,
                          shadowColor: global.mainColor,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              // child: IconButton(
                              //   onPressed: () {
                                  
                              //   },
                              //   icon: Icon(
                              //     LineIcons.twitter,
                              //     color: Colors.blue,
                              //     size: 30,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () async {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "Term and Privacy Policy",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text(
                          "support@farmtech.com",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: Text(
                        " ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}