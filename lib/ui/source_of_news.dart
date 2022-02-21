

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/news_sources.dart';
import 'package:news_project/services/api_service.dart';
import 'package:news_project/ui/search_field.dart';
import 'package:news_project/ui/sourcePage.dart';

class SourceOfNews extends StatefulWidget {
  const SourceOfNews({Key? key}) : super(key: key);

  @override
  _SourceOfNewsState createState() => _SourceOfNewsState();
}

class _SourceOfNewsState extends State<SourceOfNews> {
  ApiService client = ApiService();
  String query = '';
  late List<Sources> sources;
  late List<Sources> sourcesForDisplay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getSources(query),
        builder: (BuildContext context,
            AsyncSnapshot<List<Sources>> snapshot) {
          if (snapshot.hasData) {
             sources = snapshot.data!;
            return ListView.builder(
                itemCount: sources.length,
                itemBuilder: (context, index) {
                return index==0 ? buildSearch() :   SourcePage(sources[index-1], context);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text :query,
    hintText : 'Search with title',
    onChanged: searchNews,
  );


  Future searchNews(String query) async{
    final news = await client.getSources(query);
    if(!mounted) return;
    setState(() {
      this.query=query;
      sourcesForDisplay=news;
    });
  }
}
