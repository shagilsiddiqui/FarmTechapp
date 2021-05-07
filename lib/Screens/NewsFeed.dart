import 'package:farmtech/Screens/chatbotScreen.dart';
import 'package:farmtech/Services/newsFeedService.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:farmtech/global.dart' as global;

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDEF9EF),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
          ),
          elevation: 10,
          title: Row(
            children: [
              Icon(
                LineIcons.newspaper,
                size: 30,
                color: global.mainColor,
              ),
              SizedBox(width: 20),
              Text("Curated Resources")
            ],
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.grey[700],
              size: 30,
            ),
            SizedBox(width: 40),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatBotScreen()),
                        );
                      },
                      textColor: Colors.white,
                      child: Text(
                          "For Any Help have Chat with SmartBOT".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    )),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: RaisedButton(
                      color: global.mainColor,
                      onPressed: () {},
                      textColor: Colors.white,
                      child: Text(
                          "Go Through Comprehensive tutorials".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    )),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Get all the Lastest Updates",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                FutureBuilder(
                    future: NewsService().getNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Image.network(
                                    snapshot.data.articles[index].urlToImage),
                                title:
                                    Text(snapshot.data.articles[index].title),
                                subtitle:
                                    Text(snapshot.data.articles[index].author),
                                trailing: Text("Readmore"),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}
