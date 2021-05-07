import 'package:farmtech/Screens/homeScreen.dart';
import 'package:farmtech/Screens/signupScreen.dart';
import 'package:farmtech/Services/sharedPrefService.dart';
import 'package:farmtech/Services/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:farmtech/global.dart' as global ; 


class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  void autoLogin() async {
    global.name = await SharePrefService().getName();
    int login = await SharePrefService().getLogin();
    if (login != 1) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignupScreen()));
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width:  300,
                child: Image.asset(
                  'assets/splashScreen.webp',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height:40,
              ),
              Text(
                "FarmTech",
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 12,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 15.0,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Circular Std',
                    color: global.mainColor),
              ),
              SizedBox(height: 10),
              Text(
                "Rider - Provider",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
    );
  }
}