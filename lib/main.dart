import 'package:flutter/material.dart';
import 'package:news_project/components/customeListTile.dart';
import 'package:news_project/model/article_model.dart';
import 'package:news_project/services/api_service.dart';
import 'package:news_project/ui/breaking_new.dart';
import 'package:news_project/ui/source_of_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: const Text("News App",
                    style: TextStyle(color: Colors.white)),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Breaking News',
                      icon: Icon(Icons.home),
                    ),
                    Tab(text: 'Source Of News',
                    icon: Icon(Icons.source),
                    ),
                  ],
                ),
                backgroundColor: Colors.black),
            body: const TabBarView(
              children: [
                  ShowBreaingNews(),
                  SourceOfNews()
              ],
            )),
      );
}
