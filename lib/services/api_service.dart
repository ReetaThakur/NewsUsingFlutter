import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_project/model/article_model.dart';
import 'package:news_project/model/news_sources.dart';

class ApiService{
  final endPointUrl="newsapi.org";
  final client =http.Client();

  Future<List<Article>> getArticle(String query) async{
    final queryParameters = {
      'sources': 'techcrunch',
      'apiKey': 'c705e5d78ab6457c91de5209a7b229ec'
    };

    final uri =Uri.https(endPointUrl, '/v2/top-headlines',queryParameters);

    final response =await client.get(uri);

    Map<String ,dynamic> json= jsonDecode(response.body);
    List<dynamic> body =json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).where((news){
      final titleLower =news.title.toLowerCase();
      final searchLower= query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
    return articles;
  }

  Future<List<Sources>> getSources(String query) async{
    final queryParameter = {
      'apiKey': 'c705e5d78ab6457c91de5209a7b229ec'
    };

    final uri =Uri.https(endPointUrl, '/v2/top-headlines/sources',queryParameter);

    final response =await client.get(uri);

    Map<String ,dynamic> json= jsonDecode(response.body);
    List<dynamic> body =json['sources'];
    List<Sources> sources = body.map((dynamic item) => Sources.fromJson(item)).where((source){
      final titleLower =source.name.toLowerCase();
      final searchLower= query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
    return sources;
  }
}