
import 'dart:convert';

import 'package:farmtech/Models/NewFeed.dart';
import 'package:http/http.dart' as http;

class NewsService{
  Future<NewsFeed> getNews() async {
    String url ='https://newsapi.org/v2/everything?q=agriculture&from=2021-05-03&to=2021-05-03&sortBy=popularity&apiKey=674eff280c2b4cccb131b94f7ffb6758';
    final response = await http.get(Uri.parse(url));
     return NewsFeed.fromJson(json.decode(response.body));
  }
}