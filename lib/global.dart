import 'package:flutter/material.dart';

List<String> stages = ['Crop Selection.' , 'Land Preparation' , "Seed Selection." , "Irrigation" , "Prest Control" ,"Fertilizing" , "Harvest"];

String name = "";
String mobile = " ";
String email;
Color mainColor = Color(0xff27C485);
Map<int, Color> color = {
  50: Color.fromRGBO(39,196,133, .1),
  100: Color.fromRGBO(39,196,133, .2),
  200: Color.fromRGBO(39,196,133, .3),
  300: Color.fromRGBO(39,196,133, .4),
  400: Color.fromRGBO(39,196,133, .5),
  500: Color.fromRGBO(39,196,133, .6),
  600: Color.fromRGBO(39,196,133, .7),
  700: Color.fromRGBO(39,196,133, .8),
  800: Color.fromRGBO(39,196,133, .9),
  900: Color.fromRGBO(39,196,133, 1),
};
MaterialColor colorCustom = MaterialColor(0xff27C485, color);

Color yellowCustom = Color(0xFFFFBA49) ;
//rgb(39,196,133)