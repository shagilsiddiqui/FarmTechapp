import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:farmtech/Models/googlegeoCoding.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<List<Location>> getlatlong(String address) async {
    List<Location> locations = await locationFromAddress(address);
    return locations;
  }

  Future getPlaceMarkers(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
  }

  Future getlatlongios(String address) async {
    Dio dio = Dio();
    address = address.replaceAll("#", "%23");
    address = address.replaceAll(" ", "%20");
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=AIzaSyD2BbIwpNyP78sCs-nxA5x3QyVnQbAmPDc";
    Response response;
    try {
      response = await dio.get(
        url,
      );
    } on DioError catch (e) {
      print(e);
      return [];
    }
    if (response.statusCode == 200) {
      print(response.data.toString());
      List<Location> loc = [];
      GeocodingApi temp = GeocodingApi.fromJson(response.data);
      Location loca = Location(
          latitude: temp.results[0].geometry.location.lat,
          longitude: temp.results[0].geometry.location.lng,
          timestamp: DateTime.now());
      log(loca.toString());
      loc.add(loca);
      return loc;
    }
  }
}