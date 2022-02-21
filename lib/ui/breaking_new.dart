

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/components/customeListTile.dart';
import 'package:news_project/model/article_model.dart';
import 'package:news_project/services/api_service.dart';
import 'package:news_project/ui/search_field.dart';

class ShowBreaingNews extends StatefulWidget {
  const ShowBreaingNews({Key? key}) : super(key: key);

  @override
  _ShowBreaingNewsState createState() => _ShowBreaingNewsState();
}

class _ShowBreaingNewsState extends State<ShowBreaingNews> {
  ApiService client = ApiService();
  late List<Article> article ;
  late List<Article> articleForDisplay;
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(query),
        builder: (BuildContext context,
            AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            article = snapshot.data!;
               return ListView.builder(
                itemCount: article.length + 1,
                itemBuilder: (context, index) {
                  return index==0 ? buildSearch() : customeListTile(article[index - 1], context);
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
    final news = await client.getArticle(query);
    if(!mounted) return;
    setState(() {
      this.query=query;
      articleForDisplay=news;
    });
  }

  // void searchNews(String query){
  //  final news= article.where((artNews){
  //    final titleLower= artNews.title.toLowerCase();
  //    final searchLower = query.toLowerCase();
  //    return titleLower.contains(searchLower);
  //  }).toList();
  //  setState(() {
  //    this.query=query;
  //    articleForDisplay= news;
  //  });
  // }

  // _searchBar(){
  //   return  Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextField(
  //       decoration: const InputDecoration(
  //         hintText: 'Search...'
  //       ),
  //       onChanged: (text) {
  //         text = text.toLowerCase();
  //         setState(() {
  //           articleForDisplay = article.where((art){
  //             var artTile= art.title.toLowerCase();
  //             return artTile.contains(text);
  //           }).toList();
  //         });
  //       },
  //
  //     ),
  //   );
  // }


}


