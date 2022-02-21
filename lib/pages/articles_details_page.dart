import 'package:flutter/material.dart';
import 'package:news_project/model/article_model.dart';
import 'package:news_project/model/news_sources.dart';
import 'package:webview_flutter/webview_flutter.dart';



class ArticlePage extends StatelessWidget {
  final Article article;
 ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
        body: WebView(
          initialUrl: article.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
    );
  }
}

class ShowSoursePage extends StatelessWidget {

  final Sources sources;
  ShowSoursePage({required this.sources});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WebView(
        initialUrl: sources.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


// class ArticlePage extends StatelessWidget {
//   final Article article;
//
//   const ArticlePage({required this.article});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(article.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             article.urlToImage != null ?
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//             ) :
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: const DecorationImage(
//                     image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Container(
//               padding: const EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               child: Text(
//                 article.source.name,
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Text(
//               article.description,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.0,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//}