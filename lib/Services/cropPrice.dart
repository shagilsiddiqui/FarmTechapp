import 'dart:convert';
import 'package:farmtech/Models/crop.dart';
import 'package:http/http.dart' as http;

class CropPrice {
  static final url =
      'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001679653f7f4534c205bef2f10c03326ea&format=json&offset=0&limit=30';
  static List<Crop> crops = [];
   Future<List<Crop>> fetchCropsData() async {
    try {
      List<Crop> crops = [];
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      final List docs = data['records'];
      docs.forEach((doc) => crops.add(Crop.fromJson(doc)));
      crops = crops;
      return crops;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
