
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:farmtech/Models/weatherModel.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService{
  Future<Weather> getWeather() async {
    //Position position = await Geolocator.getLastKnownPosition();
    //print(position.toString());
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=' +
        "28.7041" +
        '&lon=' +
        "77.1025" +
        '&APPID=6adf87802066a3ee22591eb3f8abfe0c';
    final response = await http.get(Uri.parse(url));
     print(Weather.fromJson(json.decode(response.body)));
     return Weather.fromJson(json.decode(response.body));
  }
}